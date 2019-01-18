//
//  ReviewCell.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 1/16/19.
//  Copyright © 2019 Ryan Thompson. All rights reserved.
//

import UIKit
import IGListKit

class ReviewHeaderCell: UICollectionViewCell, ListBindable {
    static let key = "reviewHeaderCell"
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var title: String? {
        get {
            return titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    var author: String? {
        get {
            return authorLabel.text
        }
        set {
            authorLabel.text = newValue
        }
    }
    
    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? ReviewHeaderViewModel else { return }
        
        title = viewModel.title
        author = viewModel.author
    }
}
