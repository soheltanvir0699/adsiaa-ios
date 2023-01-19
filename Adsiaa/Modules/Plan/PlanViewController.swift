//
//  ProfileViewController.swift
//  SideMenuView
//
//  Created by Vikas on 14/05/20.
//  Copyright © 2020 CodingFeats.org. All rights reserved.
//

import UIKit

class PlanViewController: UIViewController {

    @IBOutlet weak var myPlanColl: UICollectionView!
    @IBOutlet weak var planColl: UICollectionView!
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    let badgeCount = UILabel(frame: CGRect(x: 22, y: -05, width: 20, height: 20))
    var catid:Int?
    var data: plans?
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
//        setMenuBtn(menuBtn)
        title = "Plan"
        Service.getPlanData(catid: catid!, sortId: 1, success: { (data) in
            print(data)
            if data.results?.count != 0 {
                self.data = data
                self.planColl.reloadData()
            }else {
                self.errorAlert(message: "Data Not Found.")
            }
        }) { (err, code) in
            self.errorAlert(message: err)
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        if Constant.isLogIn {
         rightBarButton()
        }
        DispatchQueue.main.async {
            Service.getCartData(success: { (data) in
                self.badgeCount.text = "\(data.data!.count)"
            }) { (err, code) in
                
            }
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

extension PlanViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == myPlanColl {
            return 10
        }else {
            if data != nil{
                return (data?.results!.count)!
            }else {
                return 0
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == planColl {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "planCell", for: indexPath) as? PlanCell
            cell?.planName.text = self.data?.results![indexPath.row].title
        cell?.saleBtn.layer.cornerRadius = 10
            
            if data?.results![indexPath.row].image != nil {
                if let urlAvatar = URL(string: (data?.results![indexPath.row].image)!) {
                    cell?.planImg.kf.setImage(with: urlAvatar)
                }
            }
        
            cell?.oldPrice.attributedText = "\(self.data?.results![indexPath.row].price ?? 0.0)TK".strikeThrough()
            cell?.newPrice.text = "\(self.data?.results![indexPath.row].old_price ?? 0.0)TK"
        return cell!
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myplanCell", for: indexPath) as? MyPlanCell
                   cell?.planName.text = "Laptop Service Plan"
                   if indexPath.row%2 == 0 {
                       cell?.planImg.image = UIImage(named: "city")
                   }else {
                       cell?.planImg.image = UIImage(named: "planImg")
                   }
                   
                   cell?.planOldPrice.attributedText = "3200TK".strikeThrough()
                   cell?.planNewPrice.text = "3000tk"
                   return cell!
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == planColl {
        let font = UIFont(name: "Sinhala Sangam MN", size: 16.0)
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: Int(Double(self.view.frame.width/2)) - 5, height: .max))
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = font
        label.text = "Laptop Service Plan"
        label.sizeToFit()
        return CGSize(width: self.view.frame.width/2 - 5, height: 200+(label.frame.height*2))
        } else {
            return CGSize(width: 155, height: 163)
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == myPlanColl {
            RootView.planFileVC(withVC: self)
        }else {
            RootView.planDetailsVC(plan:(self.data?.results![indexPath.row])!,withVC: self)
        }
    }
    
}
