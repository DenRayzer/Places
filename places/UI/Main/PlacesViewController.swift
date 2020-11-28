//
//  ViewController.swift
//  places
//
//  Created by Елизавета on 21.11.2020.
//

import UIKit

class PlacesViewController: UIViewController {
    
    @IBOutlet weak var placesCollectionView: UICollectionView!
    var presenter: PlacesPresenterDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = PlacesPresenter(viewDelegate: self)
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveLocation(_:)), name: .didReceiveLocation, object: nil)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        setupPlacesCollectionView()
    }

    @objc func onDidReceiveLocation(_ notification: Notification) {
        presenter.loadPlaces()
    }

    private func setupPlacesCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = CGSize(width: placesCollectionView.bounds.width, height: 110)
        placesCollectionView.setCollectionViewLayout(layout, animated: false)

        let nib = UINib(nibName: "PlacesCollectionViewCell", bundle: nil)
        placesCollectionView.register(nib, forCellWithReuseIdentifier: "PlacesCollectionViewCell")
    }

}

// MARK: --PlacesViewDelegate

extension PlacesViewController: PlacesViewDelegate {

    func showData() {
        self.placesCollectionView.reloadData()
    }

}

// MARK: --UICollectionViewDelegate, UICollectionViewDataSource

extension PlacesViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.places.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlacesCollectionViewCell", for: indexPath) as! PlacesCollectionViewCell
        let place = presenter.places[indexPath.row]
        cell.configureCell(with: place, distance: presenter.getDistanceFromUserLocation(to: place.geometry.location) ?? "")
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "DetailInfoViewController") as! DetailInfoViewController
        navigationController?.pushViewController(controller, animated: true)

    }

    func collectionView(_ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath) {
        if indexPath.row == presenter.places.count - 2 {
            presenter.loadPlaces()
        }
    }

}

// MARK: --UICollectionViewDelegateFlowLayout

extension PlacesViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = CGFloat(110)
        return CGSize(width: width, height: height)
    }

}

