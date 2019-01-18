//
//  ReviewMetricViewModel.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 1/17/19.
//  Copyright © 2019 Ryan Thompson. All rights reserved.
//

import Foundation
import IGListKit

class ReviewMetricViewModel: ListDiffable {
    
    let title: String
    let stars: Int
    
    init(title: String, stars: Int) {
        self.title = title
        self.stars = stars
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return (title + String(stars)) as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard let object = object as? ReviewMetricViewModel else { return false }
        return title == object.title && stars == object.stars
    }
}
