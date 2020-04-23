//
//  SigninFscreenViewController.swift
//  FeedInsight
//
//  Created by Mac on 21/04/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class SigninFscreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SigninGoogletap(_ sender: UIButton) {
//        let Storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//               let vc:ViewController = Storyboard.instantiateViewController(withIdentifier: "Login") as! ViewController
//               self.navigationController?.pushViewController(vc, animated: true)
    }
    
//     @IBAction func creatAccountTap(_ sender: UIButton) {
////        let Storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
////               let vc:ViewController = Storyboard.instantiateViewController(withIdentifier: "Login") as! ViewController
////               self.navigationController?.pushViewController(vc, animated: true)
//     }
    
    @IBAction func createAccounttAP(_ sender: UIButton) {
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
       if segue.identifier == "SignInGoogle" {
           if let nextViewController = segue.destination as? LoginViewController {
            let backItem = UIBarButtonItem()
            backItem.title = "Something Else"
            navigationItem.backBarButtonItem = backItem 
             // nextViewController.emailField.text = "XYZ" //Or pass any values
       
           }
       }
   }

}
