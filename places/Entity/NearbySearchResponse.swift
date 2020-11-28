//
//  NearbySea.swift
//  places
//
//  Created by Елизавета on 22.11.2020.
//

import Foundation

struct NearbySearchResponse: Codable {

    var nextPageToken: String?
    var results: [Place]

    enum CodingKeys: String, CodingKey {
        case nextPageToken = "next_page_token"
        case results
    }

}
