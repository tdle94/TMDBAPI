//
//  MovieRecommendation.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 12/19/21.
//

import Foundation

public struct MovieType: Decodable {
    public struct Result: Decodable, Identifiable  {
        public let id: Int
        public let adult: Bool
        public let backdropPath: String?
        public let posterPath: String?
        public let overview: String
        public let releaseDate: String
        public let genreIds: [Int]
        public let originalTitle: String
        public let originalLanguage: String
        public let title: String
        public let popularity: Double
        public let voteCount: Int
        public let video: Bool
        public let voteAverage: Double

        public var posterLink: String {
            return "https://image.tmdb.org/t/p/w200" + (posterPath ?? "")
        }

        public var displayObject: DisplayObject {
            return DisplayObject(id: id, type: .movie, title: title, posterLink: posterLink)
        }

        enum CodingKeys: String, CodingKey {
            case id, adult, overview, title, popularity, video
            case backdropPath = "backdrop_path"
            case posterPath = "poster_path"
            case releaseDate = "release_date"
            case genreIds = "genre_ids"
            case originalTitle = "original_title"
            case originalLanguage = "original_language"
            case voteCount = "vote_count"
            case voteAverage = "vote_average"
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

    public var displayObjects: [DisplayObject] {
        return results.compactMap { $0.displayObject }
    }

    public init() {
        page = -1
        results = []
        totalPages = -1
        totalResults = -1
    }
}
