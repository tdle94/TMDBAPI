//
//  ProductionCompany.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 10/23/21.
//

import Foundation

public struct ProductionCompany: Decodable {
    public let id: Int
    public let name: String
    public let logoPath: String?
    public let originCountry: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, logoPath
        case originCountry = "origin_country"
    }
}
