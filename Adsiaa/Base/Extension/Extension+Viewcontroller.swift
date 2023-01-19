//
//  Extension+Viewcontroller.swift
//  Adsiaa
//
//  Created by appleguru on 26/11/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import Foundation
import JDropDownAlert

extension UIViewController {
    func successAlert(message:String) {
        // Do any additional setup after loading the view.
        let alert = JDropDownAlert(position: .bottom, direction: .normal)
        alert.alertWith("\(message)", message: "", topLabelColor: UIColor.white, messageLabelColor: UIColor.green, backgroundColor: UIColor.green)

        //  alert.alertWith(titleString, message: messageString, topLabelColor: UIColor.white, messageLabelColor: UIColor.darkGray)
        //  alert.alertWith(titleString, message: messageString, topLabelColor: UIColor.white)
        //  alert.alertWith(titleString, message: messageString)

            
            alert.didTapBlock = {
              print("Top View Did Tapped")
            }
        self.view.addSubview(alert)
    }
    
    func errorAlert(message:String) {
        let alert = JDropDownAlert(position: .bottom, direction: .normal)
        alert.alertWith("\(message)", message: "", topLabelColor: UIColor.white, messageLabelColor: UIColor.red, backgroundColor: UIColor.red)

        //  alert.alertWith(titleString, message: messageString, topLabelColor: UIColor.white, messageLabelColor: UIColor.darkGray)
        //  alert.alertWith(titleString, message: messageString, topLabelColor: UIColor.white)
        //  alert.alertWith(titleString, message: messageString)

            
            alert.didTapBlock = {
              print("Top View Did Tapped")
            }
        self.view.addSubview(alert)
    }
    
    func hideKeyBoard(){
        self.view.endEditing(true)
    }
}
