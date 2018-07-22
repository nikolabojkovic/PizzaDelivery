//
//  MediumPIzza.swift
//  PizzaDelivery
//
//  Created by Nikola Bojkovic on 7/21/18.
//  Copyright © 2018 Nikola Bojkovic. All rights reserved.
//

import Foundation

class MediumPizza : Pizza {
    
    override init() {
        super.init()
        Name = "Medium"
        Description = "Medium pizza"
    }
    
    override func GetName() -> String {
        return Name ?? ""
    }
    
    override func GetDescription() -> String {
        return Description ?? ""
    }
    
    override func GetSize() -> String {
        return "Medium"
    }
    
    override func CalculateCost() -> Decimal {
        return 6.00
    }
}
