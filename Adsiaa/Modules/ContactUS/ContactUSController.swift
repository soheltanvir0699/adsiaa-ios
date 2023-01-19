//
//  ContactUSController.swift
//  Adsiaa
//
//  Created by appleguru on 29/9/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import UIKit
import MessageUI

class ContactUSController: UIViewController,UITextViewDelegate {


    @IBOutlet weak var txtEmail: AnimatedTextInput!
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var txtName: AnimatedTextInput!
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    let badgeCount = UILabel(frame: CGRect(x: 22, y: -05, width: 20, height: 20))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setMenuBtn(menuBtn)
        setupField()
        title = "Contact Us"
        textView.text = "Message"
        textView.textColor = UIColor.lightGray
        textView.layer.borderWidth = 0.3
        textView.layer.borderColor = UIColor.darkGray.cgColor
        textView.layer.cornerRadius = 8
        
        
        rightBarButton()
            
        }
    override func viewWillAppear(_ animated: Bool) {
        Service.getCartData(success: { (data) in
            self.badgeCount.text = "\(data.data!.count)"
        }) { (err, code) in
            
        }
    }
    fileprivate func rightBarButton() {
        badgeCount.layer.borderColor = UIColor.clear.cgColor
        badgeCount.layer.borderWidth = 2
        badgeCount.layer.cornerRadius = badgeCount.bounds.size.height / 2
        badgeCount.textAlignment = .center
        badgeCount.layer.masksToBounds = true
        badgeCount.textColor = .white
        badgeCount.font = badgeCount.font.withSize(12)
        badgeCount.backgroundColor = .red
        badgeCount.text = "4"
        
        
        let rightBarButton = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        rightBarButton.setBackgroundImage(UIImage(named: "cart"), for: .normal)
        rightBarButton.addTarget(self, action: #selector(self.onBtnNotification), for: .touchUpInside)
        rightBarButton.addSubview(badgeCount)
        
        
        let rightBarButtomItem = UIBarButtonItem(customView: rightBarButton)
        navigationItem.rightBarButtonItem = rightBarButtomItem
    }
    @objc func onBtnNotification() {
        RootView.cartVC(withVC: self)
    }
        
        // MARK: Create function for menu Action
        func setMenuBtn(_ menuBar: UIBarButtonItem){
            menuBar.target = revealViewController()
            menuBar.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "Message"
            textView.textColor = UIColor.lightGray
        }
    }
    
    func setupField() {
    
    self.txtEmail.type = .standard
    self.txtEmail.style = AuthInputStyle()
    self.txtEmail.clearButtonMode  = .never
      
    self.txtName.type = .standard
    self.txtName.style = AuthInputStyle()
    self.txtName.clearButtonMode  = .never
    
    }
    func sendEmail(name:String, email: String, mobileNo: String) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["you@yoursite.com"])
            mail.setMessageBody("Name: \(name) , Email: \(email) , Mobile Number: \(mobileNo)", isHTML: true)

            present(mail, animated: true)
        } else {
            // show failure alert
            print("fail")
        }
    }
    
    @IBAction func contactAction(_ sender: Any) {
      //  sendEmail(name: txtName.text!, email: txtEmail.text!, mobileNo: txtNumber.text!)
        if self.textView.text == "" || self.txtName.text == "" || self.txtEmail.text == "" {
            self.errorAlert(message: "Please fill all the information.")
            return
        } else {
        Service.sendEmailApi(email: self.txtEmail.text!, name: self.txtName.text!, note: self.textView.text!, success: { (data) in
            if data.success {
                self.successAlert(message: data.message!)
            }else{
                self.errorAlert(message: data.message!)
            }
        }) { (err, code) in
            self.errorAlert(message: err)
        }
    }
    }
    

}

extension ContactUSController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
