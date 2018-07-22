//
//  DetailsViewController.swift
//  PizzaDelivery
//
//  Created by Nikola Bojkovic on 7/19/18.
//  Copyright © 2018 Nikola Bojkovic. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var pizza: Pizza?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DescriptionLabel.text = pizza!.GetDescription()
        CostsLabel.text = "\(pizza?.CalculateCost() ?? 0)"
    }    
    
    @IBOutlet weak var DescriptionLabel: UILabel!
    @IBOutlet weak var CostsLabel: UILabel!
    
    @IBAction func CheckoutTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "CheckoutSegue", sender: pizza)
    }
    
    @IBAction func AddToCartTapped(_ sender: UIButton) {
        Cart.Add(pizza: PizzaFactory.CreatePizzaByType(type: pizza!.PizzaType!))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pizza = sender as? Pizza {
            if let vc = segue.destination as? CheckoutViewController {
                vc.pizzaList = [pizza]
            }
        }
    }
}
