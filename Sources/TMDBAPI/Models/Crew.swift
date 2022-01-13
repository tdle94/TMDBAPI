//
//  Crew.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 12/19/21.
//

import Foundation

public struct Crew: Decodable {
    public let adult: Bool
    public let gender: Int?
    public let id: Int
    public let knownForDepartment: String
    public let name: String
    public let originalName: String
    public let popularity: Double
    public let profilePath: String?
    public let creditId: String
    public let department: String
    public let job: String
    
    enum CodingKeys: String, CodingKey {
        case adult, gender, id, name, popularity, department, job
        case knownForDepartment = "known_for_department"
        case originalName = "original_name"
        case profilePath = "profile_path"
        case creditId = "credit_id"
    }
}
