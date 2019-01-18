//
//  ReviewTextCell.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 1/17/19.
//  Copyright © 2019 Ryan Thompson. All rights reserved.
//

import IGListKit
import UIKit

class ReviewBodyCell: UICollectionViewCell, ListBindable {
    fileprivate static let insets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    fileprivate static let font = UIFont.systemFont(ofSize: 16)
    
    static let key = "reviewBodyCell"
    @IBOutlet weak var contentLabel: UILabel!
    
    static func textHeight(_ text: String, width: CGFloat) -> CGFloat {
        let constrainedSize = CGSize(width: width - insets.left - insets.right, height: CGFloat.greatestFiniteMagnitude)
        let attributes = [ NSAttributedString.Key.font: font ]
        let options: NSStringDrawingOptions = [.usesFontLeading, .usesLineFragmentOrigin]
        let bounds = (text as NSString).boundingRect(with: constrainedSize, options: options, attributes: attributes, context: nil)
        return ceil(bounds.height) + insets.top + insets.bottom
    }
    
    var content: String? {
        get {
            return contentLabel.text
        }
        set {
            contentLabel.text = newValue
        }
    }
    
    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? ReviewBodyCell else { return }
        
        content = viewModel.content
    }
}
