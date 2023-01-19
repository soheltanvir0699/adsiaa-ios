//
//  VideoServiceViewController.swift
//  Adsiaa
//
//  Created by appleguru on 29/9/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import UIKit

class VideoServiceViewController: UIViewController {
    var img = [String]()
    var name = [String]()
    var desc = [String]()
    var title1 = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()

        title = self.title1
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension VideoServiceViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  self.desc.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath) as! VideoServiceCell
        cell.videoDesc.text = self.desc[indexPath.row]
        cell.videoImg.image = UIImage(named: self.img[indexPath.row])
        cell.videoName.text = self.name[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
