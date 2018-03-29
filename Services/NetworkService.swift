//
//  NetworkService.swift
//  CoffeeMix
//
//  Created by Sercan Burak AĞIR on 22.03.2018.
//  Copyright © 2018 Sercan Burak AĞIR. All rights reserved.
//

import UIKit
import Alamofire

class NetworkServices {
    
    private init() {}
    static let shared = NetworkServices()
    
    func getAllCoffeeRecipes(url: String, completion: @escaping ([Coffee]) -> Void){
        var coffees = [Coffee]()
        Alamofire.request(url).responseJSON { (response) in
            switch response.result{
                
            case .success(let json):
                
                guard let jsonArray = json as? [JSON] else { return }
                jsonArray.forEach({ (recipes) in
                    let coffee = Coffee(json: recipes)
                    coffees.append(coffee)
                })
                
                completion(coffees)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

