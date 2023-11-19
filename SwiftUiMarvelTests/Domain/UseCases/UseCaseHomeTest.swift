//
//  UseCaseHomeTest.swift
//  SwiftUiMarvelTests
//
//  Created by Marcos on 14/11/23.
//

import XCTest
import Combine
@testable import SwiftUiMarvel

final class UseCaseHomeTest: XCTestCase {
    @Published var characters: [Character] = []
    var suscriptors = Set<AnyCancellable>()

    override func tearDownWithError() throws {
        characters = []
    }
    
    func testUseCaseHomeGetCharacters() throws {
        let useCase = UseCaseHome()
        
        useCase.loadCharactersFake(limit: "0", offset: "10")
            .sink { completion in
                //Completion
                print("Completion vm -> \(completion)")
            } receiveValue: {[weak self] characterDTO in
                    if let results = characterDTO.data?.results {
                        results.forEach{
                            self?.characters.append( Character(id: $0.id!, name: $0.name, description: $0.description, image: "\(String(describing: $0.thumbnail?.path ?? "" )).\($0.thumbnail?.thumbnailExtension?.rawValue ?? "")"))
                        }
                    }else{
                        //TODO: Do something
                        print("Error")
                    }
            }
            .store(in: &suscriptors)
        
        XCTAssertEqual(characters.count, 3)
        XCTAssertNotNil(characters)
    }
}
