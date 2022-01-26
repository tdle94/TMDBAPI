//
//  Crew.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 12/19/21.
//

import Foundation

public struct Crew: Decodable, Identifiable {
    public let adult: Bool
    public let gender: Int
    public let id: Int
    public let knownForDepartment: String
    public let name: String
    public let originalName: String
    public let popularity: Double
    public let profilePath: String
    public let creditId: String
    public let department: String
    public let job: String

    public var profileLink: String {
        return "https://image.tmdb.org/t/p/original/" + profilePath
    }

    public var displayObject: DisplayObject {
        return DisplayObject(id: id, type: .people, title: originalName, posterLink: profileLink)
    }

    enum CodingKeys: String, CodingKey {
        case adult, gender, id, name, popularity, department, job
        case knownForDepartment = "known_for_department"
        case originalName = "original_name"
        case profilePath = "profile_path"
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
        creditId = try container.decodeIfPresent(String.self, forKey: .creditId) ?? ""
        profilePath = try container.decodeIfPresent(String.self, forKey: .profilePath) ?? ""
        department = try container.decodeIfPresent(String.self, forKey: .department) ?? ""
        job = try container.decodeIfPresent(String.self, forKey: .job) ?? ""
    }
}
