//
//  LoadingViewModel.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 1/16/19.
//  Copyright © 2019 Ryan Thompson. All rights reserved.
//

import Foundation
import IGListKit

class LoadingViewModel: ListDiffable {
    let message: String?
    
    init(message: String?) {
        self.message = message
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return "loading" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard let object = object as? LoadingViewModel else { return false }
        return message == object.message
    }
}
