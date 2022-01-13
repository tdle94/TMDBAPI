//
//  Network.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 10/24/21.
//

import Foundation

@available(macOS 10.15.0, *)
@available(iOS 15.0.0, *)
protocol Network {
    func performURLRequest<T : Decodable>(_ urlRequest: URLRequest, type: T.Type) async throws -> Result<T, TMDBMessage>
}

@available(macOS 12.0.0, *)
@available(iOS 15.0.0, *)
struct NetworkOp: Network {
    
    let session: URLSession

    init() {
        let config = URLSessionConfiguration.ephemeral
        config.allowsCellularAccess = true
        config.timeoutIntervalForResource = TimeInterval(20)
        session = URLSession(configuration: config, delegate: nil, delegateQueue: nil)
    }

    func performURLRequest<T : Decodable>(_ urlRequest: URLRequest, type: T.Type) async throws -> Result<T, TMDBMessage> {
        let (data, response) = try await session.data(for: urlRequest, delegate: nil)

        guard let httpResponse = response as? HTTPURLResponse else {
            return .failure(.init(message: "no data available", success: false, status: 501))
        }
        
        if (201...299).contains(httpResponse.statusCode) {
            return .success(JSONDecoder().decodeTMDBMessage(from: data) as! T)
        }
        
        if (400...599).contains(httpResponse.statusCode) {
            return .failure(JSONDecoder().decodeTMDBMessage(from: data))
        }

        return .success(try JSONDecoder().decode(T.self, from: data))
    }
}
