//
//  SetDetailViewController.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 12/17/18.
//  Copyright © 2018 Ryan Thompson. All rights reserved.
//

import UIKit
import Kingfisher
import IGListKit
import Moya

class SetDetailViewController: UIViewController, ListAdapterDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var provider: MoyaProvider<BricksetService> = {
        return Providers.getBricksetProvider()
    }()
    
    var set: BricksetSet?
    
    var reviews: [BricksetReview]?
    
    lazy var sections: [ListDiffable] = Array()
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    override func viewDidLoad() {
        if let set = set {
            collectionView.hero.id = "\(set.id)"
        }
        updateSections()
        
        adapter.collectionView = collectionView
        adapter.dataSource = self
        
        loadAdditionalData()
    }
    
    func updateSections() {
        sections = [
            SetHeader(set: set),
            SetFacts(set: set),
            SetReviews(reviews: reviews)
        ]
    }
    
    func loadAdditionalData() {
        provider.request(.getSetsByYear(year: "2018", orderBy: "YearFromDESC", pageSize: 21, page: nextPage)) { result in
            switch result {
            case let .success(moyaResponse):
                let envelope = try? XMLDecoder().decode(BricksetGetSetsEnvelope.self, from: moyaResponse.data)
                
                guard let sets = envelope?.body.response.result.sets else { return }
                self.items.append(contentsOf: sets)
                self.nextPage = self.nextPage + 1
                self.adapter.performUpdates(animated: true, completion: nil)
                break
            case .failure(_):
                break
            }
    }

    
    
    // MARK: ListAdapterDataSource
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return sections
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        switch object {
        case is SetHeader: return SetHeaderSectionController()
        case is SetFacts: return SetFactsSectionController()
        case is SetReviews: return SetReviewsSectionController()
        default: return ListSectionController()
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? { return nil }
}
