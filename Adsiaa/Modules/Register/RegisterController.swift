//
//  RegisterController.swift
//  Adsiaa
//
//  Created by appleguru on 29/9/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {

    @IBOutlet weak var name: AnimatedTextInput!
    @IBOutlet weak var email: AnimatedTextInput!
    @IBOutlet weak var password: AnimatedTextInput!
    @IBOutlet weak var confirmPassword: AnimatedTextInput!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Register"
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        setupField()
    }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    func setupField() {
      self.name.type = .standard
      self.name.style = AuthInputStyle()
      self.name.clearButtonMode  = .never
      
      self.email.type = .standard
      self.email.style = AuthInputStyle()
      self.email.clearButtonMode  = .never
        
      self.password.type = .password(toggleable: true)
      self.password.style = AuthInputStyle()
      self.password.clearButtonMode  = .never
      
      self.confirmPassword.type = .password(toggleable: true)
      self.confirmPassword.style = AuthInputStyle()
      self.confirmPassword.clearButtonMode  = .never
      }
}
