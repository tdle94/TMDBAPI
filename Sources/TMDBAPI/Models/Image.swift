//
//  Image.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 12/19/21.
//

import Foundation

public struct TMDBImage: Decodable {
    public let backdrops: [Backdrop]
    public let posters: [Backdrop]
    public let logos: [Backdrop]

    public var backdropLinks: [String] {
        return backdrops.compactMap { "https://image.tmdb.org/t/p/original/" + ($0.filePath ?? "") }
    }

    public var posterLinks: [String] {
        return posters.compactMap { "https://image.tmdb.org/t/p/original/" + ($0.filePath ?? "") }
    }
    
    enum CodingKeys: String, CodingKey {
        case backdrops, posters, logos
    }

    public init() {
        backdrops = []
        posters = []
        logos = []
    }
    
    public init(from: Decoder) throws {
        let container = try from.container(keyedBy: CodingKeys.self)
        backdrops = try container.decodeIfPresent([Backdrop].self, forKey: .backdrops) ?? []
        posters = try container.decodeIfPresent([Backdrop].self, forKey: .posters) ?? []
        logos = try container.decodeIfPresent([Backdrop].self, forKey: .logos) ?? []
    }
}
