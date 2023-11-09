//
//  UseCaseHome.swift
//  SwiftUiMarvel
//
//  Created by Marcos on 8/11/23.
//

import Foundation
import Combine
final class UseCaseHome: UseCaseHomeProtocol {
    
    let charactersService = CharactersService()
    @Published var characters: [Character] = []
    private var cancellables = Set<AnyCancellable>()
    
    
    func loadCharacters(limit: String?, offset: String?) -> AnyPublisher<CharacterDTO, Error> {
        return charactersService.getAllCharacters(limit: limit, offset: offset)
    }
    
    
}
