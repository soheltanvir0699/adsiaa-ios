//
//  ServiceViewController.swift
//  Adsiaa
//
//  Created by appleguru on 28/9/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import UIKit

class ServiceViewController: UIViewController {
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    let badgeCount = UILabel(frame: CGRect(x: 22, y: -05, width: 20, height: 20))
    override func viewDidLoad() {
        super.viewDidLoad()

     setMenuBtn(menuBtn)
             title = "Services"
        }
    override func viewWillAppear(_ animated: Bool) {
        if Constant.isLogIn {
         rightBarButton()
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
            badgeCount.text = "0"
            
            
            let rightBarButton = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
            rightBarButton.setBackgroundImage(UIImage(named: "cart"), for: .normal)
            rightBarButton.addTarget(self, action: #selector(self.onBtnNotification), for: .touchUpInside)
            rightBarButton.addSubview(badgeCount)
            
            
            let rightBarButtomItem = UIBarButtonItem(customView: rightBarButton)
            navigationItem.rightBarButtonItem = rightBarButtomItem
            Service.getCartData(success: { (data) in
                self.badgeCount.text = "\(data.data!.count)"
            }) { (err, code) in
                
            }
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
}

extension ServiceViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  Constant.service_List.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "serviceCell", for: indexPath) as! ServiceCell
        cell.serviceTxt.text = Constant.service_List[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            RootView.VideoServiceVC(withVC: self, name: Constant.videoName, desc: Constant.videoDesc, img: Constant.videoImg)
        }else if indexPath.row == 1 {
            RootView.onlineServiceVC(withVC: self, name: Constant.onlineName, desc: Constant.onlineDesc, img: Constant.onlineImg)
        } else if indexPath.row == 2 {
            RootView.webServiceVC(withVC: self, name: Constant.webName, desc: Constant.webDesc, img: Constant.webImg)
        } else if indexPath.row == 3 {
            RootView.seoServiceVC(withVC: self)
        }
    }
}
