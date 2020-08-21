//
//  CartManager.swift
//  Bona
//
//  Created by Andrew Cheberyako on 20.08.2020.
//  Copyright © 2020 Andrew Cheberyako. All rights reserved.
//

import Foundation

struct Order {
    var pizzaOrders: [PizzaOrder]
}

struct PizzaOrder {
    let pizza: Pizza
    let configuration: PizzaConfiguration
    let count: Int
}

class CartManager {

    var order: Order

    var overallPrice: Double {
        return order.pizzaOrders.compactMap { $0.configuration.price * Double($0.count) }.reduce(0, +)
    }

    var overalQuantity: Int {
        return order.pizzaOrders.compactMap { $0.count }.reduce(0, +)
    }

    init(order: Order) {
        self.order = order
    }

    func addToCart(pizzaOrder: PizzaOrder) {
        order.pizzaOrders.append(pizzaOrder)
    }
}
