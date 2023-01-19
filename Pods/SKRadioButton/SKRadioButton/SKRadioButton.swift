//
//  SKRadioButton.swift
//  UsingRadioButtons
//
//  Created by Kothari, Sagar on 11/9/17.
//  Copyright © 2017 Kothari, Sagar. All rights reserved.
//

import UIKit

@IBDesignable
open class SKRadioButton: UIButton {
  
  private var iconView: UIView?
  private var iconSecondInnerView: UIView?
  private var iconThirdInnerView: UIView?
  private var textLabel: UILabel?
  private var isChecked: Bool = false

  @IBInspectable public var iconColor: UIColor = UIColor.black
  @IBInspectable public var marginWidth: Double = 10
  @IBInspectable public var iconSize: Double = 30
  @IBInspectable public var titleText: String = "Sagar"
  @IBInspectable public var numberOfLines: Int = 0 {
    didSet {
      textLabel?.numberOfLines = numberOfLines
    }
  }
  @IBInspectable public var titleTextColor: UIColor = UIColor.black {
    didSet {
      textLabel?.textColor = titleTextColor
    }
  }

  @IBInspectable public var titleTextBackgroundColor: UIColor = UIColor.white {
    didSet {
      textLabel?.backgroundColor = titleTextBackgroundColor
    }
  }
  
  override open var isSelected: Bool {
    didSet {
      isChecked = isSelected
      super.isSelected = isSelected
    }
  }

  override open func draw(_ rect: CGRect) {
    if iconView == nil {
      iconView = UIView(frame: CGRect(x: 0.0, y: self.frame.origin.y/2.0, width: CGFloat(iconSize), height: CGFloat(iconSize)))
      iconView?.clipsToBounds = true
      iconSecondInnerView = UIView(frame: CGRect(x: 0, y: 0, width: iconSize*0.8, height: iconSize*0.8))
      iconSecondInnerView?.clipsToBounds = true
      iconThirdInnerView = UIView(frame: CGRect(x: 0, y: 0, width: iconSize*0.5, height: iconSize*0.5))
      iconThirdInnerView?.clipsToBounds = true
      self.addSubview(iconView!)
      self.addSubview(iconSecondInnerView!)
      self.addSubview(iconThirdInnerView!)
      iconView?.layer.cornerRadius = iconView!.frame.size.width / 2 - 1
      iconSecondInnerView?.layer.cornerRadius = iconSecondInnerView!.frame.size.width / 2 - 1
      iconThirdInnerView?.layer.cornerRadius = iconThirdInnerView!.frame.size.width / 2 - 1
      let x = Double(iconView!.frame.size.width) + marginWidth
      textLabel = UILabel(frame: CGRect(x: x, y: 0.0, width: Double(frame.size.width)-x, height: Double(frame.size.height)))
      self.addSubview(textLabel!)
      iconView?.isUserInteractionEnabled = false
      iconSecondInnerView?.isUserInteractionEnabled = false
      iconThirdInnerView?.isUserInteractionEnabled = false
      textLabel?.isUserInteractionEnabled = false
    }
    // Apply colors
    iconView?.backgroundColor = iconColor
    iconSecondInnerView?.backgroundColor = UIColor.white
    iconThirdInnerView?.backgroundColor = iconColor

    // If selected show center view, else hide.
    iconThirdInnerView?.isHidden = !isChecked

    // update center frame
    iconView?.frame = CGRect(x: 0.0, y: Double(center.y - iconView!.frame.height/2.0), width: iconSize, height: iconSize)

    // Set position for second inner circle
    iconSecondInnerView?.center = iconView!.center

    // Set position for third inner circle
    iconThirdInnerView?.center = iconView!.center
    
    // Set position for text label
    let x = Double(iconView!.frame.size.width) + marginWidth
    let rect = CGRect(x: x, y: 0.0, width: Double(frame.size.width)-x, height: Double(frame.size.height))
    textLabel?.frame = rect
    textLabel?.text = titleText
    textLabel?.textColor = titleTextColor
    textLabel?.backgroundColor = titleTextBackgroundColor
    textLabel?.numberOfLines = numberOfLines
   }
  
}
