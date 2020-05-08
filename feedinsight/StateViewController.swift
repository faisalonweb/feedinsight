//
//  StateViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 22/04/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import iOSDropDown


class StateViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var proimage: UIImageView!
    
    @IBOutlet weak var notificationimage: UIImageView!
    @IBOutlet weak var dropDown: DropDown!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        notificationimage?.layer.cornerRadius = (notificationimage?.frame.size.width ?? 0.0) / 2
              notificationimage?.clipsToBounds = true
              notificationimage?.layer.borderWidth = 3.0
              notificationimage?.layer.borderColor = UIColor.white.cgColor
        
        proimage?.layer.cornerRadius = (proimage?.frame.size.width ?? 0.0) / 2
              proimage?.clipsToBounds = true
              proimage?.layer.borderWidth = 3.0
              proimage?.layer.borderColor = UIColor.white.cgColor
        
        
        // The list of array to display. Can be changed dynamically
        dropDown.optionArray = ["Option 1", "Option 2", "Option 3"]
        //Its Id Values and its optional
        dropDown.optionIds = [1,23,54,22]
        
        // Image Array its optional
        //        dropDown.ImageArray = [👩🏻‍🦳,🙊,🥞]
        // The the Closure returns Selected Index and String
        dropDown.didSelect{(selectedText , index ,id) in
            //        self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index)"
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           self.view.endEditing(true)
           return false
       }
//    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
//        //dropDown.resignFirstResponder();
//        // Addi//tional code here
//        return false
//    }
    
    
}
