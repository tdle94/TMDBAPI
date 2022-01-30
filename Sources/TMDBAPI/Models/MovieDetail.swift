//
//  MovieDetail.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 10/23/21.
//

import Foundation

public struct MovieDetail: Decodable {
    public let id: Int
    public let imdbId: String
    public let adult: Bool
    public let backdropPath: String
    public let budget: Int
    public let genres: [Genre]
    public let homepage: String
    public let originalLanguage: String
    public let originalTitle: String
    public let overview: String
    public let popularity: Double
    public let posterPath: String
    public let productionCompanies: [ProductionCompany]
    public let productionCountries: [ProductionCountry]
    public let releaseDate: String
    public let revenue: Int
    public let runtime: Int
    public let status: String
    public let tagline: String
    public let title: String
    public let video: Bool
    public let voteAverage: Double
    public let voteCount: Int
    public let images: TMDBImage
    public let similar: MovieType
    public let recommendations: MovieType
    public let credits: Credit

    public var displayObject: QuickDisplay {
        return DisplayDetail(id: id,
                             title: title,
                             overview: overview,
                             tagline: tagline,
                             backdropLink: backdropLink,
                             posterLink: posterLink,
                             releaseDate: releaseDate,
                             credits: credits,
                             images: images)
    }

    enum CodingKeys: String, CodingKey {
        case id, adult, genres, homepage, overview, popularity, revenue, runtime, status, tagline, title, video, budget, images, similar, recommendations, credits
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

    public init(from: Decoder) throws {
        let container = try from.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        imdbId = try container.decodeIfPresent(String.self, forKey: .imdbId) ?? ""
        adult = try container.decodeIfPresent(Bool.self, forKey: .adult) ?? false
        backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath) ?? ""
        budget = try container.decodeIfPresent(Int.self, forKey: .budget) ?? 0
        genres = try container.decodeIfPresent([Genre].self, forKey: .genres) ?? []
        homepage = try container.decodeIfPresent(String.self, forKey: .homepage) ?? ""
        originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage) ?? ""
        originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle) ?? ""
        overview = try container.decodeIfPresent(String.self, forKey: .overview) ?? ""
        popularity = try container.decodeIfPresent(Double.self, forKey: .popularity) ?? 0
        posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath) ?? ""
        productionCompanies = try container.decodeIfPresent([ProductionCompany].self, forKey: .productionCompanies) ?? []
        productionCountries = try container.decodeIfPresent([ProductionCountry].self, forKey: .productionCountries) ?? []
        releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate) ?? ""
        revenue = try container.decodeIfPresent(Int.self, forKey: .revenue) ?? 0
        runtime = try container.decodeIfPresent(Int.self, forKey: .runtime) ?? 0
        status = try container.decodeIfPresent(String.self, forKey: .status) ?? "-"
        tagline = try container.decodeIfPresent(String.self, forKey: .tagline) ?? ""
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
        video = try container.decodeIfPresent(Bool.self, forKey: .video) ?? false
        voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage) ?? 0
        voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount) ?? 0
        images = try container.decodeIfPresent(TMDBImage.self, forKey: .images) ?? .init()
        similar = try container.decodeIfPresent(MovieType.self, forKey: .similar) ?? .init()
        recommendations = try container.decodeIfPresent(MovieType.self, forKey: .recommendations) ?? .init()
        credits = try container.decodeIfPresent(Credit.self, forKey: .credits) ?? .init()
    }
}

extension MovieDetail {
    public var posterLink: String {
        return "https://image.tmdb.org/t/p/original/" + posterPath
    }

    public var backdropLink: String {
        return "https://image.tmdb.org/t/p/original/" + backdropPath
    }

    public var titleWithYear: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-mm-dd"
        if let date = dateFormatter.date(from: releaseDate), let year = Calendar.current.dateComponents([.year], from: date).year {
            return title + " (\(year))"
        }

        return ""
    }
}

