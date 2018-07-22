//
//  ViewController.swift
//  PizzaDelivery
//
//  Created by Nikola Bojkovic on 7/19/18.
//  Copyright © 2018 Nikola Bojkovic. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    var pepperoniPizza: Pizza?
    var capricozaPizza: Pizza?
    var quatroStagonePizza: Pizza?

    override func viewDidLoad() {
        super.viewDidLoad()
        pepperoniPizza = LargePizza()
        pepperoniPizza = Cheese(wrap: pepperoniPizza!)
        pepperoniPizza = Peppers(wrap: pepperoniPizza!)
        pepperoniPizza = PizzaName(name: "Pepperoni pizza", type: .pepperoni, pizza: pepperoniPizza!)
        
        capricozaPizza = MediumPizza()
        capricozaPizza = Cheese(wrap: capricozaPizza!)
        capricozaPizza = Ham(wrap: capricozaPizza!)
        capricozaPizza = PizzaName(name: "Capricoza pizza", type: .caprocoza, pizza: capricozaPizza!)
        
        quatroStagonePizza = SmallPizza()
        quatroStagonePizza = Cheese(wrap: quatroStagonePizza!)
        quatroStagonePizza = Cheese(wrap: quatroStagonePizza!)
        quatroStagonePizza = PizzaName(name: "Quatro stagone pizza", type: .quatroStagone, pizza: quatroStagonePizza!)
    }
    
    @IBAction func DetailsTapped(_ sender: UIButton) {
//        performSegue(withIdentifier: "DetailsSegue", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pizza = sender as? Pizza {
            segue.destination.navigationItem.title = pizza.GetName()
            if let vc = segue.destination as? DetailsViewController {
                vc.pizza = pizza
            }
        }
    }
    
    @IBAction func PepperoniPizzaTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "DetailsSegue", sender: PizzaFactory.CreatePizzaByType(type: .pepperoni))
    }
    
    @IBAction func CapricozaPizzaTapped(_ sender: UIButton) {
           performSegue(withIdentifier: "DetailsSegue", sender: PizzaFactory.CreatePizzaByType(type: .caprocoza))
    }
    
    @IBAction func QuatroStagonePizzaTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "DetailsSegue", sender: PizzaFactory.CreatePizzaByType(type: .quatroStagone))
    }
    
    
    @IBAction func PepperoniAddToCart(_ sender: UIButton) {
        Cart.Add(pizza: PizzaFactory.CreatePizzaByType(type: .pepperoni))
    }
    @IBAction func CapricozaAddToCart(_ sender: UIButton) {
        Cart.Add(pizza: PizzaFactory.CreatePizzaByType(type: .caprocoza))
    }
    @IBAction func CheeseAddToCart(_ sender: Any) {
        Cart.Add(pizza: PizzaFactory.CreatePizzaByType(type: .quatroStagone))
    }
}

