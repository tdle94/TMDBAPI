//
//  Backdrop.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 12/19/21.
//

import Foundation

public struct Backdrop: Decodable {
    public let aspectRatio: Double
    public let filePath: String?
    public let height: Int
    public let width: Int
    public let iso6391: String?
    public let voteAverage: Int
    public let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case width, height
        case aspectRatio = "aspect_ratio"
        case filePath = "file_path"
        case iso6391 = "iso_639_1"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
