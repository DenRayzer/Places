//
//  DetailInfoViewController.swift
//  places
//
//  Created by Елизавета on 22.11.2020.
//

import UIKit
import GoogleMaps

class DetailInfoViewController: UIViewController {
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var officeHoursLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    var locationManager = CLLocationManager()
    var presenter: DetailInfoPresenterDelegate = DetailInfoPresenter()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.shadowImage = UIImage()
        configureMapView()
    }

    func configureMapView() {
        guard let location = presenter.place?.geometry.location else { return }
        let camera = GMSCameraPosition.camera(withLatitude: location.lat, longitude: location.lng, zoom: 12)
        mapView.camera = camera
        mapView.settings.compassButton = true
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        addLocationMarker(for: presenter.userLocation, title: "Your Location")
        addLocationMarker(for: presenter.getPlaceLocation(), title: presenter.place?.name ?? "")
    }

    override func viewWillAppear(_ animated: Bool) {
        showData()
    }

    func addLocationMarker(for location: CLLocationCoordinate2D?, title: String) {
        guard let location = location else { return }
        let marker = GMSMarker()
        marker.position = location
        marker.title = title
        marker.map = mapView
    }

}

extension DetailInfoViewController: DetailInfoViewDelegate {

    func showData() {
        titleLabel.text = presenter.place?.name
        var isOpen: String = "no information"
        if let inf = presenter.place?.openingHours?.isOpen {
            isOpen = String(inf)
        }
        officeHoursLabel.text = "Is open now: \(isOpen)"
        descriptionLabel.text = presenter.place?.types?.joined(separator: ", ")
        if let p = presenter.place?.photos {
            PlacesService.loadPhoto(with: p[0]) { r in
                guard let im = r else { return }
                self.photoImageView.image = im
            }
        }
    }

    func setPresenter() {
        presenter.setViewDelegate(viewDelegate: self)
    }

}

extension DetailInfoViewController: CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        let location = locations.last

        let camera = GMSCameraPosition.camera(withLatitude: (location?.coordinate.latitude)!, longitude: (location?.coordinate.longitude)!, zoom: 17.0)

        self.mapView?.animate(to: camera)
        self.locationManager.stopUpdatingLocation()

    }
}
