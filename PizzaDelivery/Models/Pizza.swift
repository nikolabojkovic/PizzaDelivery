//
//  BasePizza.swift
//  PizzaDelivery
//
//  Created by Nikola Bojkovic on 7/21/18.
//  Copyright © 2018 Nikola Bojkovic. All rights reserved.
//

import Foundation

class Pizza {
    var Name: String?
    var Description: String?
    var IsSelected: Bool = false
    var PizzaType: PizzaType?
    
    func GetName() -> String {
        return "Base class Name"
    }
    
    func GetDescription() -> String {
        return "Base class description"
    }
    
    func GetSize() -> String {
        return ""
    }
    
    func GetType() -> PizzaType {
        return PizzaType!
    }
    
    func CalculateCost() -> Decimal {
        return 0.00
    }
}
