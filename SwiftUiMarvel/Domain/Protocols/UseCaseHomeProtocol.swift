//
//  useCaseHomeProtocol.swift
//  SwiftUiMarvel
//
//  Created by Marcos on 8/11/23.
//

import Foundation
import Combine

protocol UseCaseHomeProtocol {
    func loadCharacters(limit: String?, offset: String?) -> AnyPublisher<CharacterDTO, Error>
}
