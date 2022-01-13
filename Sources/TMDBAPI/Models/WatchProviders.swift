//
//  WatchProvider.swift
//  TMDBAPI
//
//  Created by Tuyen Le on 12/19/21.
//

import Foundation

public struct WatchProviders: Decodable {
    public struct Results: Decodable {
        public let ar: Country?
        public let at: Country?
        public let au: Country?
        public let be: Country?
        public let ca: Country?
        public let ch: Country?
        public let cl: Country?
        public let co: Country?
        public let cz: Country?
        public let de: Country?
        public let dk: Country?
        public let ec: Country?
        public let ee: Country?
        public let es: Country?
        public let fi: Country?
        public let fr: Country?
        public let gb: Country?
        public let gr: Country?
        public let hu: Country?
        public let id: Country?
        public let ie: Country?
        public let `in`: Country?
        public let it: Country?
        public let jp: Country?
        public let kr: Country?
        public let lt: Country?
        public let lv: Country?
        public let mx: Country?
        public let my: Country?
        public let nl: Country?
        public let no: Country?
        public let nz: Country?
        public let pe: Country?
        public let ph: Country?
        public let pl: Country?
        public let pt: Country?
        public let ro: Country?
        public let ru: Country?
        public let se: Country?
        public let sg: Country?
        public let th: Country?
        public let tr: Country?
        public let us: Country?
        public let ve: Country?
        public let za: Country?

        enum CodingKeys: String, CodingKey {
            case ar = "AR"
            case at = "AT"
            case au = "AU"
            case be = "BE"
            case ca = "CA"
            case ch = "CH"
            case cl = "CL"
            case co = "CO"
            case cz = "CZ"
            case de = "DE"
            case dk = "DK"
            case ec = "EC"
            case ee = "EE"
            case es = "ES"
            case fi = "FI"
            case fr = "FR"
            case gb = "GB"
            case gr = "GR"
            case hu = "HU"
            case id = "ID"
            case ie = "IE"
            case `in` = "IN"
            case it = "IT"
            case jp = "JP"
            case kr = "KR"
            case lt = "LT"
            case lv = "LV"
            case mx = "MX"
            case my = "MV"
            case nl = "NL"
            case no = "NO"
            case nz = "NZ"
            case pe = "PE"
            case ph = "PH"
            case pl = "PL"
            case pt = "PT"
            case ro = "RO"
            case ru = "RU"
            case se = "SE"
            case sg = "SG"
            case th = "TH"
            case tr = "TR"
            case us = "US"
            case ve = "VE"
            case za = "ZA"
        }
    }

    public struct Country: Decodable {
        public let link: String?
        public let flatrate: [Price]?
        public let rent: [Price]?
        public let buy: [Price]?
    }

    public struct Price: Decodable {
        public let displayPriority: Int
        public let logoPath: String
        public let providerId: Int
        public let providerName: String

        enum CodingKeys: String, CodingKey {
            case displayPriority = "display_priority"
            case logoPath = "logo_path"
            case providerId = "provider_id"
            case providerName = "provider_name"
        }
    }

    public let id: Int
    public let results: Results
}
