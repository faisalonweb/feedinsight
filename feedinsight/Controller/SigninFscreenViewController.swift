    //
    //  SigninFscreenViewController.swift
    //  FeedInsight
    //
    //  Created by Mac on 21/04/2020.
    //  Copyright © 2020 faisal. All rights reserved.
    //
    
    import UIKit
    
    class SigninFscreenViewController: UIViewController, UIGestureRecognizerDelegate{
        @IBOutlet weak var forgetpasswordLabel: UILabel!
        override func viewDidLoad() {
            super.viewDidLoad()
            self.navigationController?.isNavigationBarHidden = true
            self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
        }
        @IBAction func SigninGoogletap(_ sender: UIButton) {
            let vclogin = storyboard?.instantiateViewController(withIdentifier: "SigninVC") as? LoginViewController; self.navigationController?.pushViewController(vclogin!, animated: true)
        }
        @IBAction func createAccounttAP(_ sender: UIButton) {
            let vc = storyboard?.instantiateViewController(withIdentifier: "userSignupViewController") as? userSignupViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        
        @IBAction func forgotpassword(_ sender: Any) {
            let vcone = storyboard?.instantiateViewController(withIdentifier: "ForgotViewController") as? ForgotViewController;
            self.navigationController?.pushViewController(vcone!, animated: true)
        }
    }
