//
//  LoginViewController.swift
//  FeedInsight
//
//  Created by Mac on 23/04/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import ActiveLabel
import Firebase
import FirebaseAuth
class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var signupBtn: ActiveLabel!
    @IBOutlet weak var paswordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    func SignupSelection(){
        print("yesss i cameeee")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signUpViewController = storyboard.instantiateViewController(withIdentifier: "SignupVC") as! SignUpViewController
        self.present(signUpViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.paswordField.delegate = self
        self.emailField.delegate = self

        let customType = ActiveType.custom(pattern: "\\sSign\\sUp") //Looks for "are"
                       signupBtn.enabledTypes.append(customType)
                       signupBtn.urlMaximumLength = 61
                       
                       signupBtn.customize { label in
                       signupBtn.text = "Don't have an Account? Sign Up"
                           signupBtn.numberOfLines = 1
                           signupBtn.lineSpacing = 4
                           signupBtn.customColor[customType] = UIColor(red: 81/255, green: 23/255, blue: 79/255, alpha: 1.0)
                           signupBtn.customSelectedColor[customType] = UIColor.black
                   
                           //
                           signupBtn.configureLinkAttribute = { (type, attributes, isSelected) in
                               var atts = attributes
                               switch type {
                               case customType:
                                   atts[NSAttributedString.Key.font] = isSelected ? UIFont.boldSystemFont(ofSize: 12) : UIFont.boldSystemFont(ofSize: 12)
                               default: ()
                               }
                               
                               return atts
                           }
                        label.handleCustomTap(for: customType) { _ in self.SignupSelection() }
                       }
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    func alert(_ title: String, message: String) {
                   let vc = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
                   vc.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                   present(vc, animated: true, completion: nil)
               }

    @IBAction func signinPressed(_ sender: Any) {
        
        if let email = emailField.text , let password = paswordField.text {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print(e)
            }
            else {
                self.performSegue(withIdentifier: "signintapsegue", sender: self)
            }
          // ...
        }
        }
    }
    
}
