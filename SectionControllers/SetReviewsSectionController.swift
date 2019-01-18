//
//  SetReviewsSectionController.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 1/16/19.
//  Copyright © 2019 Ryan Thompson. All rights reserved.
//

import Foundation
import IGListKit

class SetReviewsSectionController: ListBindingSectionController<SetReviews>, ListBindingSectionControllerDataSource {

    override init() {
        super.init()
        dataSource = self
    }
    
    func createViewModels(for review: BricksetReview) -> [ListDiffable] {
        var viewModels: [ListDiffable] = Array()
        
        viewModels.append(ReviewHeaderViewModel(title: review.title, author: review.author))
        
        viewModels.append(ReviewMetricViewModel(title: "Overall Rating", stars: review.overallRating))
        viewModels.append(ReviewMetricViewModel(title: "Building Experience", stars: review.buildingExperience))
        viewModels.append(ReviewMetricViewModel(title: "Playability", stars: review.playability))
        viewModels.append(ReviewMetricViewModel(title: "Value", stars: review.valueForMoney))
        
        viewModels.append(ReviewBodyViewModel(text: review.review, isHTML: review.isHTML))
        
        return viewModels
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, viewModelsFor object: Any) -> [ListDiffable] {
        guard let reviewHolder = object as? SetReviews else { return [] }
        guard let reviews = reviewHolder.reviews else { return [LoadingViewModel(message: nil)] }
        
        return reviews.flatMap {
            return createViewModels(for: $0)
        }
    }
    
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, cellForViewModel viewModel: Any, at index: Int) -> UICollectionViewCell & ListBindable {
        let cellIdentifier: String
        if viewModel is ReviewHeaderViewModel {
            cellIdentifier = ReviewHeaderCell.key
        } else if viewModel is ReviewMetricViewModel {
            cellIdentifier = ReviewMetricCell.key
        } else if viewModel is ReviewBodyViewModel {
            cellIdentifier = ReviewBodyCell.key
        } else {
            cellIdentifier = LoadingCell.key
        }
        
        guard let cell = collectionContext?.dequeueReusableCellFromStoryboard(withIdentifier: cellIdentifier,
                                                                              for: self,
                                                                              at: index) as? UICollectionViewCell & ListBindable else {
                                                                                fatalError()
        }
        return cell
    }
    
    func sectionController(_ sectionController: ListBindingSectionController<ListDiffable>, sizeForViewModel viewModel: Any, at index: Int) -> CGSize {
        guard let width = collectionContext?.containerSize.width else { return .zero }
        if viewModel is ReviewHeaderViewModel {
            return CGSize(width: width, height: 80)
        } else if viewModel is ReviewMetricViewModel {
            return CGSize(width: width / 2.0, height: 50)
        } else if viewModel is ReviewBodyViewModel {
            guard let viewModel = viewModel as? ReviewBodyViewModel else { return .zero }
            let height = ReviewBodyCell.textHeight((viewModel.text ?? ""), width: width)
            return CGSize(width: width, height: height)
        } else {
            return CGSize(width: width, height: 44)
        }
    }
}
