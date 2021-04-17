//
//  OrdersTableViewCell.swift
//  JOODI
//
//  Created by Gerges on 17/04/2021.
//

import UIKit

class OrdersTableViewCell: UITableViewCell, OrdersCellView {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var shopperLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func displayName(name: String) {
        nameLabel.text = "Name: \(name)"
    }
    
    func displayPhone(phone: String) {
        phoneLabel.text = "Phone: \(phone)"
    }
    
    func displayTime(time: String) {
        timeLabel.text = "Time: \(time)"
    }
    
    func displayShopper(shopper: String) {
        shopperLabel.text = "Shopper: \(shopper)"
    }
}
