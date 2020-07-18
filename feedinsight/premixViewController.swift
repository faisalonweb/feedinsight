//
//  premixViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 18/07/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class premixViewController: UIViewController {

    @IBOutlet weak var profileimage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileimage.layer.cornerRadius = 15
    }
    
    @IBAction func backBtn(_ sender: Any) {
        if let navController = self.navigationController {
              navController.popViewController(animated: true)
                                                     }
               
    }
    
   

}
