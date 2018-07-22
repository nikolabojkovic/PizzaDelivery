//
//  CheckoutViewController.swift
//  PizzaDelivery
//
//  Created by Nikola Bojkovic on 7/19/18.
//  Copyright © 2018 Nikola Bojkovic. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var summary: String?
    var pizzaList: [Pizza] = []
    
    @IBOutlet weak var TotalSum: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var total: Decimal = 0.00
        for item in pizzaList {
            total += item.CalculateCost()
        }
        
        TotalSum.text = "\(total)"
        tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pizzaList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = "\(self.pizzaList[indexPath.row].GetSize()) \(self.pizzaList[indexPath.row].GetName())"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
}
