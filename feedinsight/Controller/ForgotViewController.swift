//
//  ForgotViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 23/10/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import SwiftMessages

class ForgotViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var cornerView: UIView!
    @IBOutlet weak var enterBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.layer.cornerRadius = 20
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.cornerView.layer.cornerRadius = 20
        self.cornerView.clipsToBounds =  true
        //emailTextField.layer.cornerRadius = 0.5 * emailTextField.bounds.size.height
        //emailTextField.clipsToBounds = true
        enterBtn.layer.cornerRadius = 0.5 * enterBtn.bounds.size.height
        enterBtn.clipsToBounds = true
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    @IBAction func sendEmail(_ sender: Any) {
        if emailTextField.text == "" {
            let view = MessageView.viewFromNib(layout: .cardView)
            view.configureTheme(.error)
            view.configureDropShadow()
            view.configureContent(title: "Error", body: "Kindly Fill the email text field")
            SwiftMessages.show(view: view)
        }
        else {
            let auth = Auth.auth()
            auth.sendPasswordReset(withEmail: self.emailTextField.text!) { (error) in
                if let error = error {
                    print("errr\(error)")
                    let view = MessageView.viewFromNib(layout: .cardView)
                    view.configureTheme(.error)
                    view.configureDropShadow()
                    view.configureContent(title: "Error", body: error.localizedDescription)
                    SwiftMessages.show(view: view)
                }
                else {
                    print("Email has been sent on your email address")
                    let view = MessageView.viewFromNib(layout: .cardView)
                    view.configureTheme(.success)
                    view.configureDropShadow()
                    view.configureContent(title: "Success", body: "Email has been sent to your rigestered email kindly reset the password")
                    SwiftMessages.show(view: view)
                    let vctwo = self.storyboard?.instantiateViewController(withIdentifier: "SigninVC") as? LoginViewController;
                    self.navigationController?.pushViewController(vctwo!, animated: true)
                }
            }
        }
       
        
      
    }
    
}
