//
//  CheckOutController.swift
//  Adsiaa
//
//  Created by appleguru on 1/10/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import UIKit
import SKRadioButton
import Spring
import DropDown

class CheckOutController: UIViewController {
    @IBOutlet weak var fName: AnimatedTextInput!
    @IBOutlet weak var lName: AnimatedTextInput!
    @IBOutlet weak var cName: AnimatedTextInput!
    @IBOutlet weak var streetAddress: AnimatedTextInput!
    @IBOutlet weak var city: AnimatedTextInput!
    @IBOutlet weak var zip: AnimatedTextInput!
    @IBOutlet weak var phone: AnimatedTextInput!
    @IBOutlet weak var email: AnimatedTextInput!
    @IBOutlet weak var productCellHeight: NSLayoutConstraint!
    @IBOutlet weak var btnradio: SKRadioButton!
    @IBOutlet weak var directBtn: SpringButton!
    @IBOutlet weak var bekashBtn: SpringButton!
    @IBOutlet weak var roketBtn: SpringButton!
    @IBOutlet weak var dropview: DropDown!
    @IBOutlet weak var countryLbl: UILabel!
    var totalHeight = 0.0
    var currentIndex = 0
    let dropDown = DropDown()
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Billing details"
        setupField()
        

        countryLbl.text = "Select a country"
        // The view to which the drop down will appear on
        dropDown.anchorView = dropview // UIView or UIBarButtonItem

        // The list of items to display. Can be changed dynamically
        dropDown.dataSource = Constant.country_list
        // Do any additional setup after loading the view.
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.countryLbl.text = item
            
        }
        dropview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(countyAction)))

        // Will set a custom width instead of the anchor view width
    }
    @objc func countyAction() {
        dropDown.show()
    }
    func setupField() {
    self.fName.type = .standard
    self.fName.style = AuthInputStyle()
    self.fName.clearButtonMode  = .never
    
    self.email.type = .standard
    self.email.style = AuthInputStyle()
    self.email.clearButtonMode  = .never
      
    self.lName.type = .standard
    self.lName.style = AuthInputStyle()
    self.lName.clearButtonMode  = .never
    
    self.cName.type = .standard
    self.cName.style = AuthInputStyle()
    self.cName.clearButtonMode  = .never
        
    self.streetAddress.type = .standard
       self.streetAddress.style = AuthInputStyle()
       self.streetAddress.clearButtonMode  = .never
       
       self.city.type = .standard
       self.city.style = AuthInputStyle()
       self.city.clearButtonMode  = .never
        
        self.zip.type = .standard
           self.zip.style = AuthInputStyle()
           self.zip.clearButtonMode  = .never
           
           self.phone.type = .standard
           self.phone.style = AuthInputStyle()
           self.phone.clearButtonMode  = .never
    }
    

    @IBAction func dircetAction(_ sender: Any) {
        bekashBtn.setImage(UIImage(named: "unswitch"), for: .normal)
        roketBtn.setImage(UIImage(named: "unswitch"), for: .normal)
        directBtn.setImage(UIImage(named: "switch"), for: .normal)
    }
    @IBAction func bekashAction(_ sender: Any) {
        bekashBtn.setImage(UIImage(named: "switch"), for: .normal)
        roketBtn.setImage(UIImage(named: "unswitch"), for: .normal)
        directBtn.setImage(UIImage(named: "unswitch"), for: .normal)
    }
    @IBAction func rocketAction(_ sender: Any) {
        bekashBtn.setImage(UIImage(named: "unswitch"), for: .normal)
        roketBtn.setImage(UIImage(named: "switch"), for: .normal)
        directBtn.setImage(UIImage(named: "unswitch"), for: .normal)
    }
    

}


extension CheckOutController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        currentIndex = indexPath.row
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? ProductCell
            cell?.selectedBackgroundView = UIView()
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.width-51, height: .zero))
        let font = UIFont(name: "Sinhala Sangam MN", size: 17.0)
        label.text = "Plan name"
        label.font = font
        label.numberOfLines = 0
        label.textAlignment = .center
        label.sizeToFit()
        let size = label.frame.height
        print(size)
        if indexPath.row < 4{
        self.totalHeight +=  Double(label.frame.height) + Double(cell!.frame.height)
        productCellHeight.constant = CGFloat(totalHeight)
        }
        return cell!
    
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
       }

       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
       }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    }
}


