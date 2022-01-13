//
//  Credit.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 12/19/21.
//

import Foundation

public struct Credit: Decodable {
    public let id: Int
    public let cast: [Cast]
    public let crew: [Crew]
}
