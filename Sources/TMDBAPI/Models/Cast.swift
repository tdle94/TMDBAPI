//
//  Cast.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 12/19/21.
//

import Foundation

public struct Cast: Decodable, Identifiable {
    public let adult: Bool
    public let gender: Int
    public let id: Int
    public let knownForDepartment: String
    public let name: String
    public let originalName: String
    public let popularity: Double
    public let profilePath: String
    public let castId: Int?
    public let character: String
    public let creditId: String
    public let order: Int

    public var profileLink: String {
        return "https://image.tmdb.org/t/p/original/" + profilePath
    }
    
    public var displayObject: QuickDisplay {
        return EntityTypeDisplay(id: id, title: originalName, subtitle: character, posterLink: profileLink)
    }
    
    enum CodingKeys: String, CodingKey {
        case adult, gender, id, name, popularity, character, order
        case knownForDepartment = "known_for_department"
        case originalName = "original_name"
        case profilePath = "profile_path"
        case castId = "cast_id"
        case creditId = "credit_id"
    }
    
    public init(from: Decoder) throws {
        let container = try from.container(keyedBy: CodingKeys.self)
        adult = try container.decodeIfPresent(Bool.self, forKey: .adult) ?? false
        gender = try container.decodeIfPresent(Int.self, forKey: .gender) ?? -1
        id = try container.decode(Int.self, forKey: .id)
        knownForDepartment = try container.decodeIfPresent(String.self, forKey: .knownForDepartment) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        originalName = try container.decodeIfPresent(String.self, forKey: .originalName) ?? ""
        popularity = try container.decodeIfPresent(Double.self, forKey: .popularity) ?? 0
        castId = try container.decodeIfPresent(Int.self, forKey: .castId)
        profilePath = try container.decodeIfPresent(String.self, forKey: .profilePath) ?? ""
        character = try container.decodeIfPresent(String.self, forKey: .character) ?? ""
        creditId = try container.decodeIfPresent(String.self, forKey: .creditId) ?? ""
        order = try container.decodeIfPresent(Int.self, forKey: .order) ?? -1
    }
}
