//
//  TVType.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 12/21/21.
//

import Foundation

public struct TVType: Decodable {
    public struct Result: Decodable {
        let id: Int
        let name: String
        let popularity: Double
        let overview: String
        let posterPath: String?
        let backdropPath: String?
        let voteAverage: Double
        let voteCount: Int
        let firstAirDate: String?
        let originCountry: [String]
        let genreIds: [Int]
        let originalLanguage: String
        let originalName: String
        
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

    let page: Int
    let results: [Result]
    let totalPages: Int
    let totalResults: Int
}
