//
//  ManageTableViewCell.swift
//  storeKeeperV2.0
//
//  Created by Никита Гвоздиков on 08.11.2020.
//

import UIKit

class ManageTableViewCell: UITableViewCell {
    let listOfItems = WareHouseItem.getWareHouseItem()
   
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var countLaabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var acceptButton: UIButton!
    @IBOutlet var giveOutButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
