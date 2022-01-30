//
//  DisplayObject.swift
//  
//
//  Created by Tuyen Le on 1/23/22.
//

import Foundation

public enum ImageSelectionType: String {
    case backdrops = "Backdrops"
    case posters = "Posters"
}

public enum EntitySelectionType: String {
    case similars = "Similars"
    case recommendation = "Recommendations"
}

public protocol QuickDisplay {
    var id: Int { get }
    var title: String { get }
    var subtitle: String { get }
    var posterLink: String { get }
}

public protocol Display: QuickDisplay {
    var overview: String { get }
    var releaseDate: String { get }
    var tagline: String { get }
    var backdropLink: String { get }
    var images: TMDBImage { get }
    var entitySelection: EntitySelectionType { get set }
    var imageSelection: ImageSelectionType { get set }
    var credits: Credit { get }
}

extension Display {
    public var subtitle: String {
        return ""
    }
}

public struct DisplayDetail: Display, Identifiable {
    
    public var id: Int
    
    public var title: String
    
    public var overview: String
    
    public var tagline: String
    
    public var releaseDate: String
    
    public var backdropLink: String
    
    public var posterLink: String
    
    public var images: TMDBImage
    
    public var credits: Credit
    
    public var entitySelection: EntitySelectionType = .similars
    
    public var imageSelection: ImageSelectionType = .backdrops
    
    public var similars: [EntityTypeDisplay] = []

    public var recommendations: [EntityTypeDisplay] = []
    
    public var entityToDisplay: [EntityTypeDisplay] {
        return entitySelection == .similars ? similars : recommendations
    }
    
    public var imageLinks: [String] {
        return imageSelection == .backdrops ? images.backdropLinks : images.posterLinks
    }

    public init(id: Int,
                title: String,
                overview: String,
                tagline: String,
                backdropLink: String,
                posterLink: String,
                releaseDate: String,
                credits: Credit,
                images: TMDBImage) {
        self.id = id
        self.title = title
        self.tagline = tagline
        self.posterLink = posterLink
        self.backdropLink = backdropLink
        self.overview = overview
        self.images = images
        self.credits = credits
        self.releaseDate = releaseDate
    }
}


extension DisplayDetail {
    public var titleWithYear: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-mm-dd"
        if let date = dateFormatter.date(from: releaseDate), let year = Calendar.current.dateComponents([.year], from: date).year {
            return title + " (\(year))"
        }

        return ""
    }
}

public struct EntityTypeDisplay: QuickDisplay, Identifiable {
    public enum DisplayType: String {
        case movie = "movie"
        case tvshow = "tv"
        case person = "person"
    }

    public var id: Int
    
    public var title: String
    
    public var subtitle: String
    
    public var posterLink: String
    
    public var type: DisplayType
    
    public init(id: Int, title: String, subtitle: String, posterLink: String, type: DisplayType) {
        self.id = id
        self.title = title
        self.subtitle = subtitle
        self.posterLink = posterLink
        self.type = type
    }
}
