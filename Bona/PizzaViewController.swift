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

    let arrayCellContents = PizzaDataHolder.shared.pizzas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pizzaTableView.dataSource = self
//        pizzaTableView.delegate = self
    }
    
    
//    @IBAction func toBasketButtonAction(_ sender: UIButton) {
//
//
//    }

    func showAddToCartVC(indexPath: IndexPath) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let newViewController = storyboard.instantiateViewController(identifier: "InforfationVC") as? InformationPizzaViewController else { return  }
        newViewController.setupWith(pizza: arrayCellContents[indexPath.section])
        present(UINavigationController(rootViewController: newViewController), animated: true, completion: nil)
    }
}
extension PizzaViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayCellContents.count
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
        cell.imagePizzaView.image = arrayCellContents[indexPath.section].image
        cell.namePizzView.text = arrayCellContents[indexPath.section].name
        cell.pricePizzaView.text = arrayCellContents[indexPath.section].price
        return cell
    }
}
