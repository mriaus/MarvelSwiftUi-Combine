//
//  UseCaseHome.swift
//  SwiftUiMarvel
//
//  Created by Marcos on 8/11/23.
//

import Foundation
import Combine
final class UseCaseHome: UseCaseHomeProtocol {
    
    @Published var characters: [Character] = []
    private var cancellables = Set<AnyCancellable>()
    
    
    func loadCharacters(limit: String?, offset: String?) -> AnyPublisher<CharacterDTO, Error> {
        return CharactersService().getAllCharacters(limit: limit, offset: offset)
    }
    
    func loadCharactersFake(limit: String?, offset: String?) -> AnyPublisher<CharacterDTO, Error> {
        return CharactersFakeService().getAllCharacters(limit: limit, offset: offset)
    }
    
}
