//
//  Coffee.swift
//  CoffeeMix
//
//  Created by Sercan Burak AĞIR on 22.03.2018.
//  Copyright © 2018 Sercan Burak AĞIR. All rights reserved.
//

import UIKit

class Coffee{

    var name: String?
    var coffeeImage: String?
    var material: String?
    var preparation: String?

    init(json: JSON) {

        guard let coffeeName = json["coffeeName"] as? String,
        let coffeeImage      = json["coffeeImg"] as? String,
        let coffeeMaterial   = json["coffeeMaterial"] as? String,
        let coffePreparation = json["coffePreparation"] as? String
            else { return }

        self.name            = coffeeName
        self.coffeeImage     = coffeeImage
        self.material        = coffeeMaterial
        self.preparation     = coffePreparation

    }
}
