//
//  DisplayObject.swift
//  
//
//  Created by Tuyen Le on 1/23/22.
//

import Foundation

public struct DisplayObject: Identifiable {
    public enum DisplayType: String {
        case tvshow = "tv"
        case movie = "movie"
        case people = "people"
    }

    public let id: Int
    public let titleWithYear: String
    public let title: String
    public let backdropLink: String
    public let posterLink: String
    public let overview: String
    public let tagline: String
    public let type: DisplayType
    public var images: TMDBImage = TMDBImage()
    public var similar: [DisplayObject] = []
    public var recommendations: [DisplayObject] = []
    public var totalSimilars: Int = 0 // similar is paginated
    public var totalRecommends: Int = 0 // recommend is paginated
    public var displayImageLinks: [String] = []
    public var displaySameObjects: [DisplayObject] = []
    public var credits: Credit = Credit()

    public init(id: Int, type: DisplayType, titleWithYear: String = "", title: String, backdropLink: String = "", posterLink: String, overview: String = "", tagline: String = "") {
        self.id = id
        self.type = type
        self.titleWithYear = titleWithYear
        self.title = title
        self.backdropLink = backdropLink
        self.posterLink = posterLink
        self.overview = overview
        self.tagline = tagline
    }
}
