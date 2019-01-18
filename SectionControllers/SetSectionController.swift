//
//  SetSectionController.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 12/14/18.
//  Copyright © 2018 Ryan Thompson. All rights reserved.
//

import IGListKit
import Foundation

class SetSectionController: ListSectionController, ListDisplayDelegate {

    private var set: BricksetSet?
    
    override init() {
        super.init()
        
        self.inset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 20)
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        guard let containerWidth = collectionContext?.containerSize.width else { return .zero }
        guard let containerHeight = collectionContext?.containerSize.height else { return .zero }
        let itemWidth = floor((containerWidth - 20) /  3 - 20)
        let itemHeight = floor(containerHeight / 2.5)
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        guard let cell = collectionContext?.dequeueReusableCellFromStoryboard(withIdentifier: SetCell.key,
                                                                              for: self,
                                                                              at: index) as? SetCell else {
                                                                                fatalError()
        }
        cell.setupCell()
        cell.setID = set?.id
        cell.title = set?.formatTitle()
        cell.theme = set?.formatTheme()
        cell.year = set?.year
        cell.partCount = set?.pieces
        cell.imageURL = set?.imageUrl
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        set = object as? BricksetSet
    }
    
    override func didSelectItem(at index: Int) {
        
    }
    
    // MARK: ListDisplayDelegate
    
    func listAdapter(_ listAdapter: ListAdapter, willDisplay sectionController: ListSectionController) {
        return
    }
    
    func listAdapter(_ listAdapter: ListAdapter, willDisplay sectionController: ListSectionController, cell: UICollectionViewCell, at index: Int) {
        return
    }
    
    func listAdapter(_ listAdapter: ListAdapter, didEndDisplaying sectionController: ListSectionController) {
        return
    }
    
    func listAdapter(_ listAdapter: ListAdapter, didEndDisplaying sectionController: ListSectionController, cell: UICollectionViewCell, at index: Int) {
        if let setCell = cell as? SetCell {
            setCell.cancelDownload()
        }
    }
}
