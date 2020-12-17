//
//  PlacesPresenter.swift
//  places
//
//  Created by Елизавета on 22.11.2020.
//

import CoreLocation

class PlacesPresenter: PlacesPresenterDelegate {
    var places: [Place] = []
    private var service: PlacesService
    private var viewDelegate: PlacesViewDelegate
    private var nextPageToken: String? = Constant.firstPageFlag

    init(viewDelegate: PlacesViewDelegate, service: PlacesService = GooglePlacesService()) {
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

    func refreshData(completion: @escaping () -> Void) {
        nextPageToken = Constant.firstPageFlag
        service.loadPlaces(with: nextPageToken) { result in
            guard let response = result else { return }
            self.nextPageToken = response.nextPageToken
            self.places.removeAll()
            for i in response.results {
                self.places.append(i)
            }
            self.viewDelegate.showData()
            completion()
        }
    }

    func getCurrentLocation() -> CLLocationCoordinate2D? {
        return service.getCurrentLocation()
    }

    func getDistanceFromUserLocation(to: Location) -> String? {
        guard let location = service.getCurrentLocation() else { return nil }
        let from = CLLocation(latitude: location.latitude, longitude: location.longitude)
        let to = CLLocation(latitude: to.lat, longitude: to.lng)
        return String.init(format: "Distance %.0f meters", from.distance(from: to))

    }

}
