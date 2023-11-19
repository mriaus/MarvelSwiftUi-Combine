//
//  UseCaseSeriesTest.swift
//  SwiftUiMarvelTests
//
//  Created by Marcos on 19/11/23.
//

import XCTest
import Combine
@testable import SwiftUiMarvel
final class UseCaseSeriesTest: XCTestCase {
    @Published var series: [Serie] = []
    var suscriptors = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        series = []
    }

    func testUseCaseHomeGetSeriesByCharacter() throws {
        let useCase = UseCaseSeriesList()
        
        useCase.loadSeriesFake(offset: "0", character: "hulk")
            .sink { completion in
                //Completion
                print("Completion vm -> \(completion)")
            } receiveValue: {[weak self] characterDTO in
                    if let results = characterDTO.data?.results {
                        results.forEach{
                            self?.series.append( Serie(id: $0.id!, name: $0.title, description: $0.description, image: "\(String(describing: $0.thumbnail?.path ?? "" )).\($0.thumbnail?.thumbnailExtension?.rawValue ?? "")", startYear: $0.startYear, endYear: $0.endYear, rating: ""))
                        }
                    }else{
                        //TODO: Do something
                        self?.series = []
                    }
            }
            .store(in: &suscriptors)
        
        XCTAssertEqual(series.count, 3)
        XCTAssertNotNil(series)
    }

}
