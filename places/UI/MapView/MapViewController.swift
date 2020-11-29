//
//  DetailInfoViewController.swift
//  places
//
//  Created by Елизавета on 22.11.2020.
//

import UIKit
import GoogleMaps
import FloatingPanel

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: GMSMapView!
    var locationManager = CLLocationManager()
    var presenter: MapPresenterDelegate = MapPresenter()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.shadowImage = UIImage()
        configureMapView()
    }


    func configureMapView() {
        guard let location = presenter.place?.geometry.location else {
            return }
        addLocationMarker(for: presenter.getPlaceLocation(), title: presenter.place?.name ?? "")
        addLocationMarker(for: presenter.userLocation, title: Constant.userLocationMarkerName)
        let camera = GMSCameraPosition.camera(withLatitude: location.lat, longitude: location.lng, zoom: 12)
        mapView.camera = camera
        mapView.settings.compassButton = true
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        self.locationManager.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        setData()
    }

    func addLocationMarker(for location: CLLocationCoordinate2D?, title: String) {
        guard let location = location else { return }
        let marker = GMSMarker()
        marker.position = location
        marker.title = title
        marker.map = mapView
    }

}

// MARK: --FloatingPanelControllerDelegate

extension MapViewController: FloatingPanelControllerDelegate {
    func configureFloatingPanel() {
        let floatingPanelController = FloatingPanelController()
        floatingPanelController.delegate = self
        let storyboard = UIStoryboard(name: Constant.mainStoryboardName, bundle: nil)
        guard let detailInfoVC = storyboard.instantiateViewController(identifier: Constant.detailInfoControllerIdentifier) as? DetailInfoViewController else {
            return
        }
        floatingPanelController.set(contentViewController: detailInfoVC)
        floatingPanelController.addPanel(toParent: self)
        guard let place = presenter.place else { return }
        detailInfoVC.setPresenter()
        detailInfoVC.presenter.place = place
        detailInfoVC.presenter.showData()
    }

}

// MARK: --DetailInfoViewDelegate

extension MapViewController: MapViewDelegate {
    func setData() {
        configureFloatingPanel()
    }

    func setPresenter() {
        presenter.setViewDelegate(viewDelegate: self)
    }

}

// MARK: --FloatingPanelControllerDelegate

extension MapViewController: CLLocationManagerDelegate {

}
