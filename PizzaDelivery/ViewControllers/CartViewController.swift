//
//  CartViewController.swift
//  PizzaDelivery
//
//  Created by Nikola Bojkovic on 7/19/18.
//  Copyright © 2018 Nikola Bojkovic. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cart.sharedInstance.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")!
        let switchView = UISwitch(frame: .zero)
        switchView.setOn(Cart.sharedInstance.items[indexPath.row].IsSelected, animated: true)
        switchView.tag = indexPath.row
        switchView.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
        
        cell.accessoryView = switchView
        cell.textLabel?.text = "\(Cart.sharedInstance.items[indexPath.row].GetSize()) \(Cart.sharedInstance.items[indexPath.row].GetName())"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            Cart.RemoveAt(index: indexPath.row)
            tableView.reloadData()
        }
    }
    
    @objc func switchChanged(_ sender : UISwitch!){
        Cart.sharedInstance.items[sender.tag].IsSelected = sender.isOn
    }

    
    @IBAction func CheckoutSelectedTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "CheckoutSegue", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CheckoutViewController {
            vc.pizzaList = Cart.sharedInstance.items.filter { $0.IsSelected }
        }        
    }
}
