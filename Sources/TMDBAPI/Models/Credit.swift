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

    public var displayObjects: [DisplayObject] {
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
}
