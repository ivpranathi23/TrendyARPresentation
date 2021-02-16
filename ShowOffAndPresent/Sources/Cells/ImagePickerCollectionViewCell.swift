//
//  PickImagesCollectionViewCell.swift
//  ARBirthdayCelebration
//
//  Created by Venkata Pranathi on 30/04/19.
//  Copyright © 2019 Venkata Pranathi. All rights reserved.
//

import UIKit

class ImagePickerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        self.photoImageView.layer.borderWidth = 3
        self.photoImageView.layer.borderColor = UIColor.white.cgColor
        self.photoImageView.layer.cornerRadius = 20
        self.photoImageView.layer.masksToBounds = true
    }
}
