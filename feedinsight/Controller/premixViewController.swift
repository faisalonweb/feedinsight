//
//  premixViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 18/07/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseAuth
import FirebaseFirestore

class premixViewController: UIViewController {
    
    @IBOutlet weak var profileimage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        let storage = Storage.storage()
        let storageRef =  storage.reference()
        let ref = storageRef.child("uploadphotoone")
        profileimage.sd_setImage(with: ref)
        self.navigationController?.isNavigationBarHidden = true
        profileimage?.layer.cornerRadius = (profileimage?.frame.size.width ?? 0.0) / 2
        
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
        
    }
    
    
    
}
