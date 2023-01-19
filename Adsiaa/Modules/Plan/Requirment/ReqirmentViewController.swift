//
//  ReqirmentViewController.swift
//  Adsiaa
//
//  Created by appleguru on 30/9/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import UIKit

class ReqirmentViewController: UIViewController {
    
var value = [["Audio","Video","Image","Icon","Description"],["Audio","Video","Image","Icon","Description"],["Audio","Video","Image","Icon","Description"]]
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Requirment"
        // Do any additional setup after loading the view.
    }

}

extension ReqirmentViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return value[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "requirmentCell") as! ReqirmentCell
        cell.nameLbl.text = value[indexPath.section][indexPath.row]
        cell.uploadbutton.addTarget(self, action: #selector(uploadAction), for: .touchUpInside)
        if indexPath.row == 2 {
            cell.uploadbutton.setTitle("Submitted", for: .normal)
            cell.uploadbutton.setTitleColor(UIColor.green, for: .normal)
            cell.uploadbutton.isUserInteractionEnabled = false
            cell.uploadbutton.borderWidth = 0
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

extension ReqirmentViewController: UIDocumentMenuDelegate,UIDocumentPickerDelegate,UINavigationControllerDelegate {
   public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let myURL = urls.first else {
            return
        }
        print("import result : \(myURL)")
    }


    public func documentMenu(_ documentMenu:UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }


    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("view was cancelled")
        dismiss(animated: true, completion: nil)
    }
    
   @objc func uploadAction(){

        let types: [String] = [String("public.data")]
    let importMenu = UIDocumentMenuViewController(documentTypes: types, in: .import)
        importMenu.delegate = self
        importMenu.modalPresentationStyle = .formSheet
        self.present(importMenu, animated: true, completion: nil)
    }
}

