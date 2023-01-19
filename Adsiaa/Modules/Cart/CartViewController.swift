//
//  CartViewController.swift
//  Adsiaa
//
//  Created by appleguru on 30/9/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    @IBOutlet weak var cartTbl: UITableView!
    @IBOutlet weak var subtotoal: UILabel!
    @IBOutlet weak var total: UILabel!
    var cartData:getCartInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Cart"
        // Do any additional setup after loading the view.
        Service.getCartData(success: { (data) in
            print(data)
            if data.success == true {
                self.cartData = data
                self.subtotoal.text = "\(data.total!)TK"
                self.total.text = "\(data.total!)TK"
                self.cartTbl.reloadData()
            }else {
                self.errorAlert(message: "Data get unsuccessful.")
            }
            
        }, failure: { (err, code) in
            self.errorAlert(message: err)
        })
    }
    
    @IBAction func checkOutAction(_ sender: Any) {
        RootView.paymentVC(withVC: self)
    }
    
    @objc func removeCartItem(sender: UIButton){
        print(sender.tag-1000)
        let index = sender.tag-1000
        Service.removeCartData(cartId: (cartData?.data![index].id)!, success: { (data) in
            print(data)
            if data.success == true {
                self.cartData = data
                self.subtotoal.text = "\(data.total!)TK"
                self.total.text = "\(data.total!)TK"
                self.cartTbl.reloadData()
            }else {
                self.errorAlert(message: "Delete data unsuccessful.")
            }
        }) { (err, code) in
            self.errorAlert(message: err)
        }
        
    }
    @objc func increaseQty(sender:UIButton){
        let index = sender.tag-3000
        print(index)
        if let qtyLbl = self.view.viewWithTag(index+4000) as? UILabel {
            qtyLbl.text = "\(Int(qtyLbl.text!)!+1)"
            Service.increaseQtyApi(cartId: (cartData?.data![index].id)!, success: { (data) in
                print(data)
                if data.success {
                    self.subtotoal.text = "\(data.total!)TK"
                    self.total.text = "\(data.total!)TK"
                    qtyLbl.text = "\(data.data![0].quantity!)"
                }else {
                    qtyLbl.text = "\(Int(qtyLbl.text!)!-1)"
                    self.errorAlert(message: data.message!)
                }
            }) { (err, code) in
                qtyLbl.text = "\(Int(qtyLbl.text!)!-1)"
                self.errorAlert(message: err)
            }
        }
    }
    @objc func decreaseQty(sender:UIButton){
        let index = sender.tag-2000
        if let qtyLbl = self.view.viewWithTag(index+4000) as? UILabel {
            qtyLbl.text = "\(Int(qtyLbl.text!)!-1)"
            Service.deincreaseQtyApi(cartId: (cartData?.data![index].id)!, success: { (data) in
                print(data)
                if data.success {
                    self.subtotoal.text = "\(data.total!)TK"
                    self.total.text = "\(data.total!)TK"
                    qtyLbl.text = "\(data.data![0].quantity!)"
                }else {
                    qtyLbl.text = "\(Int(qtyLbl.text!)!+1)"
                    self.errorAlert(message: data.message!)
                }
            }) { (err, code) in
                qtyLbl.text = "\(Int(qtyLbl.text!)!+1)"
                self.errorAlert(message: err)
            }
        }
    }
    
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
           let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as? CartCell
        cell?.cartLbl.text = cartData?.data![indexPath.row].plan![0].title
        cell?.oldPriceLbl.attributedText = "\(cartData?.data![indexPath.row].plan![0].old_price ?? 0)TK".strikeThrough()
        cell?.newPriceLbl.text = "\(cartData?.data![indexPath.row].plan![0].price ?? 0)TK"
        cell?.qtyLbl.text = "\(cartData?.data![indexPath.row].quantity ?? 1)"
        cell?.removeBtn.tag = indexPath.row + 1000
        cell?.increaseBtn.tag = indexPath.row + 2000
        cell?.decreaseBtn.tag = indexPath.row + 3000
        cell?.qtyLbl.tag = indexPath.row + 4000
        var allRating = 0
        if cartData?.data![indexPath.row].plan != nil {
        if cartData?.data![indexPath.row].plan![0].review != nil {
            for review in (cartData?.data![indexPath.row].plan![0].review)! {
                allRating += review.star
            }
        
        }
        }
        if allRating != 0 {
            cell?.rating.rating = Double(allRating/(cartData?.data![indexPath.row].plan![0].review!.count)!)
           
        }
        cell?.selectedBackgroundView = UIView()
        cell?.removeBtn.addTarget(self, action: #selector(removeCartItem(sender:)), for: .touchUpInside)
        cell?.increaseBtn.addTarget(self, action: #selector(decreaseQty(sender:)), for: .touchUpInside)
        cell?.decreaseBtn.addTarget(self, action: #selector(increaseQty(sender:)), for: .touchUpInside)
        return cell!
       }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.cartData != nil {
            return (cartData?.data!.count)!
        }else {
            return 0
        }
        
       }

       func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
       }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    }
}

