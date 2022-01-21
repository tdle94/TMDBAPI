//
//  File.swift
//  
//
//  Created by Tuyen Le on 1/20/22.
//

import Foundation

struct MultiSearch: Decodable {
    struct Result: Decodable {
        let posterPath: String
        let title: String
        let overview: String
        
        enum CodingKeys: String, CodingKey {
            case title, overview
            case posterPath = "poster_path"
        }

        init(from: Decoder) throws {
            let container = try from.container(keyedBy: CodingKeys.self)
            posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath) ?? ""
            title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
            overview = try container.decodeIfPresent(String.self, forKey: .overview) ?? ""
        }
    }
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
