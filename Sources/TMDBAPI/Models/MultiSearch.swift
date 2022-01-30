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
        public let mediaType: String
        public var posterLink: String {
            return "https://image.tmdb.org/t/p/original/" + (posterPath ?? "")
        }
        
        public var displayObject: EntityTypeDisplay {
            return EntityTypeDisplay(id: id, title: title, subtitle: overview, posterLink: posterLink, type: .init(rawValue: mediaType) ?? .movie)
        }
        
        enum CodingKeys: String, CodingKey {
            case id, title, overview
            case posterPath = "poster_path"
            case mediaType = "media_type"
        }

        public init(from: Decoder) throws {
            let container = try from.container(keyedBy: CodingKeys.self)
            posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath) ?? ""
            title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
            overview = try container.decodeIfPresent(String.self, forKey: .overview) ?? ""
            id = try container.decode(Int.self, forKey: .id)
            mediaType = try container.decode(String.self, forKey: .mediaType)
        }
    }
    public let page: Int
    public let totalResults: Int
    public let totalPages: Int
    public let results: [Result]

    public var displayObjects: [EntityTypeDisplay] {
        return results.compactMap { $0.displayObject }.filter { !$0.title.isEmpty }
    }

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
