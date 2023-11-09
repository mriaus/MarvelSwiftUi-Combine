//
//  SerieDTO.swift
//  SwiftUiMarvel
//
//  Created by Marcos on 8/11/23.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

struct SerieDTO{
    
    // MARK: - Welcome
    struct Welcome: Codable {
        let code: Int?
        let status, copyright, attributionText, attributionHTML: String?
        let etag: String?
        let data: DataClass?
    }
    
    // MARK: - DataClass
    struct DataClass: Codable {
        let offset, limit, total, count: Int?
        let results: [Result]?
    }
    
    // MARK: - Result
    struct Result: Codable {
        let id: Int?
        let title: String?
        let description: String?
        let resourceURI: String?
        let urls: [URLElement]?
        let startYear, endYear: Int?
        let rating, type: String?
        let modified: Date?
        let thumbnail: Thumbnail?
        let creators: Creators?
        let characters: Characters?
        let stories: Stories?
        let comics, events: Characters?
        let next, previous: Next?
    }
    
    // MARK: - Characters
    struct Characters: Codable {
        let available: Int?
        let collectionURI: String?
        let items: [Next]?
        let returned: Int?
    }
    
    // MARK: - Next
    struct Next: Codable {
        let resourceURI: String?
        let name: String?
    }
    
    // MARK: - Creators
    struct Creators: Codable {
        let available: Int?
        let collectionURI: String?
        let items: [CreatorsItem]?
        let returned: Int?
    }
    
    // MARK: - CreatorsItem
    struct CreatorsItem: Codable {
        let resourceURI: String?
        let name, role: String?
    }
    
    // MARK: - Stories
    struct Stories: Codable {
        let available: Int?
        let collectionURI: String?
        let items: [StoriesItem]?
        let returned: Int?
    }
    
    // MARK: - StoriesItem
    struct StoriesItem: Codable {
        let resourceURI: String?
        let name: String?
        let type: TypeEnum?
    }
    
    enum TypeEnum: String, Codable {
        case cover = "cover"
        case empty = ""
        case interiorStory = "interiorStory"
    }
    
    // MARK: - Thumbnail
    struct Thumbnail: Codable {
        let path: String?
        let thumbnailExtension: String?
        
        enum CodingKeys: String, CodingKey {
            case path
            case thumbnailExtension
        }
    }
    
    // MARK: - URLElement
    struct URLElement: Codable {
        let type: String?
        let url: String?
    }
}
