//
//  CharacterModelTest.swift
//  SwiftUiMarvelTests
//
//  Created by Marcos on 14/11/23.
//

import XCTest
@testable import SwiftUiMarvel

final class CharacterModelTest: XCTestCase {

    func testModelWithAllPropertiesNotNill() throws {
        let model = Character(id: 12, name: "Test", description: "Desc", image: "Image")
        
        XCTAssertNotNil(model, "UserIsNotNull")
    }
    
    func testModelWithAllPorpertiesThePropertiesDontChange() throws {
        let model = Character(id: 12, name: "Test", description: "Desc", image: "Image")
        
        XCTAssertEqual(model.id, 12)
        XCTAssertEqual(model.name, "Test")
        XCTAssertEqual(model.description, "Desc")
        XCTAssertEqual(model.image, "Image")

    }
    
    func testModelWithNilsWorks() throws {
        let model = Character(id: nil, name: nil, description: nil, image: nil)
        
        XCTAssertEqual(model.id, nil)
        XCTAssertEqual(model.name, nil)
        XCTAssertEqual(model.description, nil)
        XCTAssertEqual(model.image, nil)
    }
}
