//
//  Image.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 12/19/21.
//

import Foundation

public struct TMDBImage: Decodable {
    public let id: Int?
    public let backdrops: [Backdrop]
    public let posters: [Backdrop]

    public var backdropLinks: [String] {
        return backdrops.compactMap { "https://image.tmdb.org/t/p/original/" + ($0.filePath ?? "") }
    }

    public var posterLinks: [String] {
        return posters.compactMap { "https://image.tmdb.org/t/p/original/" + ($0.filePath ?? "") }
    }
}
