//
//  SetHeaderSectionController.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 1/16/19.
//  Copyright © 2019 Ryan Thompson. All rights reserved.
//

import Foundation
import IGListKit

class SetHeaderSectionController: ListSectionController {
    private var header: SetHeader?
    
    override init() {
        super.init()
        
        
    }
    
    override func numberOfItems() -> Int {
        return 2
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let containerWidth = collectionContext?.containerSize.width else { return .zero }
        
        if (index == 0) {
            return CGSize(width: containerWidth, height: 500)
        } else {
            return CGSize(width: containerWidth, height: 60)
        }
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        if (index == 0) {
            guard let cell = collectionContext?.dequeueReusableCellFromStoryboard(withIdentifier: ImageCell.key,
                                                                                  for: self,
                                                                                  at: index) as? ImageCell else {
                                                                                    fatalError()
            }
            
            cell.setID = header?.setID
            cell.imageURL = header?.imageURL
            
            return cell
        } else {
            guard let cell = collectionContext?.dequeueReusableCellFromStoryboard(withIdentifier: HeaderCell.key,
                                                                                  for: self,
                                                                                  at: index) as? HeaderCell else {
                                                                                    fatalError()
            }
            
            cell.title = header?.title
            cell.theme = header?.theme

            return cell
        }
    }
    
    override func didUpdate(to object: Any) {
        header = object as? SetHeader
    }
    
    override func didSelectItem(at index: Int) {
        
    }
}
