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

    
    // MARK: - Welcome
    struct SerieDTO: Codable {
        let code: Int?
        let status, copyright, attributionText, attributionHTML: String?
        let etag: String?
        let data: SerieDataClass?
    }
    
    // MARK: - DataClass
    struct SerieDataClass: Codable {
        let offset, limit, total, count: Int?
        let results: [SerieResult]?
    }
    
    // MARK: - Result
    struct SerieResult: Codable {
        let id: Int?
        let title: String?
        let description: String?
        let resourceURI: String?
        let urls: [URLElement]?
        let startYear, endYear: Int?
        let rating, type: String?
        let modified: String?
        let thumbnail: Thumbnail?
        let creators: SerieCreators?
        let characters: SerieCharacters?
        let stories: Stories?
        let comics, events: SerieCharacters?
        let next, previous: SerieNext?
    }
    
    // MARK: - Characters
    struct SerieCharacters: Codable {
        let available: Int?
        let collectionURI: String?
        let items: [SerieNext]?
        let returned: Int?
    }
    
    // MARK: - Next
    struct SerieNext: Codable {
        let resourceURI: String?
        let name: String?
    }
    
    // MARK: - Creators
    struct SerieCreators: Codable {
        let available: Int?
        let collectionURI: String?
        let items: [SerieCreatorsItem]?
        let returned: Int?
    }
    
    // MARK: - CreatorsItem
    struct SerieCreatorsItem: Codable {
        let resourceURI: String?
        let name, role: String?
    }
    
    // MARK: - Stories
    struct SerieStories: Codable {
        let available: Int?
        let collectionURI: String?
        let items: [SerieStoriesItem]?
        let returned: Int?
    }
    
    // MARK: - StoriesItem
    struct SerieStoriesItem: Codable {
        let resourceURI: String?
        let name: String?
        let type: SerieTypeEnum?
    }
    
    enum SerieTypeEnum: String, Codable {
        case cover = "cover"
        case empty = ""
        case interiorStory = "interiorStory"
    }
    
    // MARK: - Thumbnail
    struct SerieThumbnail: Codable {
        let path: String?
        let thumbnailExtension: String?
        
        enum SerieCodingKeys: String, CodingKey {
            case path
            case thumbnailExtension
        }
    }
    
    // MARK: - URLElement
    struct SerieURLElement: Codable {
        let type: String?
        let url: String?
    }

let mockSerieDTO = SerieDTO(code: 200, status: "200", copyright: "Copy", attributionText: "", attributionHTML: "", etag: "", data: serieData)

let serieData: SerieDataClass = SerieDataClass(offset: 0, limit: 0, total: 3, count: 3, results: [serie1, serie2, serie3])

let serie1 = SerieResult(id: 1, title: "title1", description: "description1", resourceURI: "", urls: [], startYear: 1900, endYear: 1991, rating: "", type: nil, modified: nil, thumbnail: nil, creators: nil, characters: nil, stories: nil, comics: nil, events: nil, next: nil, previous: nil)

let serie2 = SerieResult(id: 2, title: "title2", description: "description1", resourceURI: "", urls: [], startYear: 1900, endYear: 1992, rating: "", type: nil, modified: nil, thumbnail: nil, creators: nil, characters: nil, stories: nil, comics: nil, events: nil, next: nil, previous: nil)

let serie3 = SerieResult(id: 3, title: "title3", description: "description1", resourceURI: "", urls: [], startYear: 1900, endYear: 1993, rating: "", type: nil, modified: nil, thumbnail: nil, creators: nil, characters: nil, stories: nil, comics: nil, events: nil, next: nil, previous: nil)
