//
//  CustomPizzaViewController.swift
//  PizzaDelivery
//
//  Created by Nikola Bojkovic on 7/19/18.
//  Copyright © 2018 Nikola Bojkovic. All rights reserved.
//

import UIKit

class CustomPizzaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        CheeseStepper.wraps = true
        CheeseStepper.autorepeat = true
        CheeseStepper.maximumValue = 10
        CheeseSteppLabel.text = Int(CheeseStepper.value).description
            
        PeppersStepper.wraps = true
        PeppersStepper.autorepeat = true
        PeppersStepper.maximumValue = 10
        PeppersStepp.text = Int(PeppersStepper.value).description
        
        HamStepper.wraps = true
        HamStepper.autorepeat = true
        HamStepper.maximumValue = 10
        HamStepp.text = Int(HamStepper.value).description
        
        MushroomsStepper.wraps = true
        MushroomsStepper.autorepeat = true
        MushroomsStepper.maximumValue = 10
        MushroomsStepLabel.text = Int(MushroomsStepper.value).description
    }
    

    @IBOutlet weak var SegmetedControlSize: UISegmentedControl!
    @IBOutlet weak var CheeseStepper: UIStepper!
    @IBOutlet weak var PeppersStepper: UIStepper!
    
    @IBOutlet weak var HamStepper: UIStepper!
    
    
    @IBOutlet weak var MushroomsStepper: UIStepper!
    
    
    @IBOutlet weak var CheeseSteppLabel: UILabel!
    
    @IBOutlet weak var PeppersStepp: UILabel!
    @IBOutlet weak var HamStepp: UILabel!
    @IBOutlet weak var MushroomsStepLabel: UILabel!
    
    
    @IBAction func StepperChanged(_ sender: UIStepper) {
        CheeseSteppLabel.text = Int(sender.value).description
    }
    
    @IBAction func PeppersSteppChanged(_ sender: UIStepper) {
        PeppersStepp.text = Int(sender.value).description
    }
    @IBAction func HamSteppChanged(_ sender: UIStepper) {
        HamStepp.text = Int(sender.value).description
    }
    
  
    @IBAction func MushroomsStepChanged(_ sender: UIStepper) {
         MushroomsStepLabel.text = Int(sender.value).description
    }
    
    @IBAction func AddToChartTapped(_ sender: UIButton) {
        let size = SegmetedControlSize.selectedSegmentIndex
        var pizza = PizzaBuilder.Pizza().Size(size: PizzaSize(rawValue: size)!)
        if let layers: Int = Int(CheeseSteppLabel!.text!) {
            if layers > 0 {
                pizza = pizza.With(ingredient: .cheese, layers: layers)
            }
        }
        
        if let layers = Int(PeppersStepp!.text!) {
            if layers > 0 {
                pizza = pizza.With(ingredient: .peppers, layers: layers)
            }
        }
        
        if let layers: Int = Int(HamStepp!.text!) {
            if layers > 0 {
                pizza = pizza.With(ingredient: .ham, layers: layers)
            }
        }
        
        if let layers: Int = Int(MushroomsStepLabel!.text!) {
            if layers > 0 {
                pizza = pizza.With(ingredient: .mushrooms, layers: layers)
            }
        }
        
        Cart.Add(pizza: pizza.Build())
    }
    
    @IBAction func Checkout(_ sender: UIButton) {
        let size = SegmetedControlSize.selectedSegmentIndex
        var pizza = PizzaBuilder.Pizza().Size(size: PizzaSize(rawValue: size)!)
        if let layers: Int = Int(CheeseSteppLabel!.text!) {
            if layers > 0 {
                pizza = pizza.With(ingredient: .cheese, layers: layers)
            }
        }
        
        if let layers = Int(PeppersStepp!.text!) {
            if layers > 0 {
                pizza = pizza.With(ingredient: .peppers, layers: layers)
            }
        }
        
        if let layers: Int = Int(HamStepp!.text!) {
            if layers > 0 {
                pizza = pizza.With(ingredient: .ham, layers: layers)
            }
        }
        
        if let layers: Int = Int(MushroomsStepLabel!.text!) {
            if layers > 0 {
                pizza = pizza.With(ingredient: .mushrooms, layers: layers)
            }
        }
        
        performSegue(withIdentifier: "CheckoutSegue", sender: pizza.Build())
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pizza = sender as? Pizza {
            if let vc = segue.destination as? CheckoutViewController {
                vc.pizzaList = [pizza]
            }
        }
    }

}
