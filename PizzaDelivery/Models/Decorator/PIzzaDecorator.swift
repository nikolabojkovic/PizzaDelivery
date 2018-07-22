//
//  PIzzaDecorator.swift
//  PizzaDelivery
//
//  Created by Nikola Bojkovic on 7/21/18.
//  Copyright © 2018 Nikola Bojkovic. All rights reserved.
//

import Foundation

class PizzaDecorator : Pizza {
    internal var pizza: Pizza
    
    init(wrap: Pizza) {
        self.pizza = wrap
        super.init()        
    }
    
    override func GetName() -> String {
        return "\(pizza.GetName()), \(Name ?? "")"
    }
    
    override func GetDescription() -> String {
        return "\(pizza.GetDescription()), \(Description ?? "")"
    }
    
    override func GetSize() -> String {
        return pizza.GetSize()
    }
    
    override func GetType() -> PizzaType {
        return pizza.GetType()
    }
    
    override func CalculateCost() -> Decimal {
        return self.pizza.CalculateCost()
    }
}
