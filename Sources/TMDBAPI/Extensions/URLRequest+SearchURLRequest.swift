//
//  File.swift
//  
//
//  Created by Tuyen Le on 1/20/22.
//

import Foundation

protocol SearchURLRequest {
    static func multiSearch(language: String, region: String, page: Int, includeAdult: Bool, query: String) -> URLRequest
}

extension URLRequest: SearchURLRequest {
    static func multiSearch(language: String, region: String, page: Int, includeAdult: Bool, query: String) -> URLRequest {
        var components = urlComponent
        components.path = "3/search/multi"
        components.queryItems?.append(URLQueryItem(name: "language", value: language))
        components.queryItems?.append(URLQueryItem(name: "page", value: "\(page)"))
        components.queryItems?.append(URLQueryItem(name: "include_adult", value: "\(includeAdult)"))
        components.queryItems?.append(URLQueryItem(name: "region", value: region))
        components.queryItems?.append(URLQueryItem(name: "query", value: query))
        return URLRequest(url: components.url!)
    }
}
