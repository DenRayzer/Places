//
//  DetailInfoPresenterDelegate.swift
//  places
//
//  Created by Елизавета on 28.11.2020.
//

import CoreLocation

protocol MapPresenterDelegate {
    var userLocation: CLLocationCoordinate2D? { set get }
    var place: Place? { set get }
    func setViewDelegate(viewDelegate: MapViewDelegate)
    func getPlaceLocation() -> CLLocationCoordinate2D?

}
