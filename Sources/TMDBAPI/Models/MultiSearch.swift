//
//  File.swift
//  
//
//  Created by Tuyen Le on 1/20/22.
//

import Foundation

public struct MultiSearch: Decodable {
    public struct Result: Decodable {
        public let posterPath: String
        public let title: String
        public let overview: String
        
        enum CodingKeys: String, CodingKey {
            case title, overview
            case posterPath = "poster_path"
        }

        public init(from: Decoder) throws {
            let container = try from.container(keyedBy: CodingKeys.self)
            posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath) ?? ""
            title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
            overview = try container.decodeIfPresent(String.self, forKey: .overview) ?? ""
        }
    }
    public let page: Int
    public let totalResults: Int
    public let totalPages: Int
    public let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
