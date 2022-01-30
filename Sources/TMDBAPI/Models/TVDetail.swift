//
//  TVDetail.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 12/20/21.
//

import Foundation

public struct TVDetail: Decodable {
    public struct CreatedBy: Decodable {
        public let id: Int
        public let creditId: String
        public let name: String
        public let gender: Int
        public let profilePath: String?
        
        enum CodingKeys: String, CodingKey {
            case id, name, gender
            case creditId = "credit_id"
            case profilePath = "profile_path"
        }
    }
    
    public struct Genres: Decodable {
        public let id: Int
        public let name: String
    }
    
    public struct LastEpisodeToAir: Decodable {
        public let airDate: String
        public let episodeNumber: Int
        public let id: Int
        public let name: String
        public let overview: String
        public let productionCode: String
        public let seasonNumber: Int
        public let stillPath: String
        public let voteAverage: Double
        public let voteCount: Int
        
        enum CodingKeys: String, CodingKey {
            case id, name, overview
            case airDate = "air_date"
            case episodeNumber = "episode_number"
            case productionCode = "production_code"
            case seasonNumber = "season_number"
            case stillPath = "still_path"
            case voteAverage = "vote_average"
            case voteCount = "vote_count"
        }
        
        public init(from: Decoder) throws {
            let container = try from.container(keyedBy: CodingKeys.self)
            airDate = try container.decodeIfPresent(String.self, forKey: .airDate) ?? ""
            episodeNumber = try container.decodeIfPresent(Int.self, forKey: .episodeNumber) ?? -1
            id = try container.decodeIfPresent(Int.self, forKey: .id) ?? -1
            name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
            overview = try container.decodeIfPresent(String.self, forKey: .overview) ?? ""
            productionCode = try container.decodeIfPresent(String.self, forKey: .productionCode) ?? ""
            seasonNumber = try container.decodeIfPresent(Int.self, forKey: .seasonNumber) ?? -1
            stillPath = try container.decodeIfPresent(String.self, forKey: .stillPath) ?? ""
            voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage) ?? 0
            voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount) ?? 0
        }
        
        public init() {
            airDate = ""
            episodeNumber = -1
            id = -1
            name =  ""
            overview = ""
            productionCode = ""
            seasonNumber = -1
            stillPath = ""
            voteAverage = 0
            voteCount = 0
        }
    }
    
    public struct Network: Decodable {
        public let id: Int
        public let name: String
        public let logoPath: String
        public let originCountry: String
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case logoPath = "logo_path"
            case originCountry = "origin_country"
        }
        
        public init() {
            id = -1
            name = ""
            logoPath = ""
            originCountry = ""
        }
    }
    
    public struct ProductionCompany: Decodable {
        public let name: String
        public let id: Int
        public let logoPath: String?
        public let originCountry: String
        
        enum CodingKeys: String, CodingKey {
            case id, name
            case logoPath = "logo_path"
            case originCountry = "origin_country"
        }
    }
    
    public struct ProductionCountry: Decodable {
        public let name: String
        public let iso31661: String
        
        enum CodingKeys: String, CodingKey {
            case name
            case iso31661 = "iso_3166_1"
        }
    }
    
    public struct Season: Decodable {
        public let name: String
        public let id: Int
        public let overview: String
        public let airDate: String?
        public let episodeCount: Int
        public let posterPath: String?
        public let seasonNumber: Int
        
        enum CodingKeys: String, CodingKey {
            case name, id, overview
            case airDate = "air_date"
            case episodeCount = "episode_count"
            case posterPath = "poster_path"
            case seasonNumber = "season_number"
        }
    }
    
    public struct SpokenLanguage: Decodable {
        public let englishName: String
        public let iso6391: String
        public let name: String
        
        enum CodingKeys: String, CodingKey {
            case name
            case englishName = "english_name"
            case iso6391 = "iso_639_1"
        }
    }

    public let id: Int
    public let name: String
    public let status: String
    public let tagline: String
    public let type: String
    public let overview: String
    public let popularity: Double
    public let languages: [String]
    public let homepage: String
    public let genres: [Genres]
    public let networks: [Network]
    public let seasons: [Season]
    public let backdropPath: String
    public let episodeRuntime: [Int]
    public let firstAirDate: String
    public let createdBy: [CreatedBy]
    public let inProduction: Bool
    public let lastAirDate: String
    public let lastEpisodeToAir: LastEpisodeToAir
    public let numberOfEpisodes: Int
    public let numberOfSeasons: Int
    public let originCountry: [String]
    public let originalLanguage: String
    public let originalName: String
    public let posterPath: String
    public let voteAverage: Double
    public let voteCount: Int
    public let productionCompanies: [ProductionCompany]
    public let productionCountries: [ProductionCountry]
    public let spokenLanguages: [SpokenLanguage]
    public let images: TMDBImage
    public let similar: TVType
    public let recommendations: TVType
    public let credits: Credit

    public var posterLink: String {
        return "https://image.tmdb.org/t/p/original/" + posterPath
    }

    public var backdropLink: String {
        return "https://image.tmdb.org/t/p/original/" + backdropPath
    }

    public var displayObject: DisplayDetail {
        var displayDetail = DisplayDetail(id: id,
                                          title: name,
                                          overview: overview,
                                          tagline: tagline,
                                          backdropLink: backdropLink,
                                          posterLink: posterLink,
                                          releaseDate: firstAirDate,
                                          credits: credits,
                                          images: images)
        displayDetail.similars = similar.displayObjects
        displayDetail.recommendations = recommendations.displayObjects
        displayDetail.totalSimilars = similar.totalResults
        displayDetail.totalRecommendations = recommendations.totalResults
        return displayDetail
    }

    enum CodingKeys: String, CodingKey {
        case id, name, status, tagline, type, overview, popularity, homepage, genres, networks, seasons, languages, images, similar, recommendations, credits
        case backdropPath = "backdrop_path"
        case episodeRuntime = "episode_run_time"
        case firstAirDate = "first_air_date"
        case createdBy = "created_by"
        case inProduction = "in_production"
        case lastAirDate = "last_air_date"
        case lastEpisodeToAir = "last_episode_to_air"
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case spokenLanguages = "spoken_languages"
    }

    public init(from: Decoder) throws {
        let container = try from.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath) ?? ""
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        homepage = try container.decodeIfPresent(String.self, forKey: .homepage) ?? ""
        originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage) ?? ""
        overview = try container.decodeIfPresent(String.self, forKey: .overview) ?? ""
        firstAirDate = try container.decodeIfPresent(String.self, forKey: .firstAirDate) ?? ""
        lastAirDate = try container.decodeIfPresent(String.self, forKey: .lastAirDate) ?? ""
        popularity = try container.decodeIfPresent(Double.self, forKey: .popularity) ?? 0
        posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath) ?? ""
        productionCompanies = try container.decodeIfPresent([ProductionCompany].self, forKey: .productionCompanies) ?? []
        productionCountries = try container.decodeIfPresent([ProductionCountry].self, forKey: .productionCountries) ?? []
        status = try container.decodeIfPresent(String.self, forKey: .status) ?? "-"
        tagline = try container.decodeIfPresent(String.self, forKey: .tagline) ?? ""
        voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage) ?? 0
        voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount) ?? 0
        images = try container.decodeIfPresent(TMDBImage.self, forKey: .images) ?? .init()
        similar = try container.decodeIfPresent(TVType.self, forKey: .similar) ?? .init()
        recommendations = try container.decodeIfPresent(TVType.self, forKey: .recommendations) ?? .init()
        credits = try container.decodeIfPresent(Credit.self, forKey: .credits) ?? .init()
        originCountry = try container.decodeIfPresent([String].self, forKey: .originCountry) ?? []
        originalName = try container.decodeIfPresent(String.self, forKey: .originalName) ?? ""
        numberOfSeasons = try container.decodeIfPresent(Int.self, forKey: .numberOfSeasons) ?? 0
        numberOfEpisodes = try container.decodeIfPresent(Int.self, forKey: .numberOfEpisodes) ?? 0
        spokenLanguages = try container.decodeIfPresent([SpokenLanguage].self, forKey: .spokenLanguages) ?? []
        lastEpisodeToAir = try container.decodeIfPresent(LastEpisodeToAir.self, forKey: .lastEpisodeToAir) ?? .init()
        episodeRuntime = try container.decodeIfPresent([Int].self, forKey: .episodeRuntime) ?? []
        genres = try container.decodeIfPresent([Genres].self, forKey: .genres) ?? []
        createdBy = try container.decodeIfPresent([CreatedBy].self, forKey: .createdBy) ?? []
        seasons = try container.decodeIfPresent([Season].self, forKey: .seasons) ?? []
        networks = try container.decodeIfPresent([Network].self, forKey: .networks) ?? []
        languages = try container.decodeIfPresent([String].self, forKey: .languages) ?? []
        inProduction = try container.decodeIfPresent(Bool.self, forKey: .inProduction) ?? false
    }
}
