//
//  DetailInfoPresenter.swift
//  places
//
//  Created by Елизавета on 28.11.2020.
//

import Foundation
import CoreLocation

class MapPresenter: MapPresenterDelegate {
    var viewDelegate: MapViewDelegate!
    var userLocation: CLLocationCoordinate2D?
    var place: Place?

    func setViewDelegate(viewDelegate: MapViewDelegate) {
        self.viewDelegate = viewDelegate
    }

    func getPlaceLocation() -> CLLocationCoordinate2D? {
        guard let location = place?.geometry.location else { return nil }
        return CLLocationCoordinate2D(latitude: location.lat, longitude: location.lng)
    }

}
