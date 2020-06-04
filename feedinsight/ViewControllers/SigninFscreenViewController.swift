    //
    //  SigninFscreenViewController.swift
    //  FeedInsight
    //
    //  Created by Mac on 21/04/2020.
    //  Copyright © 2020 faisal. All rights reserved.
    //
    
    import UIKit

   
    
    class SigninFscreenViewController: UIViewController{
        
        let userDefault = UserDefaults.standard
           let launchedBefore = UserDefaults.standard.bool(forKey: "usersignedin")
        
        @IBOutlet weak var forgetpasswordLabel: UILabel!
      
        override func viewDidLoad() {
            super.viewDidLoad()
               self.navigationController?.isNavigationBarHidden = true
               self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
               self.navigationController?.navigationBar.shadowImage = UIImage()
            
            
        }
        override func viewDidAppear(_ animated: Bool) {
                if userDefault.bool(forKey: "usersignedin") {
        //            performSegue(withIdentifier: "Verified", sender: self)
                     let vcone = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController; self.navigationController?.pushViewController(vcone!, animated: true)
                }
            }
        
        @IBAction func SigninGoogletap(_ sender: UIButton) {
           
            let vclogin = storyboard?.instantiateViewController(withIdentifier: "SigninVC") as? LoginViewController; self.navigationController?.pushViewController(vclogin!, animated: true)
        }
        
        
        @IBAction func createAccounttAP(_ sender: UIButton) {
            let vc = storyboard?.instantiateViewController(withIdentifier: "SignupVC") as? SignUpViewController
            self.navigationController?.pushViewController(vc!, animated: true)
            
//            let detailVC = SignUpViewController()
//                let navigationController = UINavigationController(rootViewController: detailVC)
//                            navigationController.modalPresentationStyle = .fullScreen
//                                        present(navigationController, animated: true)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            
        }
        
    }
