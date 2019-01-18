//
//  SetFacts.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 1/16/19.
//  Copyright © 2019 Ryan Thompson. All rights reserved.
//

import Foundation
import IGListKit

class SetFacts: ListDiffable {
    let facts: [String: String?]
    
    init(set: BricksetSet?) {
        facts = SetFacts.getFacts(set: set)
    }
    
    class func getFacts(set: BricksetSet?) -> [String: String?] {
        return [
            "Name": set?.name,
            "Number": set?.number,
            "Year": set?.year,
            "Theme": set?.theme,
            "Subtheme": set?.subtheme,
            "Pieces": set?.pieces,
            "Minifigs": set?.minifigs,
            "MSRP": set?.USRetailPrice,
        ]
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return "facts" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard let object = object as? SetFacts else { return false }

        return facts == object.facts
    }
}
