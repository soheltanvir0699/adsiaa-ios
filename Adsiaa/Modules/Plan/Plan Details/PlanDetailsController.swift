//
//  PlanDetailsController.swift
//  Adsiaa
//
//  Created by appleguru on 30/9/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import UIKit
import ImageSlideshow
import AVFoundation
import AVKit
import SDWebImage
import Kingfisher

class PlanDetailsController: UIViewController {

    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var viewImageSlideShow: ImageSlideshow!
    @IBOutlet weak var tblViewHeight: NSLayoutConstraint!
    @IBOutlet weak var imgBtn: UIButton!
    @IBOutlet weak var reviewView: BXView!
    @IBOutlet weak var videoBtn: UIButton!
    @IBOutlet weak var oldPrice: UILabel!
    @IBOutlet weak var newPrice: UILabel!
    @IBOutlet weak var tittle: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var stock: UILabel!
    @IBOutlet weak var quantityLbl: UILabel!
    @IBOutlet weak var reviewTbl: UITableView!
    @IBOutlet weak var reivewCountLbl: UILabel!
    var reviewData: [getReview]?
    var plan: PlanData?
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerViewController!
    var paused: Bool = false
    var totalHeight = 70.0
    var IndexSlectedBanner:Int = -1
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Plan Details"
        // Do any additional setup after loading the view.
        CustomeImageSlideshow()
        videoBtn.alpha = 0.5
        oldPrice.attributedText = "\(plan?.old_price ?? 0.0)TK".strikeThrough()
        newPrice.text = "\(plan?.price ?? 0.0)TK"
        tittle.text = plan?.title
        desc.text = plan?.description!.replacingOccurrences(of: "\\n", with: "\n")
        stock.text = "\((plan?.total_quantity)!-(plan?.sold_quantity)!) in stock."
        reviewView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(reviewBtnAction)))
        vedioPlayer()
        Service.getReviewData(planId: plan!.id, success: { (data) in
            print(data)
            if self.reviewData?.count != 0 {
            self.reviewData = data
                self.reivewCountLbl.text = "REVIEWS(\(self.reviewData?.count ?? 0))"
                self.reviewTbl.reloadData()
            }else {
                
            }
        }) { (err, code) in
            self.errorAlert(message: err)
        }
    }
    @objc func reviewBtnAction () {
        RootView.reviewVC(withVC: self)
    }
    override func viewWillDisappear(_ animated: Bool) {
        avPlayerLayer.player?.pause()
    }
    func vedioPlayer() {
        videoView.isHidden = true
        let url = Bundle.main.url(forResource: "videoplayback", withExtension: ".mp4")

        avPlayer = AVPlayer(url: url!)
        self.avPlayerLayer = AVPlayerViewController()
        avPlayerLayer.player = self.avPlayer
        avPlayerLayer.view.frame = self.videoView.frame
        self.videoView.addSubview(avPlayerLayer.view)

    }
    @objc func playerItemDidReachEnd() {
        avPlayer.seek(to: CMTime.zero)
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
                print("current page:", page)
            }
//        var inputs = [ImageSource]()
//        inputs.append(ImageSource(image: UIImage(named: "online2")!))
//        inputs.append(ImageSource(image: UIImage(named: "online1")!))
//        inputs.append(ImageSource(image: UIImage(named: "online3")!))
//
        var inputs = [SDWebImageSource]()
        if self.plan != nil {
        for imageString in (self.plan?.images)! {
            print(imageString.plan_image)
            let url = URL(string: imageString.plan_image!)!
            let input = SDWebImageSource.init(url: url)
            inputs.append(input)
        }
        }
            
            self.viewImageSlideShow.setImageInputs(inputs)
                 
            
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(self.didTapSliderBanner))
            self.viewImageSlideShow.addGestureRecognizer(recognizer)
            
        }
        @objc func didTapSliderBanner() {
             viewImageSlideShow.presentFullScreenController(from: self)
 
        }
    
    
    @IBAction func imgAction(_ sender: Any) {
        imgBtn.alpha = 1
        videoBtn.alpha = 0.5
        viewImageSlideShow.isHidden = false
        videoView.isHidden = true
        avPlayerLayer.player?.pause()
    }
    
    @IBAction func videoAction(_ sender: Any) {
        imgBtn.alpha = 0.5
        videoBtn.alpha = 1
        avPlayerLayer.player?.play()
        viewImageSlideShow.isHidden = true
        videoView.isHidden = false
    }
    
    @IBAction func qtyIncrease(_ sender: Any) {
        let quantity = Int(quantityLbl.text!)
        let remainQty = (plan?.total_quantity)!-(plan?.sold_quantity)!
        if quantity! < remainQty{
            quantityLbl.text = "\(quantity!+1)"
        }
    }
    
    @IBAction func addToCart(_ sender: Any) {
        Service.addToCartApi(planid: plan!.id, quantity: Int(self.quantityLbl.text!)!, success: { (data) in
            print(data)
            if data.success {
                self.successAlert(message: data.message!)
            }else{
                self.errorAlert(message: data.message!)
            }
        }) { (err, code) in
            self.errorAlert(message: err)
        }
    }
    @IBAction func qtydecrease(_ sender: Any) {
        let quantity = Int(quantityLbl.text!)
        if quantity! > 1 {
            quantityLbl.text = "\(quantity!-1)"
        }
    }
}

extension PlanDetailsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if reviewData != nil {
            return reviewData!.count
        }else {
            tblViewHeight.constant = 0
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCell") as! ReviewCell
        cell.selectedBackgroundView = UIView()
        let label = UILabel(frame: tableView.frame)
        let font = UIFont(name: "Kefa", size: 12.0)
        label.text = reviewData![indexPath.row].descriptions
        label.font = font
        label.numberOfLines = 0
        label.textAlignment = .center
        label.sizeToFit()
        let size = label.frame.height
        print(size)
        cell.nameLbl.text = reviewData![indexPath.row].users?.name
        cell.descLbl.text = reviewData?[indexPath.row].descriptions
        cell.reviewStar.rating = Double(reviewData![indexPath.row].star!)
        
        self.totalHeight =  Double(label.frame.height) + Double(cell.frame.height) * 3
        tblViewHeight.constant = CGFloat(totalHeight)
                //currentIndex = indexPath.row
            
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
        
    }
}


