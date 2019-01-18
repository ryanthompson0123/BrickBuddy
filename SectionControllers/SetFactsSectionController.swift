//
//  SetFactsSectionController.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 1/16/19.
//  Copyright © 2019 Ryan Thompson. All rights reserved.
//

import Foundation
import IGListKit

class SetFactsSectionController: ListBindingSectionController<SetFacts>, ListBindingSectionControllerDataSource {
    
    override init() {
        super.init()
        dataSource = self
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
        guard let facts = object as? SetFacts else { return [] }
        
        return facts.facts
            .filter { $0.value != nil}
            .map { FactViewModel(title: $0.key, value: $0.value!) }
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        guard let cell = collectionContext?.dequeueReusableCellFromStoryboard(withIdentifier: FactCell.key,
                                                                              for: self,
                                                                              at: index) as? UICollectionViewCell & ListBindable else {
                                                                                fatalError()
        }
        return cell
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, sizeForViewModel viewModel: Any, at index: Int) -> CGSize {
        guard let width = collectionContext?.containerSize.width else { return .zero }
        
        return CGSize(width: width / 2.0, height: 50)
    }
}
