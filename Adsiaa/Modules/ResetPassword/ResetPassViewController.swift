//
//  ResetPassViewController.swift
//  Adsiaa
//
//  Created by appleguru on 28/9/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import UIKit

class ResetPassViewController: UIViewController {

    @IBOutlet weak var resetView: AnimatedTextInput!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Reset Password"
        setupField()
    }
    func setupField() {
    self.resetView.type = .standard
    self.resetView.style = AuthInputStyle()
    self.resetView.clearButtonMode  = .never
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
