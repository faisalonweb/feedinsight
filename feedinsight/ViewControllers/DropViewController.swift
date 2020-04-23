//
//  DropViewController.swift
//  FeedInsight
//
//  Created by Mac on 22/04/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import iOSDropDown

class DropViewController: UIViewController {
    @IBOutlet weak var DropField: DropDown!
    @IBOutlet weak var Ectralabel: UILabel!
    
   // @IBOutlet weak var dropDown : DropDown!

    // The list of array to display. Can be changed dynamically
  
    override func viewDidLoad() {
        super.viewDidLoad()
        DropField.optionArray = ["Option 1", "Option 2", "Option 3"]
          //Its Id Values and its optional
          DropField.optionIds = [1,23,54,22]

          // Image Array its optional
          //DropField.ImageArray = [🙊,🥞]
          // The the Closure returns Selected Index and String
          DropField.didSelect{(selectedText , index ,id) in
          self.Ectralabel.text = "Selected String: \(selectedText) \n index: \(index)"
          
        }
        // Do any additional setup after loading the view.
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
