//
//  DisplayObject.swift
//  
//
//  Created by Tuyen Le on 1/23/22.
//

import Foundation

public struct DisplayObject: Identifiable {
    public enum DisplayType {
        case tvshow
        case movie
    }

    public let id: Int
    public let titleWithYear: String
    public let title: String
    public let backdropLink: String
    public let posterLink: String
    public let overview: String
    public let tagline: String
    public let type: DisplayType
    public var image: TMDBImage?
    public var similars: [DisplayObject] = []
    public var recommends: [DisplayObject] = []

    // Use to store data change when user pick different option
    public var displayImageLinks: [String] = []
    public var displaySameObject: [DisplayObject] = []

    public init(id: Int, type: DisplayType, titleWithYear: String, title: String, backdropLink: String, posterLink: String, overview: String, tagline: String) {
        self.id = id
        self.type = type
        self.titleWithYear = titleWithYear
        self.title = title
        self.backdropLink = backdropLink
        self.posterLink = posterLink
        self.overview = overview
        self.tagline = tagline
    }

    public init(id: Int, type: DisplayType, title: String, posterLink: String) {
        self.id = id
        self.type = type
        self.titleWithYear = ""
        self.title = title
        self.posterLink = posterLink
        self.backdropLink = ""
        self.overview = ""
        self.tagline = ""
    }
}
