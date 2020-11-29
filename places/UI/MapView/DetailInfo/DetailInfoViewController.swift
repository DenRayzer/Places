//
//  DetailInfoViewController.swift
//  places
//
//  Created by Елизавета on 29.11.2020.
//

import UIKit
import FloatingPanel

class DetailInfoViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var officeHoursLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    var presenter: DetailInfoPresenterDelegate = DetailInfoPresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
    }

    func setData() {
        guard let place = presenter.place else {
            return
        }
        titleLabel.text = place.name
        var isOpen: String = "no information"
        if let inf = place.openingHours?.isOpen {
            isOpen = String(inf)
        }
        officeHoursLabel.text = "Is open now: \(isOpen)"
        descriptionLabel.text = presenter.place?.types?.joined(separator: ", ")
        presenter.setImage()
        }
    }




extension DetailInfoViewController: DetailInfoViewDelegate {
    func setPresenter() {
        presenter.setViewDelegate(viewDelegate: self)
    }

    func setImage(with image: UIImage) {
        self.photoImageView.image = image
    }
    
}
