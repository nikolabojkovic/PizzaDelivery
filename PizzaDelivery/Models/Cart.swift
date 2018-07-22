//
//  Cart.swift
//  PizzaDelivery
//
//  Created by Nikola Bojkovic on 7/22/18.
//  Copyright © 2018 Nikola Bojkovic. All rights reserved.
//

import Foundation

class Cart {
    static let sharedInstance = Cart()
    var items = [Pizza]()
    
    static func Add(pizza: Pizza) {
        sharedInstance.items.append(pizza)
    }
    
    static func RemoveAt(index: Int) {
        sharedInstance.items.remove(at: index)
    }
}
