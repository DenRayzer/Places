//
//  DetailInfoPresenterDelegate.swift
//  places
//
//  Created by Елизавета on 29.11.2020.
//

import UIKit
import CoreLocation

protocol DetailInfoPresenterDelegate {
    var place: Place? { set get }
    func setViewDelegate(viewDelegate: DetailInfoViewDelegate)
    func showData()
    func setImage()
    
}
