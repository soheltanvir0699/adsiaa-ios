//
//  VideoServiceCell.swift
//  Adsiaa
//
//  Created by appleguru on 29/9/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import UIKit

class VideoServiceCell: UITableViewCell {

    @IBOutlet weak var videoImg: UIImageView!
    @IBOutlet weak var videoName: UILabel!
    @IBOutlet weak var videoDesc: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
