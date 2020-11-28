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

    init( service: Service = PlacesService()) {
        self.service = service
    }

    func setViewDelegate(viewDelegate: DetailInfoViewDelegate) {
        self.viewDelegate = viewDelegate
    }

    

}
