//
//  Peppers.swift
//  PizzaDelivery
//
//  Created by Nikola Bojkovic on 7/21/18.
//  Copyright © 2018 Nikola Bojkovic. All rights reserved.
//

import Foundation

class Peppers : PizzaDecorator {
    
    override init(wrap: Pizza) {
        super.init(wrap: wrap)
        Name = "Pappers"
        Description = "Peppers"
    }
    
    override func CalculateCost() -> Decimal {
        return pizza.CalculateCost() + 2.00
    }
}
