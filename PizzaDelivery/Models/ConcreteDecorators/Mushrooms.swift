//
//  Mushrooms.swift
//  PizzaDelivery
//
//  Created by Nikola Bojkovic on 7/21/18.
//  Copyright © 2018 Nikola Bojkovic. All rights reserved.
//

import Foundation

class Mushrooms : PizzaDecorator {
    
    override init(wrap: Pizza) {
        super.init(wrap: wrap)
        Name = "Mushrooms"
        Description = "Mushrooms"
    }
    
    override func CalculateCost() -> Decimal {
        return pizza.CalculateCost() + 1.75
    }
}
