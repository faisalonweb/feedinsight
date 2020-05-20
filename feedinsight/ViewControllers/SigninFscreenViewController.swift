    //
    //  SigninFscreenViewController.swift
    //  FeedInsight
    //
    //  Created by Mac on 21/04/2020.
    //  Copyright © 2020 faisal. All rights reserved.
    //
    
    import UIKit

   
    
    class SigninFscreenViewController: UIViewController{
        
        @IBOutlet weak var forgetpasswordLabel: UILabel!
      
        override func viewDidLoad() {
            super.viewDidLoad()
          
               self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
               self.navigationController?.navigationBar.shadowImage = UIImage()
            
            
        }
        
        @IBAction func SigninGoogletap(_ sender: UIButton) {
            //        let Storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            //               let vc:ViewController = Storyboard.instantiateViewController(withIdentifier: "Login") as! ViewController
            //               self.navigationController?.pushViewController(vc, animated: true)
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
