//
//  PlacesPresenterDelegate.swift
//  places
//
//  Created by Елизавета on 22.11.2020.
//

import Foundation

protocol PlacesPresenterDelegate {

    var places: [Place] { get }
    func currentLocation()
    func loadPlaces()
    func getDistanceFromUserLocation(to: Location) -> String?
    
}
