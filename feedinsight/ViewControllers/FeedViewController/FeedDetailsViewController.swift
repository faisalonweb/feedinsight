//
//  FeedDetailsViewController.swift
//  FeedInsight
//
//  Created by Mac on 16/06/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import iOSDropDown

class FeedDetailsViewController: UIViewController ,UITextFieldDelegate{
    @IBOutlet weak var ValueField: DropDown!
    
     let arrayColor : NSMutableArray = ["NaCl","CaCl","Mg" ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ValueField.delegate = self
        
        
        ValueField.optionArray = ["Option 1", "Option 2", "Option 3"]
               ValueField.optionArray = ["NaCl","CaCl","Mg" ]
               ValueField.didSelect{(selectedText , index ,id) in
               }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func PlusTap(_ sender: UIButton) {
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
