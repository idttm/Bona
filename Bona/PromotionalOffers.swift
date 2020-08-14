//
//  PromotionalOffers.swift
//  Bona
//
//  Created by Andrew Cheberyako on 13.08.2020.
//  Copyright © 2020 Andrew Cheberyako. All rights reserved.
//

import Foundation
import UIKit

class PromotionalOffers: UIViewController {
    
    @IBOutlet weak var PromotionalOffersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PromotionalOffersTableView.dataSource = self
    }
    
    var arrayImegeNews : [UIImage] = [(UIImage(named: "oneRoll.png"))!,(UIImage(named: "pizzaMuchPieces.png"))!,(UIImage(named: "pizzaOnePiece.png"))!,(UIImage(named: "rollsOnDesk.png"))!,]
}
extension PromotionalOffers: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return arrayImegeNews.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IdentifierNews", for: indexPath) as! CastomCellNews
        cell.selectionStyle = .none
        cell.newsImageView.image = arrayImegeNews[indexPath.section]
        return cell
    }


}
