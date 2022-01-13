//
//  URLRequest+.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 12/19/21.
//

import Foundation

extension URLRequest {
    static var apiKey = "6823a37cea296ab67c0a2a6ce3cb4ec5"

    static var urlComponent: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey)
        ]
        return components
    }
}
