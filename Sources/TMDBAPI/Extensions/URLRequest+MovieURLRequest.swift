//
//  URLRequest+MovieURLRequest.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 12/19/21.
//

import Foundation

protocol MovieURLRequest {
    static func movieDetail(id: Int, language: String) -> URLRequest
    static func movieCredit(id: Int, language: String) -> URLRequest
    static func movieImages(id: Int, language: String) -> URLRequest
    static func movieKeywords(id: Int) -> URLRequest
    static func movieRecommendations(id: Int, language: String, page: Int) -> URLRequest
    static func similarMovies(id: Int, language: String, page: Int) -> URLRequest
    static func movieVideos(id: Int, language: String) -> URLRequest
    static func movieWatchProviders(id: Int) -> URLRequest
    static func nowPlayingMovies(language: String, page: Int, region: String) -> URLRequest
    static func popularMovies(language: String, page: Int, region: String) -> URLRequest
    static func topRatedMovies(language: String, page: Int, region: String) -> URLRequest
    static func upcomingMovies(language: String, page: Int, region: String) -> URLRequest
    static func latestMovies(language: String) -> URLRequest
}


extension URLRequest: MovieURLRequest {
    static func movieDetail(id: Int, language: String) -> URLRequest {
        var components = urlComponent
        components.path = "/3/movie/\(id)"
        components.queryItems?.append(URLQueryItem(name: "language", value: language))
        components.queryItems?.append(URLQueryItem(name: "append_to_response", value: "credits,images,similar,recommendations"))
        return URLRequest(url: components.url!)
    }

    static func movieCredit(id: Int, language: String) -> URLRequest {
        var components = urlComponent
        components.path = "/3/movie/\(id)/credits"
        components.queryItems?.append(URLQueryItem(name: "language", value: language))
        return URLRequest(url: components.url!)
    }

    static func movieImages(id: Int, language: String) -> URLRequest {
        var components = urlComponent
        components.path = "/3/movie/\(id)/images"
        components.queryItems?.append(URLQueryItem(name: "language", value: language))
        return URLRequest(url: components.url!)
    }

    static func movieKeywords(id: Int) -> URLRequest {
        var components = urlComponent
        components.path = "/3/movie/\(id)/keywords"
        return URLRequest(url: components.url!)
    }

    static func movieRecommendations(id: Int, language: String, page: Int) -> URLRequest {
        var components = urlComponent
        components.path = "/3/movie/\(id)/recommendations"
        components.queryItems?.append(URLQueryItem(name: "language", value: language))
        components.queryItems?.append(URLQueryItem(name: "page", value: String(page)))
        return URLRequest(url: components.url!)
    }

    static func similarMovies(id: Int, language: String, page: Int) -> URLRequest {
        var components = urlComponent
        components.path = "/3/movie/\(id)/similar"
        components.queryItems?.append(URLQueryItem(name: "language", value: language))
        components.queryItems?.append(URLQueryItem(name: "page", value: String(page)))
        return URLRequest(url: components.url!)
    }

    static func movieVideos(id: Int, language: String) -> URLRequest {
        var components = urlComponent
        components.path = "/3/movie/\(id)/videos"
        components.queryItems?.append(URLQueryItem(name: "language", value: language))
        return URLRequest(url: components.url!)
    }

    static func movieWatchProviders(id: Int) -> URLRequest {
        var components = urlComponent
        components.path = "/3/movie/\(id)/watch/providers"
        return URLRequest(url: components.url!)
    }

    static func nowPlayingMovies(language: String, page: Int, region: String) -> URLRequest {
        var components = urlComponent
        components.path = "/3/movie/now_playing"
        components.queryItems?.append(URLQueryItem(name: "language", value: language))
        components.queryItems?.append(URLQueryItem(name: "page", value: String(page)))
        components.queryItems?.append(URLQueryItem(name: "region", value: region))
        return URLRequest(url: components.url!)
    }

    static func popularMovies(language: String, page: Int, region: String) -> URLRequest {
        var components = urlComponent
        components.path = "/3/movie/popular"
        components.queryItems?.append(URLQueryItem(name: "language", value: language))
        components.queryItems?.append(URLQueryItem(name: "page", value: String(page)))
        components.queryItems?.append(URLQueryItem(name: "region", value: region))
        return URLRequest(url: components.url!)
    }

    static func topRatedMovies(language: String, page: Int, region: String) -> URLRequest {
        var components = urlComponent
        components.path = "/3/movie/top_rated"
        components.queryItems?.append(URLQueryItem(name: "language", value: language))
        components.queryItems?.append(URLQueryItem(name: "page", value: String(page)))
        components.queryItems?.append(URLQueryItem(name: "region", value: region))
        return URLRequest(url: components.url!)
    }

    static func upcomingMovies(language: String, page: Int, region: String) -> URLRequest {
        var components = urlComponent
        components.path = "/3/movie/upcoming"
        components.queryItems?.append(URLQueryItem(name: "language", value: language))
        components.queryItems?.append(URLQueryItem(name: "page", value: String(page)))
        components.queryItems?.append(URLQueryItem(name: "region", value: region))
        return URLRequest(url: components.url!)
    }

    static func latestMovies(language: String) -> URLRequest {
        var components = urlComponent
        components.path = "/3/movie/latest"
        components.queryItems?.append(URLQueryItem(name: "language", value: language))
        return URLRequest(url: components.url!)
    }

    static func discover(_ discover: Discover) -> URLRequest {
        var components = urlComponent
        components.path = "/3/discover/movie"
        return URLRequest(url: components.url!)
    }
}
