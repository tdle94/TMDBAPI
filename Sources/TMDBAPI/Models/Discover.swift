//
//  Discover.swift
//  
//
//  Created by Tuyen Le on 1/12/22.
//

import Foundation

public struct Discover {
    enum SortBy {
        enum Popularity: String {
            case ascending = "popularity.asc"
            case descending = "popularity.dsc"
        }
        enum ReleaseDate: String {
            case ascending = "release_date.asc"
            case descending = "release_date.desc"
        }
        enum Revenue: String {
            case ascending = "revenue.asc"
            case descending = "revenue.desc"
        }
        enum PrimaryReleaseDate: String {
            case ascending = "primary_release_date.asc"
            case descending = "primary_release_date.desc"
        }
        enum OriginalTitle: String {
            case ascending = "original_title.asc"
            case descending = "original_title.desc"
        }
        enum VoteAverage: String {
            case ascending = "vote_average.asc"
            case descending = "vote_average.desc"
        }
        enum VoteCount: String {
            case ascending = "vote_count.asc"
            case descending = "vote_count.desc"
        }
    }

    var language: String = "en-US"
    var page: Int = 1
    var region: String?
    var sortby: String = SortBy.Popularity.descending.rawValue
    var certificationCountry: String?
    var certification: String?
    var certificationLTE: String?
    var certificationGTE: String?
    var includeAdult: Bool?
    var includeVideo: Bool?
    var primaryReleaseYear: Int?
    var primaryReleaseDateGTE: String?
    var primaryReleaseDateLTE: String?
    var releaseDateGTE: String?
    var releaseDateLTE: String?
    var withReleaseType: Int?
    var year: Int?
    var voteCountGTE: Int?
    var voteCountLTE: Int?
    var voteAverageGTE: Double?
    var voteAverageLTE: Double?
    var withCast: [String] = []
    var withCrew: [String] = []
    var withPeople: [String] = []
    var withComapnies: [String] = []
    var withoutComapnies: String?
    var withGenres: [String] = []
    var withoutGenres: [String] = []
    var withKeywords: [String] = []
    var withoutKeywords: [String] = []
    var withRuntimeGTE: Int?
    var withRuntimeLTE: Int?
    var withOriginalLanguage: String?
    var withWatchProviders: String?
    var watchRegion: String?
    var withWatchMonetizationTypes: String?
    
    public init() {}
}
