//
//  OpeningHours.swift
//  places
//
//  Created by Елизавета on 28.11.2020.
//

import Foundation

struct OpeningHours: Codable {

    var isOpen: Bool

    enum CodingKeys: String, CodingKey {
        case isOpen = "open_now"
    }

}
