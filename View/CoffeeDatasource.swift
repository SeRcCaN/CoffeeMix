//
//  CoffeeDatasource.swift
//  CoffeeMix
//
//  Created by Sercan Burak AĞIR on 29.03.2018.
//  Copyright © 2018 Sercan Burak AĞIR. All rights reserved.
//

import UIKit

class CoffeeDatasource: NSObject, UITableViewDataSource{
    
    var coffee = [Coffee]()
        
    func getCoffee(coffee: [Coffee]){
        self.coffee = coffee
    }
    
    func coffeeAtIndexPath(_ indexPath: IndexPath) -> Coffee{
        return coffee[indexPath.item]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffee.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CoffeeCell else { return UITableViewCell() }
        let coffeePath = coffee[indexPath.row]
        cell.configureCell(coffee: coffeePath)
        return cell
    }
    
}
