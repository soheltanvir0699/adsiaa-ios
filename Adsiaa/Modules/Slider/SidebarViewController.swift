//
//  SidebarViewController.swift
//  SideMenuView
//
//  Created by Vikas on 14/05/20.
//  Copyright © 2020 CodingFeats.org. All rights reserved.
//

import UIKit
import Kingfisher

class SidebarViewController: UIViewController {

    @IBOutlet weak var loginBorder: UILabel!
    @IBOutlet weak var loginBTN: UIButton!
    @IBOutlet weak var profileImg: BXImageView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var profileViewHeight: NSLayoutConstraint!
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         title = "Side menu"
        loginBTN.isUserInteractionEnabled = false
        loginBorder.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let userInfo = Constant.UserAllInfo
        if Constant.isLogIn {
            if !userInfo.isEmpty {
            if let urlAvatar = URL(string: userInfo[3]) {
                self.profileImg.kf.setImage(with: urlAvatar)
            }
            loginBTN.setTitle(userInfo[0], for: .normal)
            loginBTN.isUserInteractionEnabled = false
            loginBorder.isHidden = true
            }
        }else {
            profileImg.image = UIImage(systemName: "person.crop.circle")
            loginBTN.setTitle("Sign In", for: .normal)
            Constant.slider_List = ["Home","Plan","Service"]
            loginBTN.isUserInteractionEnabled = true
            loginBorder.isHidden = false
        }
    }
    
    @IBAction func logInAction(_ sender: Any) {
        performSegue(withIdentifier: "login_segue", sender: nil)
    }
    @IBAction func profileBtn(_ sender: Any) {
        ProfileAction()
    }
    
    
    @objc func ProfileAction() {
        print("working")
        performSegue(withIdentifier: "profiledetails_segue", sender: nil)
    }
    
    func ShowPopUp(){
    _ = UINib.init(nibName: "LogOut", bundle: nil)
    //self.view.register(nib, forCellReuseIdentifier: "SupViewConnectUs")
    let rootView = Bundle.main.loadNibNamed("LogOut", owner: self, options: nil)?[0] as? LogOut
     rootView?.BtnLogout.addTarget(self, action: #selector(GoToLoginView), for: .touchUpInside)
     rootView?.BtnCancel.addTarget(self, action: #selector(dismissSupView), for: .touchUpInside)
    if let aView = rootView {
        aView.tag = 100
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
            if (subview.tag == 100) {
                subview.removeFromSuperview()
            }
        }
       
    }
    @objc func GoToLoginView() {
       // UsersDefault.deleteUserDataFromUSerDefaults()
        for subview in (self.navigationController?.view.subviews)! {
            if (subview.tag == 100) {
                subview.removeFromSuperview()
            }
        }
        Service.logOutApi(success: { (data) in
            print("logout")
            if data.success == true {
                self.profileImg.image = UIImage(systemName: "person.crop.circle")
                self.loginBTN.setTitle("Sign In", for: .normal)
                self.loginBTN.isUserInteractionEnabled = true
                self.loginBorder.isHidden = false
                Constant.isLogIn = false
                Constant.slider_List.removeLast()
                Constant.slider_List.removeLast()
                Constant.AccessToken = ""
                self.tblView.reloadData()
                self.performSegue(withIdentifier: "home_segue", sender: nil)
                self.successAlert(message: data.message!)
            }
        }) { (errstr, errorcode) in
            self.errorAlert(message: errstr)
            print(errorcode)
            if errorcode == 401 {
                
                self.profileImg.image = UIImage(systemName: "person.crop.circle")
                self.loginBTN.setTitle("Sign In", for: .normal)
                self.loginBTN.isUserInteractionEnabled = true
                self.loginBorder.isHidden = false
                Constant.isLogIn = false
                Constant.slider_List.removeLast()
                Constant.slider_List.removeLast()
                Constant.AccessToken = ""
                self.tblView.reloadData()
                self.performSegue(withIdentifier: "home_segue", sender: nil)
            }
        }
        
    }
    
}

extension SidebarViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  Constant.slider_List.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sliderCell", for: indexPath) as! SliderCell
        cell.sliderLbl.text = Constant.slider_List[indexPath.row]
        cell.sliderIcon.image = UIImage(named: Constant.slider_Image[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if Constant.slider_List[indexPath.row] == "Home" {
            performSegue(withIdentifier: "home_segue", sender: nil)
        }else if Constant.slider_List[indexPath.row] == "Plan" {
            performSegue(withIdentifier: "profile_segue", sender: nil)
        }else if Constant.slider_List[indexPath.row] == "Service" {
            performSegue(withIdentifier: "service_segue", sender: nil)
        }else if Constant.slider_List[indexPath.row] == "Sign Out" {
            ShowPopUp()
        }else {
            performSegue(withIdentifier: "contact_segue", sender: nil)
        }
    }
    
}
//["Log In","Home","Plan","Service","Sign Out"]
