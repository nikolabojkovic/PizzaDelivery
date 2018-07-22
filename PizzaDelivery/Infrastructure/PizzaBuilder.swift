//
//  PizzaBuilder.swift
//  PizzaDelivery
//
//  Created by Nikola Bojkovic on 7/22/18.
//  Copyright © 2018 Nikola Bojkovic. All rights reserved.
//

import Foundation

class PizzaBuilder {
    
    var pizza: Pizza?
    var pizzaSize: PizzaSize?
    var pizzaType: PizzaType = .custom
    var ingredients: [PizzaIngredients] = []
    
    static func Pizza() -> PizzaBuilder {
        return PizzaBuilder()
    }
    
    func Size(size: PizzaSize) -> PizzaBuilder
    {
        self.pizzaSize = size
        return self
    }
    
    func With(ingredient: PizzaIngredients, layers: Int) -> PizzaBuilder {
        for _ in 1...layers {
            ingredients.append(ingredient)
        }
        
        return self
    }
    
    func Build() -> Pizza {
        switch pizzaSize! {
        case .small:
            pizza = SmallPizza()
        case .medium:
            pizza = MediumPizza()
        case .large:
            pizza = LargePizza()
        }
        
        for ingredient in ingredients {
            switch ingredient {
            case .cheese:
                pizza = Cheese(wrap: pizza!)
            case .peppers:
                pizza = Peppers(wrap: pizza!)
            case .ham:
                pizza = Ham(wrap: pizza!)
            case .mushrooms:
                pizza = Mushrooms(wrap: pizza!)
            }
        }
        
        pizza = PizzaName(name: "Custom pizza", type: pizzaType, pizza: pizza!)
        
        return pizza!
    }
}
