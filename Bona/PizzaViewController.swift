//
//  PizzaViewController.swift
//  Bona
//
//  Created by Andrew Cheberyako on 16.08.2020.
//  Copyright © 2020 Andrew Cheberyako. All rights reserved.
//

import Foundation
import UIKit

class PizzaViewController: UIViewController {
    
    
    @IBOutlet weak var pizzaTableView: UITableView!
    @IBOutlet weak var orderButton: UIView!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    let availablePizzas = PizzaDataHolder.shared.pizzas
    var cartManager: CartManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pizzaTableView.dataSource = self
//        pizzaTableView.delegate = self
    }

    func showAddToCartVC(indexPath: IndexPath) {
        guard let newViewController = storyboard?.instantiateViewController(identifier: "InforfationVC") as? InformationPizzaViewController else { return  }
        newViewController.selectedPizza = availablePizzas[indexPath.section]
        newViewController.makeOrderAction = { [weak self] pizzaOrder in
            if self?.cartManager != nil {
                self?.cartManager?.addToCart(pizzaOrder: pizzaOrder)
            } else {
                let order = Order(pizzaOrders: [pizzaOrder])
                self?.cartManager = CartManager(order: order)
                self?.orderButton.isHidden = false
            }
            self?.updateCart()
        }
        present(UINavigationController(rootViewController: newViewController), animated: true, completion: nil)
    }

    func updateCart() {
        guard let manager = cartManager else { return }
        quantityLabel.text = "\(manager.overalQuantity)"
        priceLabel.text = "\(manager.overallPrice) ₴"
    }

    @IBAction func makeOrderAction(_ sender: UIButton) {
    }
}
extension PizzaViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return availablePizzas.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IdentifierPizza", for: indexPath) as! CastomCellPizza
        cell.selectionStyle = .none
        cell.buttonAction = { [weak self] in
            self?.showAddToCartVC(indexPath: indexPath)
        }
        cell.imagePizzaView.image = availablePizzas[indexPath.section].image
        cell.namePizzView.text = availablePizzas[indexPath.section].name
        cell.pricePizzaView.text = "\(availablePizzas[indexPath.section].pizzaConfigurations.first?.price ?? -1) ₴"
        return cell
    }
}
