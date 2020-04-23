//
//  Screen9ViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 22/04/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import iOSDropDown

class Screen9ViewController: UIViewController {

    @IBOutlet weak var dropDown: DropDown!
    
    
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
  // The list of array to display. Can be changed dynamically
  dropDown.optionArray = ["Option 1", "Option 2", "Option 3"]
  //Its Id Values and its optional
  dropDown.optionIds = [1,23,54,22]

  // Image Array its optional
//  dropDown.ImageArray = ["👩🏻‍🦳","🙊","🥞"]
  // The the Closure returns Selected Index and String
  dropDown.didSelect{(selectedText , index ,id) in
//  self.valueLabel.text = "Selected String: \(selectedText) \n index: \(index)"
  }
    }
    
  

}
