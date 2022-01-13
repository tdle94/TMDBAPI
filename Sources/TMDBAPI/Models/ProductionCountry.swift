//
//  ProductionCountry.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 10/23/21.
//

import Foundation

public struct ProductionCountry: Decodable {
    public let name: String
    public let iso31662: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case iso31662 = "iso_3166_1"
    }
}
