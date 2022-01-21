//
//  TMDBError.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 10/24/21.
//

import Foundation

public struct TMDBMessage: Decodable, Error {
    public let message: String?
    public let success: Bool?
    public let status: Int?
    
    enum CodingKeys: String, CodingKey {
        case success
        case message = "status_message"
        case status = "status_code"
    }
}
