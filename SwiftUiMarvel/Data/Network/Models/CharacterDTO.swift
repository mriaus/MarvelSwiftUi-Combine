// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct CharacterDTO: Codable {
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
    let name, description: String?
    let modified: String? //Changed to string to decode
    let thumbnail: Thumbnail?
    let resourceURI: String?
    let comics, series: Comics?
    let stories: Stories?
    let events: Comics?
    let urls: [URLElement]?
}

// MARK: - Comics
struct Comics: Codable {
    let available: Int?
    let collectionURI: String?
    let items: [ComicsItem]?
    let returned: Int?
}

// MARK: - ComicsItem
struct ComicsItem: Codable {
    let resourceURI: String?
    let name: String?
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
    let type: String?
}



// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String?
    let thumbnailExtension: Extension?

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension
    }
}

enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
}

// MARK: - URLElement
struct URLElement: Codable {
    let type: URLType?
    let url: String?
}

enum URLType: String, Codable {
    case comiclink = "comiclink"
    case detail = "detail"
    case wiki = "wiki"
}


let mockCharacterDTO = CharacterDTO(code: 200, status: "200", copyright: "", attributionText: "", attributionHTML: "", etag: "", data: data)

let data: DataClass = DataClass(offset: 0, limit: 0, total: 3, count: 3, results: [character1, character2, character3])

let character1 = Result(id: 1, name: "Character1", description: "Character1Desc", modified: "Never", thumbnail: mockThumbnail, resourceURI: "", comics: nil, series: nil, stories: nil, events: nil, urls: nil)
let character2 = Result(id: 2, name: "Character2", description: "Character2Desc", modified: "Never", thumbnail: nil, resourceURI: nil, comics: nil, series: nil, stories: nil, events: nil, urls: nil)
let character3 = Result(id: 3, name: "Character3", description: "Character3Desc", modified: "never", thumbnail: nil, resourceURI: nil, comics: nil, series: nil, stories: nil, events: nil, urls: nil)

let mockThumbnail: Thumbnail = Thumbnail(path: "", thumbnailExtension: Extension.jpg)
