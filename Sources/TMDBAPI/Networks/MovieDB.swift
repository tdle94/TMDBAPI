//
//  MovieDB.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 10/24/21.
//

import Foundation

@available(iOS 15.0.0, *)
@available(macOS 12.0.0, *)
public struct MovieDB {
    var network: Network = NetworkOp()

    public init() { }

    public func detail(id: Int, language: String = "en-US") async throws -> Result<MovieDetail, TMDBMessage> {
        let urlRequest = Movie.detail(id: id, language: language).urlRequest
        return try await network.performURLRequest(urlRequest, type: MovieDetail.self)
    }

    public func credits(id: Int, language: String = "en-US") async throws -> Result<Credit, TMDBMessage> {
        let urlRequest = Movie.credit(id: id, language: language).urlRequest
        return try await network.performURLRequest(urlRequest, type: Credit.self)
    }

    public func images(id: Int, language: String = "en-US") async throws -> Result<TMDBImage, TMDBMessage> {
        let urlRequest = Movie.images(id: id, language: language).urlRequest
        return try await network.performURLRequest(urlRequest, type: TMDBImage.self)
    }
    
    public func keywords(id: Int) async throws -> Result<Keyword, TMDBMessage> {
        let urlRequest = Movie.keywords(id: id).urlRequest
        return try await network.performURLRequest(urlRequest, type: Keyword.self)
    }
    
    public func recommendations(id: Int, language: String = "en-US", page: Int = 1) async throws -> Result<MovieType, TMDBMessage> {
        let urlRequest = Movie.recommendations(id: id, language: language, page: page).urlRequest
        return try await network.performURLRequest(urlRequest, type: MovieType.self)
    }
    
    public func similars(id: Int, language: String = "en-US", page: Int = 1) async throws -> Result<MovieType, TMDBMessage> {
        let urlRequest = Movie.similars(id: id, language: language, page: page).urlRequest
        return try await network.performURLRequest(urlRequest, type: MovieType.self)
    }
    
    public func videos(id: Int, language: String = "en-US") async throws -> Result<Video, TMDBMessage> {
        let urlRequest = Movie.videos(id: id, language: language).urlRequest
        return try await network.performURLRequest(urlRequest, type: Video.self)
    }

    public func watchProviders(id: Int) async throws -> Result<WatchProviders, TMDBMessage> {
        let urlRequest = Movie.watchProviders(id: id).urlRequest
        return try await network.performURLRequest(urlRequest, type: WatchProviders.self)
    }

    public func nowPlaying(language: String = "en-US", region: String = "US", page: Int = 1) async throws -> Result<MovieType, TMDBMessage> {
        let urlRequest = Movie.nowPlaying(language: language, page: page, region: region).urlRequest
        return try await network.performURLRequest(urlRequest, type: MovieType.self)
    }
    
    public func popular(language: String = "en-US", region: String = "US", page: Int = 1) async throws -> Result<MovieType, TMDBMessage> {
        let urlRequest = Movie.popular(language: language, page: page, region: region).urlRequest
        return try await network.performURLRequest(urlRequest, type: MovieType.self)
    }
    
    public func topRated(language: String = "en-US", region: String = "US", page: Int = 1) async throws -> Result<MovieType, TMDBMessage> {
        let urlRequest = Movie.topRated(language: language, page: page, region: region).urlRequest
        return try await network.performURLRequest(urlRequest, type: MovieType.self)
    }
    
    public func upcoming(language: String = "en-US", region: String = "US", page: Int = 1) async throws -> Result<MovieType, TMDBMessage> {
        let urlRequest = Movie.upcoming(language: language, page: page, region: region).urlRequest
        return try await network.performURLRequest(urlRequest, type: MovieType.self)
    }
    
    public func latest(language: String = "en-US") async throws -> Result<MovieDetail, TMDBMessage> {
        let urlRequest = Movie.latest(language: language).urlRequest
        return try await network.performURLRequest(urlRequest, type: MovieDetail.self)
    }

    public func discover(_ discover: Discover) async throws -> Result<MovieType, TMDBMessage> {
        let urlRequest = Movie.discover(discover: discover).urlRequest
        return try await network.performURLRequest(urlRequest, type: MovieType.self)
    }
}

