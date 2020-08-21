//
//  InformationPizza.swift
//  Bona
//
//  Created by Andrew Cheberyako on 16.08.2020.
//  Copyright © 2020 Andrew Cheberyako. All rights reserved.
//

import UIKit

enum PizzaSize: Int, CaseIterable {
    case small = 30
    case medium = 35
    case large = 45

    var text: String {
        return "\(rawValue) cm"
    }
}

class InformationPizzaViewController : UIViewController {
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imagePizzaView: UIImageView!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var informationPizaLabel: UILabel!
    @IBOutlet weak var quantityPizzaLabel: UILabel!
    @IBOutlet weak var quantityStepperPizza: UIStepper!
    @IBOutlet weak var sizePizzaSegmentedControl: UISegmentedControl!
    @IBOutlet weak var quantityLabel: UILabel!
    
    var selectedPizza: Pizza?

    var makeOrderAction: ((PizzaOrder) -> Void)?

    private var pizzaCounter = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()

        if let pizza = selectedPizza {
            setupWith(pizza: pizza)
        }
    }

    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "closeTitle"), style: .plain, target: self, action: #selector(didPressClose))
        navigationItem.title = "BONA PIZZA"
    }

    @objc func didPressClose() {
        navigationController?.dismiss(animated: true, completion: nil)
    }

    private func setupWith(pizza: Pizza) {
        priceLabel.text = "\(pizza.pizzaConfigurations.first?.price ?? -1 ) ₴"
        nameLabel.text = pizza.name
        imagePizzaView.image = pizza.image
        sizePizzaSegmentedControl.removeAllSegments()
        pizza.pizzaConfigurations.enumerated().forEach { (index, config) in
            sizePizzaSegmentedControl.insertSegment(withTitle: config.pizzaSize.text, at: index, animated: false)
        }
        sizePizzaSegmentedControl.selectedSegmentIndex = 0
    }

    @IBAction func makeOrder(_ sender: UIButton) {
        guard let pizza = selectedPizza else { return }
        let configuration = pizza.pizzaConfigurations[sizePizzaSegmentedControl.selectedSegmentIndex]
        let order = PizzaOrder(pizza: pizza,
                               configuration: configuration,
                               count: pizzaCounter)
        makeOrderAction?(order)
    }

    @IBAction func didChangeValue(_ sender: UIStepper) {
        pizzaCounter = Int(sender.value)
        quantityLabel.text = String(pizzaCounter)
        priceLabel.text = 

        
    }

    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        guard let config = selectedPizza?.pizzaConfigurations[sender.selectedSegmentIndex] else { return }
        priceLabel.text = "\(config.price) ₴"
        
    }
}
