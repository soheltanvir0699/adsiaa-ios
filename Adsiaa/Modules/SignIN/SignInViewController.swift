//
//  SignInViewController.swift
//  Adsiaa
//
//  Created by appleguru on 28/9/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var TxtEmail: AnimatedTextInput!
     @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet weak var txtPassword: AnimatedTextInput!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setMenuBtn(menuBtn)
        setupField()
        title = "Sign In"
    }
    func setupField() {
        self.txtPassword.type = .password(toggleable: true)
    self.txtPassword.style = AuthInputStyle()
    self.txtPassword.clearButtonMode  = .never
        
    self.TxtEmail.type = .standard
    self.TxtEmail.style = AuthInputStyle()
    self.TxtEmail.clearButtonMode  = .never
    }

    // MARK: Create function for menu Action
           func setMenuBtn(_ menuBar: UIBarButtonItem){
               menuBar.target = revealViewController()
               menuBar.action = #selector(SWRevealViewController.revealToggle(_:))
               view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
           }
    
    
    @IBAction func forgotAction(_ sender: Any) {
        RootView.fotgotVC(withVC: self, title: "")
    }
    
    @IBAction func signBtnAction(_ sender: Any) {
        self.hideKeyBoard()
        if !TxtEmail.text!.isEmail{
            self.errorAlert(message: StringValidationConstant.str_invalid_email)
          return
        }
        if txtPassword.text!.count == 0 {
            self.errorAlert(message: StringValidationConstant.str_invalid_password)
          return
        }
        Service.logInApi(username: self.TxtEmail.text!, password: self.txtPassword.text!, success: { (data) in
            print(data)
            if data.success == true {
                Constant.AccessToken = data.token!
                var userData = [String]()
                self.successAlert(message: "Log In Successful.")
                Constant.isLogIn = true
                Constant.slider_List = ["Home","Plan","Service","Contact Us","Sign Out"]
                userData.append(data.user?.name ?? "")
                userData.append(data.user?.email ?? "")
                userData.append(data.user?.phone ?? "")
                userData.append(data.user?.image ?? "")
                userData.append(data.user?.address ?? "")
                Constant.UserAllInfo = userData
                let rootVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SWRevealViewController")
                UIApplication.shared.windows.first?.rootViewController = rootVC
            }
        }) { (error, errorcode) in
            print(error, errorcode)
            Constant.isLogIn = true
            self.errorAlert(message: "Log In Unsuccessful.")
        }
        
    }
    @IBAction func registerAction(_ sender: Any) {
        RootView.registerVC(withVC: self, title: "")
        
    }
    
    
}


struct AuthInputStyle: AnimatedTextInputStyle {
    let placeholderInactiveColor = UIColor.hexStringToUIColor(hex: "7D8B97")
    let activeColor =  UIColor.hexStringToUIColor(hex: "7D8B97")
    let inactiveColor = UIColor.hexStringToUIColor(hex: "4A4A4A")
    let lineInactiveColor = UIColor.hexStringToUIColor(hex: "EDF0F2")
    let lineActiveColor = UIColor.hexStringToUIColor(hex: "EDF0F2")
    let lineHeight: CGFloat = 1
    let errorColor = UIColor.hexStringToUIColor(hex: "C80001")
    let textInputFont = UIFont.init(name: "Kefa", size: 16)!
    let textInputFontColor = UIColor.hexStringToUIColor(hex: "4A4A4A")
    let placeholderMinFontSize: CGFloat = 10
    let counterLabelFont: UIFont? = UIFont.init(name: "CircularStd-Book", size: 9.0)
    let leftMargin: CGFloat = 10
    let topMargin: CGFloat = 20
    let rightMargin: CGFloat = 10
    let bottomMargin: CGFloat = 10
    let yHintPositionOffset: CGFloat = -5
    let yPlaceholderPositionOffset: CGFloat = -5
    public let textAttributes: [String: Any]? = nil
}
