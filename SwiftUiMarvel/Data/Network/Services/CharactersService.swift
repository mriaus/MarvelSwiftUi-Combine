//
//  HomeService.swift
//  SwiftUiMarvel
//
//  Created by Marcos on 8/11/23.
//

import Foundation
import Combine

protocol CharactersServiceProtocol{
    func getAllCharacters(limit: String?, offset: String?) -> AnyPublisher<CharacterDTO, Error>
    func getCharacterById() -> AnyPublisher<Character, Error>
}

struct CharactersService: CharactersServiceProtocol {    
    func getAllCharacters(limit: String?, offset: String?) -> AnyPublisher<CharacterDTO, Error> {
        let urlCharacters = "\(server)\(endpoints.characters.rawValue)"
        
        var urlComponents = URLComponents(string: urlCharacters)!
        urlComponents.queryItems = [
            URLQueryItem(name: "orderBy", value: "modified"), //Maybe change
            URLQueryItem(name: "limit", value: limit),
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
            .decode(type: CharacterDTO.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        

    }
    
    func getCharacterById() -> AnyPublisher<Character, Error> {
        fatalError("Unimplemented error")
    }
}

//TODO: Test the mocked service
struct CharactersFakeService: CharactersServiceProtocol {
    func getAllCharacters(limit: String?, offset: String?) -> AnyPublisher<CharacterDTO, Error> {
       
        let mockCharacterDTO = mockCharacterDTO
        
        let future = Future<CharacterDTO, Error> { promise in
               promise(.success(mockCharacterDTO))
           }
        return future.eraseToAnyPublisher()

    }
    
    func getCharacterById() -> AnyPublisher<Character, Error> {
        fatalError("Unimplemented error")
    }
    
}
