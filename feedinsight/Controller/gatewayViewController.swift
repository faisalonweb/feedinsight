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
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            let userEmail : String = self.userDefault?.value(forKey: "useremailStringKey") as? String ?? ""
            if userEmail != "" {
                let vcone = self.storyboard?.instantiateViewController(withIdentifier: "tabar") as? UITabBarController;
                self.navigationController?.pushViewController(vcone!, animated: true)
            } else {
                let vctwo = self.storyboard?.instantiateViewController(withIdentifier: "SignInID") as? SigninFscreenViewController;
                self.navigationController?.pushViewController(vctwo!, animated: true)
            }
        })

        
    }
    
}
