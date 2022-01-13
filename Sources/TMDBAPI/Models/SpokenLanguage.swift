//
//  SpokenLanguage.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 10/23/21.
//

import Foundation

struct SpokenLanguage: Decodable {
    public let name: String
    public let iso6391: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case iso6391 = "iso_639_1"
    }
}
