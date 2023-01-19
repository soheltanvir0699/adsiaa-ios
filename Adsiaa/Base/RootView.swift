//
//  RootView.swift
//  Adsiaa
//
//  Created by appleguru on 28/9/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import Foundation
class RootView: NSObject {
    
    class func fotgotVC(withVC vc: UIViewController,title:String){
        // this remove the navigation controll in order to clean the view hierarchy but there is still an error not solved yet
        let StoryBoardID = "ResetPassViewController"
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! ResetPassViewController
        vc.navigationController?.pushViewController(destination, animated: true)
        
    }
    
    class func registerVC(withVC vc: UIViewController,title:String){
        // this remove the navigation controll in order to clean the view hierarchy but there is still an error not solved yet
        let StoryBoardID = "RegisterController"
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! RegisterController
        vc.navigationController?.pushViewController(destination, animated: true)
        
    }
    
    class func VideoServiceVC(withVC vc: UIViewController,name:[String],desc:[String],img:[String]){
        // this remove the navigation controll in order to clean the view hierarchy but there is still an error not solved yet
        let StoryBoardID = "VideoServiceViewController"
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! VideoServiceViewController
        destination.name = name
        destination.img = img
        destination.desc = desc
        destination.title1 = "Video & Creative Services"
        vc.navigationController?.pushViewController(destination, animated: true)
        
    }
    class func onlineServiceVC(withVC vc: UIViewController,name:[String],desc:[String],img:[String]){
        // this remove the navigation controll in order to clean the view hierarchy but there is still an error not solved yet
        let StoryBoardID = "VideoServiceViewController"
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! VideoServiceViewController
        destination.name = name
        destination.img = img
        destination.desc = desc
        destination.title1 = "Online Ad Services"
        vc.navigationController?.pushViewController(destination, animated: true)
        
    }
    
    class func webServiceVC(withVC vc: UIViewController,name:[String],desc:[String],img:[String]){
        // this remove the navigation controll in order to clean the view hierarchy but there is still an error not solved yet
        let StoryBoardID = "VideoServiceViewController"
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! VideoServiceViewController
        destination.name = name
        destination.img = img
        destination.desc = desc
        destination.title1 = "Websites Services"
        vc.navigationController?.pushViewController(destination, animated: true)
        
    }
    
    class func seoServiceVC(withVC vc: UIViewController){
        // this remove the navigation controll in order to clean the view hierarchy but there is still an error not solved yet
        let StoryBoardID = "SeoServiceController"
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! SeoServiceController
        vc.navigationController?.pushViewController(destination, animated: true)
        
    }
    
    
       class func planFileVC(withVC vc: UIViewController){
           // this remove the navigation controll in order to clean the view hierarchy but there is still an error not solved yet
           let StoryBoardID = "PlanFileController"
           let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
           let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! PlanFileController
           vc.navigationController?.pushViewController(destination, animated: true)
           
       }
    class func PlanViewController(catid: Int,withVC vc: UIViewController){
        // this remove the navigation controll in order to clean the view hierarchy but there is still an error not solved yet
        let StoryBoardID = "PlanViewController"
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! PlanViewController
        destination.catid = catid
        vc.navigationController?.pushViewController(destination, animated: true)
        
    }
    class func reuirmentFileVC(withVC vc: UIViewController){
        // this remove the navigation controll in order to clean the view hierarchy but there is still an error not solved yet
        let StoryBoardID = "ReqirmentViewController"
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! ReqirmentViewController
        vc.navigationController?.pushViewController(destination, animated: true)
        
    }
    class func downloadFileVC(withVC vc: UIViewController){
        // this remove the navigation controll in order to clean the view hierarchy but there is still an error not solved yet
        let StoryBoardID = "DownloadFileViewController"
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! DownloadFileViewController
        vc.navigationController?.pushViewController(destination, animated: true)
        
    }
    
    class func planDetailsVC(plan:PlanData,withVC vc: UIViewController){
           // this remove the navigation controll in order to clean the view hierarchy but there is still an error not solved yet
           let StoryBoardID = "PlanDetailsController"
           let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
           let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! PlanDetailsController
             destination.plan = plan
           vc.navigationController?.pushViewController(destination, animated: true)
           
       }
    
    class func reviewVC(withVC vc: UIViewController){
        // this remove the navigation controll in order to clean the view hierarchy but there is still an error not solved yet
        let StoryBoardID = "ReviewController"
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! ReviewController
        vc.navigationController?.pushViewController(destination, animated: true)
        
    }
    
    class func cartVC(withVC vc: UIViewController){
        // this remove the navigation controll in order to clean the view hierarchy but there is still an error not solved yet
        let StoryBoardID = "CartViewController"
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! CartViewController
        vc.navigationController?.pushViewController(destination, animated: true)
        
    }
    class func paymentVC(withVC vc: UIViewController){
        // this remove the navigation controll in order to clean the view hierarchy but there is still an error not solved yet
        let StoryBoardID = "CheckOutController"
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: StoryBoardID) as! CheckOutController
        vc.navigationController?.pushViewController(destination, animated: true)
        
    }
    
    
}

//CartViewController
