//
//  SerieModelTest.swift
//  SwiftUiMarvelTests
//
//  Created by Marcos on 19/11/23.
//

import XCTest
@testable import SwiftUiMarvel

final class SerieModelTest: XCTestCase {
    
    func testModelWithAllPropertiesNotNill() throws {
        let model = Serie(id: 12, name: "Test", description: "Desc", image: "Image", startYear: 2,endYear: 4,rating: "")
        
        XCTAssertNotNil(model, "SerieIsNotNil")
    }
    
    func testModelWithAllPorpertiesThePropertiesDontChange() throws {
        let model = Serie(id: 12, name: "Test", description: "Desc", image: "Image", startYear: 2,endYear: 4,rating: "rating")
        
        XCTAssertEqual(model.id, 12)
        XCTAssertEqual(model.name, "Test")
        XCTAssertEqual(model.description, "Desc")
        XCTAssertEqual(model.image, "Image")
        XCTAssertEqual(model.startYear, 2)
        XCTAssertEqual(model.endYear, 4)
        XCTAssertEqual(model.rating, "rating")
    }
    
    func testModelWithNilsWorks() throws {
        let model = Serie(id: 12, name: nil, description: nil, image: nil, startYear: nil,endYear: nil,rating: nil)

        XCTAssertNotNil(model, "SerieIsNotNil")
        XCTAssertNotEqual(model.id, nil)
        XCTAssertEqual(model.name, nil)
        XCTAssertEqual(model.description, nil)
        XCTAssertEqual(model.image, nil)
        XCTAssertEqual(model.startYear, nil)
        XCTAssertEqual(model.endYear, nil)
        XCTAssertEqual(model.rating, nil)
    }

}
