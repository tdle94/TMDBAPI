//
//  MovieDetail.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 10/23/21.
//

import Foundation

public struct MovieDetail: Decodable {
    public let id: Int
    public let imdbId: String?
    public let adult: Bool
    public let backdropPath: String?
    public let genres: [Genre]
    public let homepage: String?
    public let originalLanguage: String
    public let originalTitle: String
    public let overview: String?
    public let popularity: Double
    public let posterPath: String?
    public let productionCompanies: [ProductionCompany]
    public let productionCountries: [ProductionCountry]
    public let releaseDate: String
    public let revenue: Int
    public let runtime: Int?
    public let status: String
    public let tagline: String
    public let title: String
    public let video: Bool
    public let voteAverage: Double
    public let voteCount: Int

    public var posterLink: String {
        return "https://image.tmdb.org/t/p/original/" + (posterPath ?? "")
    }

    public var backdropLink: String {
        return "https://image.tmdb.org/t/p/original/" + (backdropPath ?? "")
    }

    enum CodingKeys: String, CodingKey {
        case id, adult, genres, homepage, overview, popularity, revenue, runtime, status, tagline, title, video
        case imdbId = "imdb_id"
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

