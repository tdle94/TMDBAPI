//
//  URLPath.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 10/24/21.
//

import Foundation

enum Movie {
    case detail(id: Int, language: String)
    case credit(id: Int, language: String)
    case images(id: Int, language: String)
    case keywords(id: Int)
    case recommendations(id: Int, language: String, page: Int)
    case similars(id: Int, language: String, page: Int)
    case videos(id: Int, language: String)
    case watchProviders(id: Int)
    case nowPlaying(language: String, page: Int, region: String)
    case popular(language: String, page: Int, region: String)
    case topRated(language: String, page: Int, region: String)
    case upcoming(language: String, page: Int, region: String)
    case latest(language: String)
    case discover(discover: Discover)

    var urlRequest: URLRequest {
        switch self {
        case let .detail(id, language):
            return .movieDetail(id: id, language: language)
        case let .credit(id, language):
            return .movieCredit(id: id, language: language)
        case let .images(id, language):
            return .movieImages(id: id, language: language)
        case let .keywords(id):
            return .movieKeywords(id: id)
        case let .recommendations(id, language, page):
            return .movieRecommendations(id: id, language: language, page: page)
        case let .similars(id, language, page):
            return .similarMovies(id: id, language: language, page: page)
        case let .videos(id, language):
            return .movieVideos(id: id, language: language)
        case let .watchProviders(id):
            return .movieWatchProviders(id: id)
        case let .nowPlaying(language, page, region):
            return .nowPlayingMovies(language: language, page: page, region: region)
        case let .popular(language, page, region):
            return .popularMovies(language: language, page: page, region: region)
        case let .topRated(language, page, region):
            return .topRatedMovies(language: language, page: page, region: region)
        case let .upcoming(language, page, region):
            return .upcomingMovies(language: language, page: page, region: region)
        case let .latest(language):
            return .latestMovies(language: language)
        case let .discover(discover):
            return .discover(discover)
        }
    }
}
