//
//  TVType.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 12/21/21.
//

import Foundation

public struct TVType: Decodable {
    public struct Result: Decodable {
        public let id: Int
        public let name: String
        public let popularity: Double
        public let overview: String
        public let posterPath: String?
        public let backdropPath: String?
        public let voteAverage: Double
        public let voteCount: Int
        public let firstAirDate: String?
        public let originCountry: [String]
        public let genreIds: [Int]
        public let originalLanguage: String
        public let originalName: String
        
        enum CodingKeys: String, CodingKey {
            case id, name, popularity, overview
            case posterPath = "poster_path"
            case backdropPath = "backdrop_path"
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
            case firstAirDate = "first_air_date"
            case originCountry = "origin_country"
            case genreIds = "genre_ids"
            case originalLanguage = "original_language"
            case originalName = "original_name"
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }

    public let page: Int
    public let results: [Result]
    public let totalPages: Int
    public let totalResults: Int
}
