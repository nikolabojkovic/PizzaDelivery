//
//  PizzaBuilder.swift
//  PizzaDelivery
//
//  Created by Nikola Bojkovic on 7/22/18.
//  Copyright © 2018 Nikola Bojkovic. All rights reserved.
//

import Foundation

class PizzaFactory {
    
    static func CreatePepperoniPizza() -> Pizza {
        return PizzaName(name: "Pepperoni pizza", type: .pepperoni, pizza: Peppers(wrap: Cheese(wrap: LargePizza())))
    }
    
    static func CreateCapricozaPizza() -> Pizza {
        return PizzaName(name: "Capricoza pizza", type: .caprocoza, pizza: Ham(wrap: Cheese(wrap: MediumPizza())))
    }
    
    static func CreateQuatroStagonePizza() -> Pizza {
        return PizzaName(name: "Quatro stagone pizza", type: .quatroStagone, pizza: Cheese(wrap: Cheese(wrap: SmallPizza())))
    }
    
    static func CreatePizzaByType(type: PizzaType) -> Pizza {
        switch type {
        case .pepperoni:
            return PizzaFactory.CreatePepperoniPizza()
        case .caprocoza:
            return PizzaFactory.CreateCapricozaPizza()
        case .quatroStagone:
            return PizzaFactory.CreateQuatroStagonePizza()
        case .custom:
            return Pizza()
        }
    }
}
