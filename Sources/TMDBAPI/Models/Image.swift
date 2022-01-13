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
}
