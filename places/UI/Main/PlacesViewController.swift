//
//  ViewController.swift
//  places
//
//  Created by Елизавета on 21.11.2020.
//

import UIKit

class PlacesViewController: UIViewController {
    @IBOutlet weak var placesCollectionView: UICollectionView!
    var places: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPlacesCollectionView()
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

extension PlacesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        places.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlacesCollectionViewCell", for: indexPath) as! PlacesCollectionViewCell
        return cell
    }

}

extension PlacesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = CGFloat(110)
        return CGSize(width: width, height: height)
    }

}

