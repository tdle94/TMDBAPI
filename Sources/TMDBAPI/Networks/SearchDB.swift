//
//  File.swift
//  
//
//  Created by Tuyen Le on 1/20/22.
//

import Foundation

@available(iOS 15.0.0, *)
@available(macOS 12.0.0, *)
public struct SearchDB {
    var network: Network = NetworkOp()

    public init() { }
    
    public func multiSearch(language: String, region: String, page: Int, includeAdult: Bool, query: String) async throws -> Result<MultiSearch, TMDBMessage> {
        let urlRequest = Search.multiSearch(language: language, region: region, page: page, includeAdult: includeAdult, query: query).urlRequest
        return try await network.performURLRequest(urlRequest, type: MultiSearch.self)
    }
}
