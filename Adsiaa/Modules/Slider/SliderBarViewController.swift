//
//  SliderBarViewController.swift
//  Adsiaa
//
//  Created by appleguru on 28/9/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import UIKit

class SliderBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func teamActionBtn(_ sender: Any) {
        performSegue(withIdentifier: "team_segue", sender: nil)
    }
    
    @IBAction func planActionBtn(_ sender: Any) {
        performSegue(withIdentifier: "plan_segue", sender: nil)
    }
    @IBAction func serviceActionBtn(_ sender: Any) {
        performSegue(withIdentifier: "service_segue", sender: nil)
    }
}
