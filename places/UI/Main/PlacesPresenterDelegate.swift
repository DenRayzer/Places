//
//  PlacesPresenterDelegate.swift
//  places
//
//  Created by Елизавета on 22.11.2020.
//

import Foundation
import CoreLocation

protocol PlacesPresenterDelegate {

    var places: [Place] { get }
    func loadPlaces()
    func getDistanceFromUserLocation(to: Location) -> String?
    func getCurrentLocation() -> CLLocationCoordinate2D?
}
