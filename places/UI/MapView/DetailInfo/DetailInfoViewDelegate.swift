//
//  DetailInfoViewDelegate.swift
//  places
//
//  Created by Елизавета on 29.11.2020.
//

import Foundation
import UIKit

protocol DetailInfoViewDelegate {
    var presenter: DetailInfoPresenterDelegate { get set }
    func setPresenter()
    func setData()
    func setImage(with image: UIImage)
    
}
