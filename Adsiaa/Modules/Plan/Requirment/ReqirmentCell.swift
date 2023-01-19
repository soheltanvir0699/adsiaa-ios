//
//  ReqirmentCell.swift
//  Adsiaa
//
//  Created by appleguru on 30/9/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import UIKit

class ReqirmentCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var uploadbutton: BXButton!
    @IBAction func uploadBtn(_ sender: Any) {
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
