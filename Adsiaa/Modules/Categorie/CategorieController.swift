//
//  CategorieController.swift
//  Adsiaa
//
//  Created by appleguru on 15/11/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import UIKit

class CategorieController: UIViewController {
    
    @IBOutlet weak var catTbl: UITableView!
    var catData: catData!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Service.getCatData(success: { (data) in
            print(data)
            if !data.results.isEmpty {
                self.catData = data
                self.catTbl.reloadData()
            }
        }) { (err, code) in
            print(err, code)
            self.errorAlert(message: err)
        }

        
    }
    @IBAction func slideMenuBtn(_ sender: UIBarButtonItem) {
        sender.target = revealViewController()
        sender.action = #selector(SWRevealViewController.revealToggle(_:))
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
}

extension CategorieController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if catData?.results != nil{
            return catData.results.count
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CategorieCell
        cell?.catName.text = catData?.results[indexPath.row].title
        cell?.selectedBackgroundView = UIView()
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        RootView.PlanViewController(catid: catData.results[indexPath.row].id, withVC: self)
    }
    
    
}
