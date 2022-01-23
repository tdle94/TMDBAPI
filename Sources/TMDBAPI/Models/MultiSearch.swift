//
//  File.swift
//  
//
//  Created by Tuyen Le on 1/20/22.
//

import Foundation

public struct MultiSearch: Decodable {
    public struct Result: Decodable, Hashable, Identifiable {
        public let id: Int
        public let posterPath: String?
        public let title: String
        public let overview: String
        
        public var posterLink: String {
            return "https://image.tmdb.org/t/p/original/" + (posterPath ?? "")
        }
        
        enum CodingKeys: String, CodingKey {
            case id, title, overview
            case posterPath = "poster_path"
        }

        public init(from: Decoder) throws {
            let container = try from.container(keyedBy: CodingKeys.self)
            posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath) ?? ""
            title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
            overview = try container.decodeIfPresent(String.self, forKey: .overview) ?? ""
            id = try container.decode(Int.self, forKey: .id)
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
