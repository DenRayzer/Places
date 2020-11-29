//
//  DetailInfoViewDelegate.swift
//  places
//
//  Created by Елизавета on 28.11.2020.
//

import Foundation

protocol MapViewDelegate {
    var presenter: MapPresenterDelegate { get set }
    func setData()
    func setPresenter()
    func configureFloatingPanel()

}
