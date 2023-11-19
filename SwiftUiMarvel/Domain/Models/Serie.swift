//
//  Serie.swift
//  SwiftUiMarvel
//
//  Created by Marcos on 16/11/23.
//

import Foundation

struct Serie: Identifiable, Hashable{
    let id: Int
    let name:String?
    let description: String?
    let image: String?
    let startYear: Int?
    let endYear: Int?
    let rating: String?
}
