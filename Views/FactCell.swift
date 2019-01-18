//
//  FactCell.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 1/16/19.
//  Copyright © 2019 Ryan Thompson. All rights reserved.
//

import UIKit
import IGListKit

class FactCell: UICollectionViewCell, ListBindable {
    static let key = "factCell"
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueButton: UIButton!
    
    var title: String? {
        get {
            return titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }
    
    var value: String? {
        get {
            return valueButton.titleLabel?.text
        }
        set {
            valueButton.setTitle(newValue, for: UIControl.State.normal)
        }
    }
    
    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? FactViewModel else { return }
        
        title = viewModel.title
        value = viewModel.value
    }
}
