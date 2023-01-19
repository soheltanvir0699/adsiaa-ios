//
//  PlanFileController.swift
//  Adsiaa
//
//  Created by appleguru on 30/9/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import UIKit

class PlanFileController: UIViewController {

    @IBOutlet weak var downloadBtn: BXButton!
    @IBOutlet weak var uploadBtn: BXButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Plan Details"
        uploadBtn.semanticContentAttribute = .forceRightToLeft
        downloadBtn.semanticContentAttribute = .forceRightToLeft
        // Do any additional setup after loading the view.
    }
    
    @IBAction func uploadFile(_ sender: Any) {
        RootView.reuirmentFileVC(withVC: self)
    }
    
    @IBAction func downloadFile(_ sender: Any) {
        RootView.downloadFileVC(withVC: self)
    }
}
