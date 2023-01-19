//
//  CartCell.swift
//  Adsiaa
//
//  Created by appleguru on 30/9/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import UIKit
import Cosmos

class CartCell: UITableViewCell {

    @IBOutlet weak var removeBtn: UIButton!
    @IBOutlet weak var increaseBtn: UIButton!
    @IBOutlet weak var cartImg: BXImageView!
    @IBOutlet weak var cartLbl: UILabel!
    @IBOutlet weak var rating: CosmosView!
    @IBOutlet weak var oldPriceLbl: UILabel!
    @IBOutlet weak var decreaseBtn: UIButton!
    @IBOutlet weak var newPriceLbl: UILabel!
    @IBOutlet weak var qtyLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
