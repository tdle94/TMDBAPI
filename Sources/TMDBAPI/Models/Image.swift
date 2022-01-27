//
//  Image.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 12/19/21.
//

import Foundation

public struct TMDBImage: Decodable {
    public let id: Int
    public let backdrops: [Backdrop]
    public let posters: [Backdrop]

    public var backdropLinks: [String] {
        return backdrops.compactMap { "https://image.tmdb.org/t/p/original/" + ($0.filePath ?? "") }
    }

    public var posterLinks: [String] {
        return posters.compactMap { "https://image.tmdb.org/t/p/original/" + ($0.filePath ?? "") }
    }
    
    enum CodingKeys: String, CodingKey {
        case id, backdrops, posters
    }
    
    public init(from: Decoder) throws {
        let container = try from.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? -1
        backdrops = try container.decodeIfPresent([Backdrop].self, forKey: .backdrops) ?? []
        posters = try container.decodeIfPresent([Backdrop].self, forKey: .posters) ?? []
    }
}
