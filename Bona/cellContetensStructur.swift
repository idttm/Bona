//
//  cellContetensStructur.swift
//  Bona
//
//  Created by Andrew Cheberyako on 18.08.2020.
//  Copyright © 2020 Andrew Cheberyako. All rights reserved.
//

import Foundation
import UIKit

struct Pizza {
    let name: String
    let image: UIImage
    let pizzaConfigurations: [PizzaConfiguration]
}

struct PizzaConfiguration {
    let price: Double
    let pizzaSize: PizzaSize
}

class PizzaDataHolder {

    static let shared = PizzaDataHolder()

    let pizzas = [
        Pizza(name: "Гавайская", image: (UIImage(named: "hawaiian.png"))!, pizzaConfigurations: [PizzaConfiguration(price: 145, pizzaSize: .small), PizzaConfiguration(price: 160, pizzaSize: .medium)]),
        Pizza(name: "Баварская", image: (UIImage(named: "bavarian.png"))!, pizzaConfigurations: [PizzaConfiguration(price: 145, pizzaSize: .small), PizzaConfiguration(price: 160, pizzaSize: .large)]),
        Pizza(name: "Азиатская", image: (UIImage(named: "asiatic.png"))!, pizzaConfigurations: [PizzaConfiguration(price: 145, pizzaSize: .small), PizzaConfiguration(price: 160, pizzaSize: .medium)]),
        Pizza(name: "Цезарь", image: (UIImage(named: "caesar.png"))!, pizzaConfigurations: [PizzaConfiguration(price: 145, pizzaSize: .small), PizzaConfiguration(price: 160, pizzaSize: .medium)]),
        Pizza(name: "Маргарита",image: (UIImage(named: "margarita.png"))!, pizzaConfigurations: [PizzaConfiguration(price: 145, pizzaSize: .small), PizzaConfiguration(price: 160, pizzaSize: .medium)]),
        Pizza(name: "Паперти", image: (UIImage(named: "pepperoni.png"))!, pizzaConfigurations: [PizzaConfiguration(price: 145, pizzaSize: .small), PizzaConfiguration(price: 160, pizzaSize: .medium)]),
        Pizza(name: "Греческая", image: (UIImage(named: "greek.png"))!, pizzaConfigurations: [PizzaConfiguration(price: 145, pizzaSize: .small), PizzaConfiguration(price: 160, pizzaSize: .medium)])
    ]



}
