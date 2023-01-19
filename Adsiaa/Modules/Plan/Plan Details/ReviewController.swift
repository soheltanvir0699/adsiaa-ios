//
//  ReviewController.swift
//  Adsiaa
//
//  Created by appleguru on 30/9/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import UIKit
import Spring

class ReviewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var submitBtn: BXButton!
    @IBOutlet weak var commentTxt: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        commentTxt.text = "Write a Comment Here"
        commentTxt.textColor = UIColor.lightGray
        commentTxt.layer.borderWidth = 0.3
        commentTxt.layer.borderColor = UIColor.darkGray.cgColor
        commentTxt.layer.cornerRadius = 8
        submitBtn.semanticContentAttribute = .forceRightToLeft
        title = "Review"
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "Write a Comment Here"
            textView.textColor = UIColor.lightGray
        }
    }
}
