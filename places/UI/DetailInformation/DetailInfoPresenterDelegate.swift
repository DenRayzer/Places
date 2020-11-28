//
//  DetailInfoPresenterDelegate.swift
//  places
//
//  Created by Елизавета on 28.11.2020.
//

import Foundation
import CoreLocation

protocol DetailInfoPresenterDelegate {

    var userLocation: CLLocationCoordinate2D? { set get }
    var place: Place? { set get }
    func setViewDelegate(viewDelegate: DetailInfoViewDelegate)
}
