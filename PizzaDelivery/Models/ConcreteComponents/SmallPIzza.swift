//
//  SmallPIzza.swift
//  PizzaDelivery
//
//  Created by Nikola Bojkovic on 7/21/18.
//  Copyright © 2018 Nikola Bojkovic. All rights reserved.
//

import Foundation

class SmallPizza : Pizza {
    
    override init() {
        super.init()
        Name = "Small"
        Description = "Small pizza"
    }
    
    override func GetName() -> String {
        return Name ?? ""
    }
    
    override func GetDescription() -> String {
        return Description ?? ""
    }
    
    override func GetSize() -> String {
        return "Small"
    }
    
    override func CalculateCost() -> Decimal {
        return 3.00
    }
}
