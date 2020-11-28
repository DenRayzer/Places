//
//  PlacesPresenter.swift
//  places
//
//  Created by Елизавета on 22.11.2020.
//

import Foundation
import CoreLocation

class PlacesPresenter: PlacesPresenterDelegate {

    var places: [Place] = []
    private var service: Service
    private var viewDelegate: PlacesViewDelegate
    private var nextPageToken: String? = "0"

    init(viewDelegate: PlacesViewDelegate, service: Service = PlacesService()) {
        self.service = service
        self.viewDelegate = viewDelegate
    }

    func loadPlaces() {
        service.loadPlaces(with: nextPageToken) { result in
            guard let response = result else { return }
            self.nextPageToken = response.nextPageToken
            for i in response.results {
                self.places.append(i)
            }
            self.viewDelegate.showData()
        }
    }

    func getCurrentLocation() -> CLLocationCoordinate2D? {
        return service.getCurrentLocation()
    }

    func getDistanceFromUserLocation(to: Location) -> String? {
        guard let location = service.getCurrentLocation() else { return nil }
        let from = CLLocation(latitude: location.latitude, longitude: location.longitude)
        let to = CLLocation(latitude: to.lat, longitude: to.lng)
        return String.init(format: "Distance %.2f meters", from.distance(from: to))

    }

}
