//
//  Constants.swift
//  SwiftUiMarvel
//
//  Created by Marcos on 8/11/23.
//

import Foundation


let server = "https://gateway.marvel.com"

struct HTTPMethods {
    static let post = "POST"
    static let get = "GET"
    static let put = "PUT"
    static let delete = "DELETE"
}
let contentType = "application/json"

enum endpoints: String {
    case characters = "/v1/public/characters"
    case series = "/v1/public/series"
}

let TS = ""
let APIKEY = ""
let HASH = ""
