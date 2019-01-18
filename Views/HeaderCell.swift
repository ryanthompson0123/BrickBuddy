//
//  HeaderCell.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 1/16/19.
//  Copyright © 2019 Ryan Thompson. All rights reserved.
//

import UIKit
import Kingfisher
import Hero

class HeaderCell: UICollectionViewCell {
    static let key = "headerCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var themeLabel: UILabel!
    
    var setID: Int? {
        didSet {
            guard let setID = setID else { return }
            
            titleLabel.hero.id = "\(setID)-title"
            themeLabel.hero.id = "\(setID)-theme"
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
}
