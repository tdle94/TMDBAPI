//
//  TVShowDB.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 12/20/21.
//

import Foundation

@available(macOS 12.0.0, *)
@available(iOS 15.0.0, *)
public struct TVShowDB {
    var network: Network = NetworkOp()

    public init() { }

    public func detail(id: Int, language: String = "en-US") async throws -> Result<TVDetail, TMDBMessage> {
        let urlRequest = TV.detail(id: id, language: language).urlRequest
        return try await network.performURLRequest(urlRequest, type: TVDetail.self)
    }

    public func credit(id: Int, language: String = "en-US") async throws -> Result<Credit, TMDBMessage> {
        let urlRequest = TV.credit(id: id, language: language).urlRequest
        return try await network.performURLRequest(urlRequest, type: Credit.self)
    }

    public func images(id: Int, language: String = "en-US") async throws -> Result<TMDBImage, TMDBMessage> {
        let urlRequest = TV.images(id: id, language: language).urlRequest
        return try await network.performURLRequest(urlRequest, type: TMDBImage.self)
    }

    public func keywords(id: Int) async throws -> Result<Keyword, TMDBMessage> {
        let urlRequest = TV.keywords(id: id).urlRequest
        return try await network.performURLRequest(urlRequest, type: Keyword.self)
    }

    public func recommendations(id: Int, language: String = "en-US", page: Int = 1) async throws -> Result<TVType, TMDBMessage> {
        let urlRequest = TV.recommendations(id: id, language: language, page: page).urlRequest
        return try await network.performURLRequest(urlRequest, type: TVType.self)
    }

    public func similar(id: Int, language: String = "en-US", page: Int = 1) async throws -> Result<TVType, TMDBMessage> {
        let urlRequest = TV.similars(id: id, language: language, page: page).urlRequest
        return try await network.performURLRequest(urlRequest, type: TVType.self)
    }

    public func video(id: Int, language: String = "en-US") async throws -> Result<Video, TMDBMessage> {
        let urlRequest = TV.videos(id: id, language: language).urlRequest
        return try await network.performURLRequest(urlRequest, type: Video.self)
    }

    public func watchProviders(id: Int) async throws -> Result<WatchProviders, TMDBMessage> {
        let urlRequest = TV.watchProviders(id: id).urlRequest
        return try await network.performURLRequest(urlRequest, type: WatchProviders.self)
    }
    
    public func latest(language: String = "en-US") async throws -> Result<TVDetail, TMDBMessage> {
        let urlRequest = TV.latest(language: language).urlRequest
        return try await network.performURLRequest(urlRequest, type: TVDetail.self)
    }
    
    public func airingToday(language: String = "en-US", page: Int = 1) async throws -> Result<TVType, TMDBMessage> {
        let urlRequest = TV.airingToday(language: language, page: page).urlRequest
        return try await network.performURLRequest(urlRequest, type: TVType.self)
    }
    
    public func onTheAir(language: String = "en-US", page: Int = 1) async throws -> Result<TVType, TMDBMessage> {
        let urlRequest = TV.onTheAir(language: language, page: page).urlRequest
        return try await network.performURLRequest(urlRequest, type: TVType.self)
    }
    
    public func popular(language: String = "en-US", page: Int = 1) async throws -> Result<TVType, TMDBMessage> {
        let urlRequest = TV.popular(language: language, page: page).urlRequest
        return try await network.performURLRequest(urlRequest, type: TVType.self)
    }
    
    public func topRated(language: String = "en-US", page: Int = 1) async throws -> Result<TVType, TMDBMessage> {
        let urlRequest = TV.topRated(language: language, page: page).urlRequest
        return try await network.performURLRequest(urlRequest, type: TVType.self)
    }
}
