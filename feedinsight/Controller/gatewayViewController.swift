//
//  gatewayViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 05/06/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class gatewayViewController: UIViewController {
    
    let userDefault = UserDefaults.standard
              let launchedBefore = UserDefaults.standard.bool(forKey: "usersignedin")

    override func viewDidLoad() {
         self.navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()

           if userDefault.bool(forKey: "usersignedin") {

                              let vcone = storyboard?.instantiateViewController(withIdentifier: "tabar") as? UITabBarController; self.navigationController?.pushViewController(vcone!, animated: true)
                         }
           else {

            let vctwo = storyboard?.instantiateViewController(withIdentifier: "SignInID") as? SigninFscreenViewController; self.navigationController?.pushViewController(vctwo!, animated: true)

        }
    }
    


    

}
