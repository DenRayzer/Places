//
//  PlacesCollectionViewCell.swift
//  places
//
//  Created by Елизавета on 22.11.2020.
//

import UIKit

class PlacesCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 8

    }

    var isHeightCalculated: Bool = false

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
