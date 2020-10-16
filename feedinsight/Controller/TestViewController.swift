//
//  TestViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 15/10/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func hitApi(_ sender: Any) {
        let script =  ApiCalling()
        script.LoginData() { (result) -> () in
            print("Result of Login \(result)")
        }
      
    }
    


}
