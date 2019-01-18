//
//  SetCell.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 12/14/18.
//  Copyright © 2018 Ryan Thompson. All rights reserved.
//

import UIKit
import Kingfisher

class SetCell: UICollectionViewCell {
    static let key = "setCell"
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var themeLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var listsButton: UIButton!
    @IBOutlet weak var partsButton: UIButton!
    
    var downloadTask: DownloadTask?
    
    var setID: Int? {
        didSet {
            guard let setID = setID else { return }
            
            hero.id = "\(setID)"
            titleLabel.hero.id = "\(setID)-title"
            themeLabel.hero.id = "\(setID)-theme"
            imageView.hero.id = "\(setID)-image"
        }
    }
    
    var title: String? {
        get {
            return titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    var theme: String? {
        get {
            return themeLabel.text
        }
        set {
            themeLabel.text = newValue
        }
    }
    
    var year: String? {
        get {
            return yearLabel.text
        }
        set {
            yearLabel.text = newValue
        }
    }
    
    var partCount: String? {
        get {
            return partsButton.titleLabel?.text
        }
        set {
            partsButton.setTitle(newValue, for: UIControl.State.normal)
        }
    }
    
    var imageURL: URL? {
        get {
            return imageView.kf.webURL
        }
        set {
            downloadTask?.cancel()
            
            guard let url = newValue else {
                imageView.image = nil
                return
            }
            
            let resource = ImageResource(downloadURL: url, cacheKey: "key-\(setID!)")
            
            downloadTask = imageView.kf.setImage(
                with: resource,
                placeholder: nil,
                options: [
                ])
            {
                result in
                self.downloadTask = nil
            }
        }
    }
    
    func cancelDownload() {
        downloadTask?.cancel()
    }
    
    func setupCell() {
        cardView.layer.cornerRadius = 10.0
        cardView.layer.borderWidth = 1.0
        cardView.layer.borderColor = UIColor.clear.cgColor
        cardView.layer.masksToBounds = true
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5.0)
        layer.shadowRadius = 7.0
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cardView.layer.cornerRadius).cgPath
    }
    
    override func prepareForReuse() {
        year = nil
        partCount = nil
    }
}
