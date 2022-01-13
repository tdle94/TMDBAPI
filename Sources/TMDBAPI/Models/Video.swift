//
//  Video.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 12/19/21.
//

import Foundation

public struct Video: Decodable {
    public struct Result: Decodable {
        public let id: String
        public let iso6391: String
        public let iso31661: String
        public let name: String
        public let key: String
        public let site: String
        public let size: Int
        public let type: String
        public let official: Bool
        public let publishedAt: String
        
        enum CodingKeys: String, CodingKey {
            case id, name, key, site, size, type, official
            case iso6391 = "iso_639_1"
            case iso31661 = "iso_3166_1"
            case publishedAt = "published_at"
        }
    }

    public let id: Int
    public let results: [Result]
}
