//
//  Photo.swift
//  places
//
//  Created by Елизавета on 28.11.2020.
//

import Foundation

struct Photo: Codable {
    var ref: String
    var width: Int
    var height: Int

    enum CodingKeys: String, CodingKey {
        case ref = "photo_reference"
        case width
        case height
    }

}
