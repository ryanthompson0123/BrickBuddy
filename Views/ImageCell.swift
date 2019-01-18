//
//  ImageCell.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 1/16/19.
//  Copyright © 2019 Ryan Thompson. All rights reserved.
//

import UIKit
import Kingfisher

class ImageCell: UICollectionViewCell {
    static let key = "imageCell"
    
    @IBOutlet weak var imageView: UIImageView!
    
    var setID: Int? {
        didSet {
            guard let setID = setID else { return }
            
            imageView.hero.id = "\(setID)-image"
        }
    }
    
    var imageURL: URL? {
        get {
            return imageView.kf.webURL
        }
        set {
            
            guard let url = newValue else {
                imageView.image = nil
                return
            }
            
            let resource = ImageResource(downloadURL: url, cacheKey: "key-\(setID!)")
            
            imageView.kf.setImage(
                with: resource,
                placeholder: nil,
                options: [
                ])
        }
    }
}
