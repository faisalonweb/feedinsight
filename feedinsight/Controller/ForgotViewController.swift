//
//  ForgotViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 23/10/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class ForgotViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var enterBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.layer.cornerRadius = 20
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        //emailTextField.layer.cornerRadius = 0.5 * emailTextField.bounds.size.height
        //emailTextField.clipsToBounds = true
        enterBtn.layer.cornerRadius = 0.5 * enterBtn.bounds.size.height
        enterBtn.clipsToBounds = true
        
    }
    
}
