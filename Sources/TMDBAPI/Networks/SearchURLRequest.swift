//
//  File.swift
//  
//
//  Created by Tuyen Le on 1/20/22.
//

import Foundation

enum Search {
    case multiSearch(language: String, region: String, page: Int, includeAdult: Bool, query: String)
    
    var urlRequest: URLRequest {
        switch self {
        case let .multiSearch(language, region, page, includeAdult, query):
            return .multiSearch(language: language, region: region, page: page, includeAdult: includeAdult, query: query)
        }
    }
}
