//
//  ReviewMetricCell.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 1/17/19.
//  Copyright © 2019 Ryan Thompson. All rights reserved.
//

import UIKit
import IGListKit

class ReviewMetricCell: UICollectionViewCell, ListBindable {
    static let key = "reviewMetricCell"
    @IBOutlet weak var metricLabel: UILabel!
    @IBOutlet weak var starsImage: UIImageView!
    
    var metric: String? {
        get {
            return metricLabel.text
        }
        set {
            metricLabel.text = newValue
        }
    }
    
    var stars: Int? {
        get {
            return 0
        }
        set {
            
        }
    }
    
    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? ReviewMetricViewModel else { return }
        
        metric = viewModel.title
        stars = viewModel.stars
    }
}
