//
//  Extension+URLResponse.swift
//  SwiftUiMarvel
//
//  Created by Marcos on 8/11/23.
//

import Foundation

extension URLResponse {
    
    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}
