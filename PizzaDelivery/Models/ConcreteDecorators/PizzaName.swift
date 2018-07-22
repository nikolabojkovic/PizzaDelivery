//
//  PizzaName.swift
//  PizzaDelivery
//
//  Created by Nikola Bojkovic on 7/21/18.
//  Copyright © 2018 Nikola Bojkovic. All rights reserved.
//

import Foundation

class PizzaName : PizzaDecorator {
    
    init(name: String, type: PizzaType, pizza: Pizza) {
        super.init(wrap: pizza)
        Name = name
        Description = "Pizza name"
        PizzaType = type
    }
    
    override func GetName() -> String {
        return Name ?? ""
    }
    
    override func GetDescription() -> String {
        return "\(pizza.GetDescription())"
    }
    
    override func GetType() -> PizzaType {
        return PizzaType!
    }
    
    override func CalculateCost() -> Decimal {
        return pizza.CalculateCost()
    }
}
