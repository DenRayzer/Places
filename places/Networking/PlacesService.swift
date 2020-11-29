//
//  Service.swift
//  places
//
//  Created by Елизавета on 22.11.2020.
//

import UIKit
import CoreLocation

protocol PlacesService {
    func getCurrentLocation() -> CLLocationCoordinate2D?
    func loadPlaces(with pagetoken: String?, completionHandler: @escaping (NearbySearchResponse?) -> Void)
    func loadPhoto(with photo: Photo, completionHandler: @escaping (UIImage?) -> Void)

}
