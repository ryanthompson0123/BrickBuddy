//
//  SetDetailConterViewController.swift
//  BrickBuddy
//
//  Created by Ryan Thompson on 1/17/19.
//  Copyright © 2019 Ryan Thompson. All rights reserved.
//

import Foundation
import UIKit

class SetDetailContainerViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    
    var set: BricksetSet?
    var blurEffectView: UIView!
    
    lazy var tapRecognizer: UITapGestureRecognizer = {
        let tap = UITapGestureRecognizer(target: self, action: #selector(SetDetailContainerViewController.blurEffectViewTapped(_:)))
        tap.numberOfTapsRequired = 1
        tap.numberOfTouchesRequired = 1
        
        return tap
    }()
    
    override func viewDidLoad() {
        setupTransparencyLayer()
        setupRoundedCorners()
        blurEffectView.hero.modifiers = [.fade]
    }
    
    func setupRoundedCorners() {
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 15
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func setupTransparencyLayer() {
        if !UIAccessibility.isReduceTransparencyEnabled {
            view.backgroundColor = .clear
            
            let blurEffect = UIBlurEffect(style: .prominent)
            blurEffectView = UIVisualEffectView(effect: blurEffect)
            //always fill the view
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            blurEffectView.addGestureRecognizer(tapRecognizer)
            view.addSubview(blurEffectView)
            view.sendSubviewToBack(blurEffectView)
            
        } else {
            view.backgroundColor = .black
        }
    }
    
    @objc func blurEffectViewTapped(_ sender: UITapGestureRecognizer) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "setDetailEmbedSegue" {

            guard let nav = segue.destination as? UINavigationController else { return }
            guard let destination = nav.children[0] as? SetDetailViewController else { return }
            destination.set = set
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let bounds = view.bounds
        blurEffectView.frame = bounds
    }
}
