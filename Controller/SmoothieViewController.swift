//
//  SmoothieViewController.swift
//  CoffeeMix
//
//  Created by Sercan Burak AĞIR on 22.03.2018.
//  Copyright © 2018 Sercan Burak AĞIR. All rights reserved.
//

import UIKit

class SmoothieViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let customPresentAnimationController = CustomTransition()
    
    let dataSource = CoffeeDatasource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        NetworkServices.shared.getAllCoffeeRecipes(url: SMOOTHIE_URL) { (coffees) in
            self.dataSource.getCoffee(coffee: coffees)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            let destination = segue.destination as? DetailViewController
            destination?.transitioningDelegate = self
            guard let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) else { return }
            let selectedCoffee: Coffee = dataSource.coffeeAtIndexPath(indexPath)
            destination?.selectedCoffee = selectedCoffee
        }
    }
}

//MARK: - Transition Delegate

extension SmoothieViewController: UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customPresentAnimationController
    }
}

