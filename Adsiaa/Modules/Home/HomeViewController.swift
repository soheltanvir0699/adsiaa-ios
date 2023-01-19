//
//  HomeViewController.swift
//  SideMenuView
//
//  Created by Vikas on 14/05/20.
//  Copyright © 2020 CodingFeats.org. All rights reserved.
//

import UIKit
import ImageSlideshow

class HomeViewController: UIViewController {
   
    
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    @IBOutlet weak var collview: UICollectionView!
    @IBOutlet weak var cartBtn: UIBarButtonItem!
    
    @IBOutlet weak var viewImageSlideShow: ImageSlideshow!
    @IBOutlet weak var teamHeight: NSLayoutConstraint!
    let badgeCount = UILabel(frame: CGRect(x: 22, y: -05, width: 20, height: 20))
    var IndexSlectedBanner: Int?
    var teamData = [TeamActivity]()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
        print("\(Bundle.main.appName) \(Bundle.main.versionNumber) \(Bundle.main.bundleId) \(Bundle.main.buildId)")
        setMenuBtn(menuBtn)
        title = "Home"
        
        //cartBtn.image = UIImage()
       
        
        CustomeImageSlideshow()
        Service.getTeamData(offset: 0, success: { (data) in
            self.teamData = data
            self.teamHeight.constant = CGFloat(self.teamData.count * 285)/2
            self.collview.reloadData()
        }) { (error, errorcode) in
            print(error, errorcode)
            self.errorAlert(message: error)
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
    
    func CustomeImageSlideshow(){
               viewImageSlideShow.backgroundColor = UIColor.white
               viewImageSlideShow.slideshowInterval = 5.0
               viewImageSlideShow.pageControlPosition = PageControlPosition.insideScrollView
               viewImageSlideShow.pageControl.currentPageIndicatorTintColor = UIColor(red:0.89, green:0.27, blue:0.53, alpha:1.0)
               viewImageSlideShow.pageControl.pageIndicatorTintColor = UIColor.gray
               viewImageSlideShow.contentScaleMode = UIViewContentMode.scaleAspectFill
               viewImageSlideShow.activityIndicator = DefaultActivityIndicator()
               //ViewSliderBanner.isUserInteractionEnabled = false
               viewImageSlideShow.currentPageChanged = { page in
                   self.IndexSlectedBanner=page
               }
           var inputs = [ImageSource]()
           inputs.append(ImageSource(image: UIImage(named: "online2")!))
           inputs.append(ImageSource(image: UIImage(named: "online1")!))
           inputs.append(ImageSource(image: UIImage(named: "online3")!))
           
               
               self.viewImageSlideShow.setImageInputs(inputs)
                    
               
               let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTapSliderBanner))
               self.viewImageSlideShow.addGestureRecognizer(recognizer)
               
           }
           @objc func didTapSliderBanner() {
            print(viewImageSlideShow.currentSlideshowItem!.image)
                viewImageSlideShow.presentFullScreenController(from: self)
    
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


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if teamData.count/2 == 0{
        teamHeight.constant = CGFloat(277 * teamData.count/2)
        }else {
            var totalcount = Int(teamData.count/2)+1
            print(totalcount)
            teamHeight.constant = CGFloat(277 * totalcount)
        }
        return teamData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamCell", for: indexPath) as! TeamCell
        cell.teamImg.image = UIImage(named: Constant.teamImg[indexPath.row])
        cell.selectedBackgroundView = UIView()
        cell.teamName.text = teamData[indexPath.row].name
        cell.teamDes.text = teamData[indexPath.row].rank
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collview.frame.width/2-5, height: 257+20)
    }
    
}

extension Bundle {
    var appName: String {
        return infoDictionary?["CFBundleName"] as! String
    }
    var bundleId: String {
        return bundleIdentifier!
    }
    
    var versionNumber: String {
        return infoDictionary?["CFBundleShortVersionString"] as! String
    }
    var buildId: String {
        return infoDictionary?["CFBundleVersion"] as! String
    }
}

