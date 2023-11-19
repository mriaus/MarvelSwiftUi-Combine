//
//  DetailService.swift
//  SwiftUiMarvel
//
//  Created by Marcos on 8/11/23.
//

import Foundation
import Combine

protocol SeriesServiceProtocol{
    func getSeriesByCharacter(offset: String, character:String) -> AnyPublisher<SerieDTO, Error>
}

struct SeriesService: SeriesServiceProtocol {
    func getSeriesByCharacter(offset: String, character: String) -> AnyPublisher<SerieDTO, Error> {
        let urlSeries = "\(server)\(endpoints.series.rawValue)"
        var urlComponents = URLComponents(string: urlSeries)!
        
        urlComponents.queryItems = [
            URLQueryItem(name: "orderBy", value: "modified"),
            URLQueryItem(name: "limit", value: "100"),
            URLQueryItem(name: "characters", value: character),

            URLQueryItem(name: "offset", value: offset),
            URLQueryItem(name: "ts", value: TS),
            URLQueryItem(name: "apikey", value: APIKEY),
            URLQueryItem(name: "hash", value: HASH)
        ]
        
        var request: URLRequest = URLRequest(url: urlComponents.url!)
        request.httpMethod = HTTPMethods.get
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: SerieDTO.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

struct SeriesFakeService: SeriesServiceProtocol {
    func getSeriesByCharacter(offset: String, character: String) -> AnyPublisher<SerieDTO, Error> {
        let mockSerieDTO = mockSerieDTO
        
        let future = Future<SerieDTO, Error> { promise in
               promise(.success(mockSerieDTO))
           }
        return future.eraseToAnyPublisher()

    }
    
    
}
