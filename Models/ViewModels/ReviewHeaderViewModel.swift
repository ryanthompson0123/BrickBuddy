//
//  ReviewHeaderViewModel.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 1/17/19.
//  Copyright © 2019 Ryan Thompson. All rights reserved.
//

import Foundation
import IGListKit

class ReviewHeaderViewModel: ListDiffable {
    
    let title: String?
    let author: String?
    
    init(title: String?, author: String?) {
        self.title = title
        self.author = author
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return ((title ?? "") + (author ?? "")) as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard let object = object as? ReviewHeaderViewModel else { return false }
        return title == object.title && author == object.author
    }
}
