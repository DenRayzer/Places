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
        let camera = GMSCameraPosition.camera(withLatitude: mapView.myLocation?.coordinate.latitude ?? 121.082711, longitude: mapView.myLocation?.coordinate.longitude ?? 121.082711, zoom: 7)
        mapView.camera = camera
        self.navigationController?.navigationBar.shadowImage = UIImage()
        mapView.settings.compassButton = true
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
    }

    override func viewWillAppear(_ animated: Bool) {
        showData()
        addCurrentLocationMarker(presenter.userLocation)
    }

    func addCurrentLocationMarker(_ userLocation: CLLocationCoordinate2D?) {
        guard let location = userLocation else { return }
        let marker = GMSMarker()
        marker.position = location
        marker.title = "Your location"
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

        //Finally stop updating location otherwise it will come again and again in this delegate
        self.locationManager.stopUpdatingLocation()

    }
}
