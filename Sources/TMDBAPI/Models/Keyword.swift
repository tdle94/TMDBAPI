//
//  Keyword.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 12/19/21.
//

import Foundation


public struct Keyword: Decodable {
    public struct Keywords: Decodable {
        public let id: Int
        public let name: String
    }

    public let id: Int
    public let keywords: [Keyword.Keywords]
}
