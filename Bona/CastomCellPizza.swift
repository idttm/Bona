//
//   CastomCellPizza.swift
//  Bona
//
//  Created by Andrew Cheberyako on 16.08.2020.
//  Copyright © 2020 Andrew Cheberyako. All rights reserved.
//

import Foundation
import UIKit

class CastomCellPizza: UITableViewCell{
    
    @IBOutlet weak var imagePizzaView: UIImageView!
    @IBOutlet weak var namePizzView: UILabel!
    @IBOutlet weak var pricePizzaView: UILabel!
    @IBOutlet weak var toBasketButtonView: UIButton! {
       didSet{
           toBasketButtonView.layer.cornerRadius = 10
//           toBasketButtonView.layer.borderWidth = 2
           
       }
   }
        
    var buttonAction: (() -> Void)?

    override func prepareForReuse() {
        super.prepareForReuse()
        buttonAction = nil
    }

    @IBAction func addToCartAction(_ sender: UIButton) {
        buttonAction?()
    }
}
