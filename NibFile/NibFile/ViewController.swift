//
//  ViewController.swift
//  NibFile
//
//  Created by appleguru on 27/10/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func logoutAction(_ sender: Any) {
        ShowPopUp()
    }
    
    func ShowPopUp(){
        
          let rootView = Bundle.main.loadNibNamed("LogOut", owner: self, options: nil)?[0] as? LogOut
           rootView?.BtnLogout.addTarget(self, action: #selector(GoToLoginView), for: .touchUpInside)
           rootView?.BtnCancel.addTarget(self, action: #selector(dismissSupView), for: .touchUpInside)
          if let aView = rootView {
              aView.tag = 1000
              self.navigationController?.view.addSubview(aView)
              guard let navView = self.navigationController?.view else {return}
              navView.addSubview(aView)
              aView.translatesAutoresizingMaskIntoConstraints = false
              aView.topAnchor.constraint(equalTo: navView.topAnchor, constant: 0).isActive = true
              aView.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: 0).isActive = true
              aView.leadingAnchor.constraint(equalTo: navView.leadingAnchor, constant: 0).isActive = true
              aView.trailingAnchor.constraint(equalTo: navView.trailingAnchor, constant: 0).isActive = true
             
          }
              
          }
          
          @objc func dismissSupView() {
              for subview in (self.navigationController?.view.subviews)! {
                  if (subview.tag == 1000) {
                      subview.removeFromSuperview()
                  }
              }
             
          }
          @objc func GoToLoginView() {
             // UsersDefault.deleteUserDataFromUSerDefaults()
              for subview in (self.navigationController?.view.subviews)! {
                  if (subview.tag == 1000) {
                      subview.removeFromSuperview()
                  }
              }
       }


}


