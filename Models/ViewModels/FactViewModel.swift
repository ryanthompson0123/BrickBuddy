//
//  FactViewModel.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 12/19/18.
//  Copyright © 2018 Ryan Thompson. All rights reserved.
//

import Foundation
import IGListKit

class FactViewModel: ListDiffable {
    let title: String
    let value: String?
    
    init(title: String, value: String?) {
        self.title = title
        self.value = value
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return (title + (value ?? "")) as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard let object = object as? FactViewModel else { return false }
        return title == object.title && value == object.value
    }
}
