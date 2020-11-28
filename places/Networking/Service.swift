//
//  Service.swift
//  places
//
//  Created by Елизавета on 22.11.2020.
//

import Foundation
import CoreLocation

protocol Service {

    func getCurrentLocation() -> CLLocationCoordinate2D?
    func loadPlaces(with pagetoken: String?, completionHandler: @escaping (NearbySearchResponse?) -> Void)

}
