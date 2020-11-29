//
//  PlacesPresenterDelegate.swift
//  places
//
//  Created by Елизавета on 22.11.2020.
//

import CoreLocation

protocol PlacesPresenterDelegate {
    var places: [Place] { get }
    func loadPlaces()
    func refreshData(completion: @escaping () -> Void)
    func getDistanceFromUserLocation(to: Location) -> String?
    func getCurrentLocation() -> CLLocationCoordinate2D?

}
