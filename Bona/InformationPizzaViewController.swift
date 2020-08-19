//
//  InformationPizza.swift
//  Bona
//
//  Created by Andrew Cheberyako on 16.08.2020.
//  Copyright © 2020 Andrew Cheberyako. All rights reserved.
//

import UIKit

class InformationPizzaViewController : UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }

    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "X", style: .plain, target: self, action: #selector(didPressClose))
        navigationItem.title = "BONA PIZZA"
    }

    @objc func didPressClose() {
        navigationController?.dismiss(animated: true, completion: nil)
    }

    func setupWith(pizza: CellContents) {
        print(pizza.name)
    }
}
