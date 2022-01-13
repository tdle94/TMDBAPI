//
//  JSONDecoder+.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 10/24/21.
//

import Foundation

extension JSONDecoder {
    func decodeTMDBObject<T : Decodable>(from data: Data) -> Result<T, TMDBMessage> {
        do {
            let responseData = try JSONDecoder().decode(T.self, from: data)
            return .success(responseData)
        } catch let error {
            debugPrint(error.localizedDescription, error)
            return .failure(.init(message: "Cannot retreive data", success: false, status: 400))
        }
    }
    
    func decodeTMDBMessage(from data: Data) -> TMDBMessage {
        
        do {
            return try JSONDecoder().decode(TMDBMessage.self, from: data)
        } catch let error {
            debugPrint(error.localizedDescription, error)
            return .init(message: "Cannot retreive data", success: false, status: 1)
        }
    }
}

