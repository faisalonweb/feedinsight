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
    @IBOutlet weak var textlbl: UILabel!
    let arrayColor : NSMutableArray = ["NaCl","CaCl","Mg" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ValueField.delegate = self
        ValueField.optionArray = ["Option 1", "Option 2", "Option 3"]
        ValueField.optionArray = ["NaCl","CaCl","Mg" ]
        ValueField.didSelect{(selectedText , index ,id) in
        }
        ValueField.selectedRowColor = UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1.0)
    }
    
    @IBAction func PlusTap(_ sender: UIButton) {
        textlbl.text = ValueField.text
    }
}
