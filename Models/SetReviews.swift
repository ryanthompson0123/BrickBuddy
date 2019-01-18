//
//  SetReviews.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 1/16/19.
//  Copyright © 2019 Ryan Thompson. All rights reserved.
//

import Foundation
import IGListKit

class SetReviews: ListDiffable {
    var reviews: [BricksetReview]?
    
    init(reviews: [BricksetReview]?) {
        self.reviews = reviews
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return "reviews" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard let object = object as? SetReviews else { return false }
        
        let result = ListDiff(oldArray: reviews, newArray: object.reviews, option: IGListDiffOption.equality)
        
        return !result.hasChanges
    }
}
