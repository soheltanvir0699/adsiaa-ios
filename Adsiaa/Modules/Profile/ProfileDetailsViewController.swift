//
//  ProfileDetailsViewController.swift
//  Adsiaa
//
//  Created by appleguru on 28/9/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import UIKit

class ProfileDetailsViewController: UIViewController,UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var menubtn: UIBarButtonItem!
    
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var saveBtn: BXButton!
    @IBOutlet weak var cameraImg: BXImageView!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var coverImg: UIImageView!
    @IBOutlet weak var profileImg: BXImageView!
    var toggle = false
    override func viewDidLoad() {
        super.viewDidLoad()

        setMenuBtn(menubtn)
                    title = "Profile"
        address.isUserInteractionEnabled = false
        phone.isUserInteractionEnabled = false
        email.isUserInteractionEnabled = false
        cameraImg.isUserInteractionEnabled = false
        
        email.delegate = self
        email.becomeFirstResponder()
        cameraImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pickimage)))
        
        Service.getProfileData(success: { (data) in
            if data.success! {
                if data.user?.address != nil {
                    self.address.text = data.user?.address
                }
                if data.user?.phone != nil {
                    self.phone.text = data.user?.phone
                }
                if data.user?.email != nil {
                    self.email.text = data.user?.email
                }
                if data.user?.name != nil {
                    self.userNameLbl.text = data.user?.name
                }
                if data.user?.image != nil {
                    if let urlAvatar = URL(string: (data.user?.image)!) {
                        self.profileImg.kf.setImage(with: urlAvatar)
                        self.coverImg.kf.setImage(with: urlAvatar)
                    }
                }
            }
        }) { (err, code) in
            print(err, code)
            self.errorAlert(message: err)
        }
               
    }
    func updateProfile() {
        Service.updateProfile(phone.text!, address.text!, photo: profileImg.image, success: {data in
            if data.image != nil {
                var userinfo = Constant.UserAllInfo
                userinfo[3] = data.image!
                Constant.UserAllInfo = userinfo

                self.successAlert(message: "Profile Updated.")
            }
            else {
                self.errorAlert(message: "Profile Updated Unsuccessful.")
            }
        }) { (err, code) in
            self.errorAlert(message: err)
        }
    }
    @objc func pickimage()  {
       let imagecontroller = UIImagePickerController()
        imagecontroller.delegate = self
        imagecontroller.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagecontroller, animated: true, completion: nil)
        print("tap")
    }
               
               // MARK: Create function for menu Action
    func setMenuBtn(_ menuBar: UIBarButtonItem){
        menuBar.target = revealViewController()
        menuBar.action = #selector(SWRevealViewController.revealToggle(_:))
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return textField.resignFirstResponder()
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        profileImg.image = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.originalImage.rawValue)] as? UIImage
        coverImg.image = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.originalImage.rawValue)] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func editAction(_ sender: Any) {
        if !toggle {
            self.address.isUserInteractionEnabled = true
            self.phone.isUserInteractionEnabled = true
            self.email.isUserInteractionEnabled = true
            self.cameraImg.isUserInteractionEnabled = true
            self.email.becomeFirstResponder()
            self.toggle.toggle()
            self.saveBtn.setTitle("Save", for: .normal)
            
        } else {
            self.address.isUserInteractionEnabled = false
            self.phone.isUserInteractionEnabled = false
            self.email.isUserInteractionEnabled = false
            self.cameraImg.isUserInteractionEnabled = false
            self.saveBtn.setTitle("Edit Profile", for: .normal)
            self.toggle.toggle()
            updateProfile()
        }
    }
}
