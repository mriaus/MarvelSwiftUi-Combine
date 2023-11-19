//
//  UseCaseSeriesList.swift
//  SwiftUiMarvel
//
//  Created by Marcos on 16/11/23.
//

import Foundation
import Combine
final class UseCaseSeriesList: UseCaseSeriesListProtocol {

    @Published var series: [Serie] = []
    private var cancellables = Set<AnyCancellable>()
    
    
    func loadSeries(offset: String?, character: String?) -> AnyPublisher<SerieDTO, Error> {
        return SeriesService().getSeriesByCharacter(offset: offset ?? "0", character: character ?? "")
    }
    
    func loadSeriesFake(offset: String?, character: String) -> AnyPublisher<SerieDTO, Error> {
        return SeriesFakeService().getSeriesByCharacter(offset: offset ?? "0", character: character)
    }
    
}
