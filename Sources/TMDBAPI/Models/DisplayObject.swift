//
//  DisplayObject.swift
//  
//
//  Created by Tuyen Le on 1/23/22.
//

import Foundation

public struct DisplayObject: Identifiable {
    public let id: Int
    public let titleWithYear: String
    public let backdropLink: String
    public let posterLink: String
    public let overview: String
    public let tagline: String
    public var image: TMDBImage?
    public var displayImageLinks: [String] = []

    public init(id: Int, titleWithYear: String, backdropLink: String, posterLink: String, overview: String, tagline: String) {
        self.id = id
        self.titleWithYear = titleWithYear
        self.backdropLink = backdropLink
        self.posterLink = posterLink
        self.overview = overview
        self.tagline = tagline
    }
}
