//
//  TVURLRequest.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 12/20/21.
//

import Foundation

enum TV {
    case detail(id: Int, language: String)
    case credit(id: Int, language: String)
    case images(id: Int, language: String)
    case keywords(id: Int)
    case recommendations(id: Int, language: String, page: Int)
    case similars(id: Int, language: String, page: Int)
    case videos(id: Int, language: String)
    case watchProviders(id: Int)
    case airingToday(language: String, page: Int)
    case onTheAir(language: String, page: Int)
    case popular(language: String, page: Int)
    case topRated(language: String, page: Int)
    case latest(language: String)
    
    var urlRequest: URLRequest {
        switch self {
        case let .detail(id, language):
            return .tvDetail(id: id, language: language)
        case let .credit(id, language):
            return .tvCredit(id: id, language: language)
        case let .images(id, language):
            return .tvImages(id: id, language: language)
        case let .keywords(id):
            return .tvKeywords(id: id)
        case let .recommendations(id, language, page):
            return .tvRecommendations(id: id, language: language, page: page)
        case let .similars(id, language, page):
            return .similarTVShows(id: id, language: language, page: page)
        case let .videos(id, language):
            return .tvVideos(id: id, language: language)
        case let .watchProviders(id):
            return .tvWatchProviders(id: id)
        case let .airingToday(language, page):
            return .tvShowsAiringToday(language: language, page: page)
        case let .onTheAir(language, page):
            return .tvShowsOnTheAir(language: language, page: page)
        case let .popular(language, page):
            return .popularTVShows(language: language, page: page)
        case let .topRated(language, page):
            return .topRatedTVShows(language: language, page: page)
        case let .latest(language):
            return .latestTVShows(language: language)
        }
    }
}
