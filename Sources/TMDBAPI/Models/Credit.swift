//
//  Credit.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 12/19/21.
//

import Foundation

public struct Credit: Decodable {
    public enum DisplayType {
        case cast
        case crew
    }

    public let id: Int
    public let cast: [Cast]
    public let crew: [Crew]
    public var displayType: DisplayType = .cast

    public var displayObjects: [EntityTypeDisplay] {
        return displayType == .cast ? cast.compactMap { $0.displayObject } : crew.compactMap { $0.displayObject }
    }

    enum CodingKeys: String, CodingKey {
        case id, cast, crew
    }

    public init() {
        id = -1
        cast = []
        crew = []
    }

    public init(from: Decoder) throws {
        let container = try from.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id) ?? -1
        cast = try container.decodeIfPresent([Cast].self, forKey: .cast) ?? []
        crew = try container.decodeIfPresent([Crew].self, forKey: .crew) ?? []
    }
}
