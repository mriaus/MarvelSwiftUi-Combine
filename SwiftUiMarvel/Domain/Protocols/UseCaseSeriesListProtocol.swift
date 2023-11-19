//
//  UseCaseSeriesList.swift
//  SwiftUiMarvel
//
//  Created by Marcos on 16/11/23.
//

import Foundation
import Combine

protocol UseCaseSeriesListProtocol {
    func loadSeries(offset: String?, character: String?) -> AnyPublisher<SerieDTO, Error>
}

