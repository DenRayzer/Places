//
//  Place.swift
//  places
//
//  Created by Елизавета on 22.11.2020.
//

import Foundation

struct Place: Codable {

    var placeID: String
    var geometry: Geometry
    var name: String
    var openingHours: OpeningHours?
    var photos: [Photo]?
    var reference: String?
    var types: [String]?

    enum CodingKeys: String, CodingKey {
        case placeID = "place_id"
        case geometry
        case name
        case openingHours = "opening_hours"
        case reference
        case photos
        case types
    }

}
