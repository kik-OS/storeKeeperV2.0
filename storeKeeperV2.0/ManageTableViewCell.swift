//
//  ManageTableViewCell.swift
//  storeKeeperV2.0
//
//  Created by Никита Гвоздиков on 08.11.2020.
//

import UIKit

class ManageTableViewCell: UITableViewCell {
    let listOfItems = WareHouseItem.getWareHouseItem()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
