//
//  URLRequest+TVURLRequest.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 12/20/21.
//

import Foundation

protocol TVURLRequest {
    static func tvDetail(id: Int, language: String) -> URLRequest
    static func tvCredit(id: Int, language: String) -> URLRequest
    static func tvImages(id: Int, language: String) -> URLRequest
    static func tvKeywords(id: Int) -> URLRequest
    static func tvRecommendations(id: Int, language: String, page: Int) -> URLRequest
    static func similarTVShows(id: Int, language: String, page: Int) -> URLRequest
    static func tvVideos(id: Int, language: String) -> URLRequest
    static func tvWatchProviders(id: Int) -> URLRequest
    static func tvShowsAiringToday(language: String, page: Int) -> URLRequest
    static func tvShowsOnTheAir(language: String, page: Int) -> URLRequest
    static func popularTVShows(language: String, page: Int) -> URLRequest
    static func topRatedTVShows(language: String, page: Int) -> URLRequest
    static func latestTVShows(language: String) -> URLRequest
}

extension URLRequest: TVURLRequest {
    static func tvDetail(id: Int, language: String) -> URLRequest {
        var components = urlComponent
        components.path = "/3/tv/\(id)"
        components.queryItems?.append(URLQueryItem(name: "language", value: language))
        components.queryItems?.append(URLQueryItem(name: "append_to_response", value: "credits,images,similar,recommendations"))
        return URLRequest(url: components.url!)
    }

    static func tvCredit(id: Int, language: String) -> URLRequest {
        var components = urlComponent
        components.path = "/3/tv/\(id)/credits"
        components.queryItems?.append(URLQueryItem(name: "language", value: language))
        return URLRequest(url: components.url!)
    }

    static func tvImages(id: Int, language: String) -> URLRequest {
        var components = urlComponent
        components.path = "/3/tv/\(id)/images"
        components.queryItems?.append(URLQueryItem(name: "language", value: language))
        return URLRequest(url: components.url!)
    }

    static func tvKeywords(id: Int) -> URLRequest {
        var components = urlComponent
        components.path = "/3/tv/\(id)/keywords"
        return URLRequest(url: components.url!)
    }

    static func tvRecommendations(id: Int, language: String, page: Int) -> URLRequest {
        var components = urlComponent
        components.path = "/3/tv/\(id)/recommendations"
        components.queryItems?.append(URLQueryItem(name: "language", value: language))
        components.queryItems?.append(URLQueryItem(name: "page", value: String(page)))
        return URLRequest(url: components.url!)
    }

    static func similarTVShows(id: Int, language: String, page: Int) -> URLRequest {
        var components = urlComponent
        components.path = "/3/tv/\(id)/similar"
        components.queryItems?.append(URLQueryItem(name: "language", value: language))
        components.queryItems?.append(URLQueryItem(name: "page", value: String(page)))
        return URLRequest(url: components.url!)
    }

    static func tvVideos(id: Int, language: String) -> URLRequest {
        var components = urlComponent
        components.path = "/3/tv/\(id)/videos"
        components.queryItems?.append(URLQueryItem(name: "language", value: language))
        return URLRequest(url: components.url!)
    }

    static func tvWatchProviders(id: Int) -> URLRequest {
        var components = urlComponent
        components.path = "/3/tv/\(id)/watch/providers"
        return URLRequest(url: components.url!)
    }

    static func tvShowsAiringToday(language: String, page: Int) -> URLRequest {
        var components = urlComponent
        components.path = "/3/tv/airing_today"
        components.queryItems?.append(URLQueryItem(name: "language", value: language))
        components.queryItems?.append(URLQueryItem(name: "page", value: String(page)))
        return URLRequest(url: components.url!)
    }

    static func tvShowsOnTheAir(language: String, page: Int) -> URLRequest {
        var components = urlComponent
        components.path = "/3/tv/on_the_air"
        components.queryItems?.append(URLQueryItem(name: "language", value: language))
        components.queryItems?.append(URLQueryItem(name: "page", value: String(page)))
        return URLRequest(url: components.url!)
    }

    static func popularTVShows(language: String, page: Int) -> URLRequest {
        var components = urlComponent
        components.path = "/3/tv/popular"
        components.queryItems?.append(URLQueryItem(name: "language", value: language))
        components.queryItems?.append(URLQueryItem(name: "page", value: String(page)))
        return URLRequest(url: components.url!)
    }

    static func topRatedTVShows(language: String, page: Int) -> URLRequest {
        var components = urlComponent
        components.path = "/3/tv/top_rated"
        components.queryItems?.append(URLQueryItem(name: "language", value: language))
        components.queryItems?.append(URLQueryItem(name: "page", value: String(page)))
        return URLRequest(url: components.url!)
    }

    static func latestTVShows(language: String) -> URLRequest {
        var components = urlComponent
        components.path = "/3/tv/latest"
        components.queryItems?.append(URLQueryItem(name: "language", value: language))
        return URLRequest(url: components.url!)
    }
}
