//
//  LargePizza.swift
//  PizzaDelivery
//
//  Created by Nikola Bojkovic on 7/21/18.
//  Copyright © 2018 Nikola Bojkovic. All rights reserved.
//

import Foundation

class LargePizza : Pizza {
    
    override init() {
        super.init()
        Name = "Large"
        Description = "Large pizza"
    }
    
    override func GetName() -> String {
        return Name ?? ""
    }
    
    override func GetDescription() -> String {
        return Description ?? ""
    }
    
    override func GetSize() -> String {
        return "Large"
    }
    
    override func CalculateCost() -> Decimal {
        return 9.00
    }
}
