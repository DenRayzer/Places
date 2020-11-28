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
    var photos: [Photo]?
    var reference: String?

    enum CodingKeys: String, CodingKey {
        case placeID = "place_id"
        case geometry
        case name
        case reference
        case photos
    }

}
