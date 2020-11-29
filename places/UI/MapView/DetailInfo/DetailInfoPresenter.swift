//
//  DetailInfoPresenter.swift
//  places
//
//  Created by Елизавета on 29.11.2020.
//

import Foundation
import UIKit

class DetailInfoPresenter: DetailInfoPresenterDelegate {

    var place: Place?
    var viewDelegate: DetailInfoViewDelegate!
    var service: PlacesService

    init(service: PlacesService = GooglePlacesService()) {
        self.service = service
    }

    func setViewDelegate(viewDelegate: DetailInfoViewDelegate) {
        self.viewDelegate = viewDelegate
    }

    func showData() {
        viewDelegate.setData()
    }

    func setImage() {
        if let p = place?.photos {
            service.loadPhoto(with: p[0]) { r in
                guard let im = r else { return }
                self.viewDelegate.setImage(with: im)
            }
        }
    }

}
