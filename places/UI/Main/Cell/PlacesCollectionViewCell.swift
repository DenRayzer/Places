//
//  PlacesCollectionViewCell.swift
//  places
//
//  Created by Елизавета on 22.11.2020.
//

import UIKit

class PlacesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    var isHeightCalculated: Bool = false

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    func configureCell(with place: Place, distance: String) {
        titleLabel.text = place.name
        distanceLabel.text = distance
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var newFrame = layoutAttributes.frame
        newFrame.size.height = CGFloat(ceil(size.height))
        layoutAttributes.frame = newFrame
        isHeightCalculated = true

        return layoutAttributes
    }

}
