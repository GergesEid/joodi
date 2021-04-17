//
//  ItemsTableViewCell.swift
//  JOODI
//
//  Created by Gerges on 17/04/2021.
//

import UIKit

class ItemsTableViewCell: UITableViewCell , ItemsCellView {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func displayName(name: String) {
        nameLabel.text = name
    }
    
    func displayCount(count: String) {
        countLabel.text = count
    }
}
