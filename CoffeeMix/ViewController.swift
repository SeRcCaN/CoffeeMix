//
//  ViewController.swift
//  CoffeeMix
//
//  Created by Sercan Burak AĞIR on 22.03.2018.
//  Copyright © 2018 Sercan Burak AĞIR. All rights reserved.
//

import UIKit
import Parchment

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageMenuBar()
    }
    
    func setupPageMenuBar(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let latteVC = storyboard.instantiateViewController(withIdentifier: "Latte")
        let mochaVC = storyboard.instantiateViewController(withIdentifier: "Mocha")
        let smoothieVC = storyboard.instantiateViewController(withIdentifier: "Smoothie")
        let milkshakeVC = storyboard.instantiateViewController(withIdentifier: "Milkshake")
        
        let pagingViewController = FixedPagingViewController(viewControllers: [latteVC, mochaVC, smoothieVC, milkshakeVC])
        pagingViewController.indicatorOptions = .visible(height: 2, zIndex: 0, spacing: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10),
                                                         insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        pagingViewController.indicatorColor = .gray
        pagingViewController.font = UIFont(name: "HelveticaNeue-Medium", size: 14)!
        pagingViewController.textColor = .gray
        pagingViewController.selectedTextColor = .darkGray
        
        
        addChildViewController(pagingViewController)
        view.addSubview(pagingViewController.view)
        view.constrainToEdges(pagingViewController.view)
        pagingViewController.didMove(toParentViewController: self)
        
    }
}

