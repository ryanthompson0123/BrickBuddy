//
//  SetHeader.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 1/16/19.
//  Copyright © 2019 Ryan Thompson. All rights reserved.
//

import Foundation
import IGListKit

class SetHeader: ListDiffable {
    var setID: Int?
    var title: String?
    var theme: String?
    var imageURL: URL?
    
    init(set: BricksetSet?) {
        self.setID = set?.id
        self.title = set?.formatTitle()
        self.theme = set?.formatTheme()
        self.imageURL = set?.imageUrl
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return "header" as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard let object = object as? SetHeader else { return false }
        
        return title == object.title && theme == object.theme && imageURL == object.imageURL
    }
}
