//
//  gatewayViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 05/06/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class gatewayViewController: UIViewController {
    
    let userDefault = UserDefaults(suiteName:"User")
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()
        let userEmail : String = userDefault?.value(forKey: "useremailStringKey") as? String ?? ""
        if userEmail != "" {
            let vcone = storyboard?.instantiateViewController(withIdentifier: "tabar") as? UITabBarController; self.navigationController?.pushViewController(vcone!, animated: true)
        }
        else {
            let vctwo = storyboard?.instantiateViewController(withIdentifier: "SignInID") as? SigninFscreenViewController; self.navigationController?.pushViewController(vctwo!, animated: true)
        }
    }
    
}
