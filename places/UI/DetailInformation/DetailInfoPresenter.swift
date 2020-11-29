//
//  DetailInfoPresenter.swift
//  places
//
//  Created by Елизавета on 28.11.2020.
//

import Foundation
import CoreLocation

class DetailInfoPresenter: DetailInfoPresenterDelegate {
    var service: Service
    var viewDelegate: DetailInfoViewDelegate!
    var userLocation: CLLocationCoordinate2D?
    var place: Place?

    init(service: Service = PlacesService()) {
        self.service = service
    }

    func setViewDelegate(viewDelegate: DetailInfoViewDelegate) {
        self.viewDelegate = viewDelegate
    }

    func getPlaceLocation() -> CLLocationCoordinate2D? {
        guard let location = place?.geometry.location else { return nil }
        return CLLocationCoordinate2D(latitude: location.lat, longitude: location.lng)
    }

}
