//
//  ReviewBodyViewModel.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 1/17/19.
//  Copyright © 2019 Ryan Thompson. All rights reserved.
//

import Foundation
import IGListKit

class ReviewBodyViewModel: ListDiffable {
    
    let text: String?
    let isHTML: Bool
    
    init(text: String?, isHTML: Bool) {
        self.text = text
        self.isHTML = isHTML
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return (text ?? "") as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard let object = object as? ReviewBodyViewModel else { return false }
        return text == object.text && isHTML == object.isHTML
    }
}
