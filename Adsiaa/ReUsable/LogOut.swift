//
//  LogOut.swift
//  Adsiaa
//
//  Created by appleguru on 29/9/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import UIKit

class LogOut: UIView {

    @IBOutlet weak var ViewPopup: UIView!
    @IBOutlet weak var BtnClose: UIButton!
    @IBOutlet weak var BtnLogout: UIButton!
     @IBOutlet weak var BtnCancel: UIButton!
    @IBOutlet weak var LblSatuts: UILabel!
    @IBOutlet weak var LblMessage: UILabel!
    @IBOutlet weak var ImageSatuts: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        ViewPopup.layer.cornerRadius=10
        BtnLogout.layer.cornerRadius=4
        BtnCancel.layer.cornerRadius=4
    }
   
}
