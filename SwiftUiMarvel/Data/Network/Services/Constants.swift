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
let TS = "1"
let APIKEY = "96933f07b708fd5431b0c47deed944d5"
let HASH = "35a343b7c477bef9a0bf5eb933b523b2"
