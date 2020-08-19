//
//  cellContetensStructur.swift
//  Bona
//
//  Created by Andrew Cheberyako on 18.08.2020.
//  Copyright © 2020 Andrew Cheberyako. All rights reserved.
//

import Foundation
import UIKit

struct CellContents {
    let name: String
    let price: String
    let image: UIImage 
}

class PizzaDataHolder {

    static let shared = PizzaDataHolder()

    let pizzas = [
        CellContents(name: "Гавайская", price: "₴ 145", image: (UIImage(named: "hawaiian.png"))!),
        CellContents(name: "Баварская", price: "₴ 155", image: (UIImage(named: "bavarian.png"))!),
        CellContents(name: "Азиатская", price: "₴ 149", image: (UIImage(named: "asiatic.png"))!),
        CellContents(name: "Цезарь", price: "₴ 169", image: (UIImage(named: "caesar.png"))!),
        CellContents(name: "Маргарита", price: "₴ 109", image: (UIImage(named: "margarita.png"))!),
        CellContents(name: "Паперти", price: "₴ 145", image: (UIImage(named: "pepperoni.png"))!),
        CellContents(name: "Греческая", price: "₴ 169", image: (UIImage(named: "greek.png"))!)
    ]



}
