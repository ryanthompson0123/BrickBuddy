//
//  ViewController.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 12/12/18.
//  Copyright © 2018 Ryan Thompson. All rights reserved.
//

import IGListKit
import UIKit
import Moya
import XMLCoder

class SetsViewController: UIViewController, ListAdapterDataSource, UIScrollViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    lazy var provider: MoyaProvider<BricksetService> = {
        return MoyaProvider<BricksetService>(plugins: [SoapApiKeyPlugin(apiKey: "")])
    }()
    
    lazy var items: [BricksetSet] = Array()
    
    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self)
    }()
    
    var loading = false
    
    var nextPage = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 0)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        adapter.scrollViewDelegate = self
        
        loadMoreItems()
    }
    
    func loadMoreItems() {
        loading = true
        
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
            
            self.loading = false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "setSegue" {
            guard let sender = sender as? UICollectionViewCell else { return }
            guard let path = collectionView.indexPath(for: sender) else { return }
            guard let destination = segue.destination as? SetDetailContainerViewController else { return }
            
            destination.set = items[path.section]
        }
    }
    
    // MARK: ListAdapterDataSource
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return items as [ListDiffable]
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return SetSectionController()
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? { return nil }
    
    // MARK: UIScrollViewDelegate
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
        if !loading && distance < 200 {
            loadMoreItems()
        }
    }
}

