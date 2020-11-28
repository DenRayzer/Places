//
//  DetailInfoViewDelegate.swift
//  places
//
//  Created by Елизавета on 28.11.2020.
//

import Foundation

protocol DetailInfoViewDelegate {
    var presenter: DetailInfoPresenterDelegate { get set}
    func showData()
    func setPresenter()
}
