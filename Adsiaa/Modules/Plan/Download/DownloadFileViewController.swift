//
//  DownloadFileViewController.swift
//  Adsiaa
//
//  Created by appleguru on 30/9/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import UIKit

class DownloadFileViewController: UIViewController {

  var value = [["Audio","Video","Image","Icon","Description"],["Audio","Video","Image","Icon","Description"],["Audio","Video","Image","Icon","Description"]]
        override func viewDidLoad() {
            super.viewDidLoad()

            title = "Delivery"
            // Do any additional setup after loading the view.
        }

    }

    extension DownloadFileViewController : UITableViewDelegate, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return value[section].count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "downloadCell") as! DownloadFileCell
            cell.nameLbl.text = value[indexPath.section][indexPath.row]
            if indexPath.row == 2 {
                cell.downloadBtn.setTitle("Pending", for: .normal)
                cell.downloadBtn.setTitleColor(UIColor.red, for: .normal)
                cell.downloadBtn.isUserInteractionEnabled = false
                cell.downloadBtn.borderWidth = 0
            }
            cell.selectedBackgroundView = UIView()
            return cell
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return value.count
        }
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 40))
            headerView.backgroundColor = UIColor(red: 64/255, green: 140/255, blue: 249/255, alpha: 1)
            headerView.layer.borderColor = UIColor.gray.cgColor
            headerView.layer.borderWidth = 1

            let label = UILabel()
            label.frame = CGRect.init(x: 15, y: 10, width: headerView.frame.width-10, height: headerView.frame.height-10)
            label.text = "\(section+1)x"
            label.textColor = UIColor.white

            headerView.addSubview(label)

            return headerView
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }
    }
