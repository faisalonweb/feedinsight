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
import SVProgressHUD
class LoginViewController: UIViewController, UITextFieldDelegate {
    
    let userDefault = UserDefaults.standard
    let launchedBefore = UserDefaults.standard.bool(forKey: "usersignedin")

    @IBOutlet weak var signupBtn: ActiveLabel!
    @IBOutlet weak var paswordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    func SignupSelection(){
        print("yesss i cameeee")
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let signUpViewController = storyboard.instantiateViewController(withIdentifier: "SignupVC") as! SignUpViewController
//        self.present(signUpViewController, animated: true, completion: nil)
        if let navController = self.navigationController {
                                           navController.popViewController(animated: true)
                                       }
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        if let navController = self.navigationController {
                                           navController.popViewController(animated: true)
                                       }
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
        SVProgressHUD.show()
           let error = validateFields()
        if error != nil {
            showError(error!)
        }
          else {
        let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
               let password = paswordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
       
         Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                // Couldn't sign in
                  self.showError(error!.localizedDescription)
            }
            else {
                SVProgressHUD.dismiss()
                self.userDefault.set(true, forKey: "usersignedin")
                self.userDefault.synchronize()
                print(result?.user.email)
                if #available(iOS 13.0, *) {
                    self.transitionToHome()
                } else {
                    // Fallback on earlier versions
                }

//                if #available(iOS 13.0, *) {
//                    let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
//                    self.view.window?.rootViewController = homeViewController
//                    self.view.window?.makeKeyAndVisible()
//                } else {
//                    // Fallback on earlier versions
//                }

                
                }
            }
        }
        
    }
     func transitionToHome() {
               // performSegue(withIdentifier: "homeSegue", sender: self)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
             let signUpViewController = storyboard.instantiateViewController(withIdentifier: "tabar") as! UITabBarController
               self.navigationController?.pushViewController(signUpViewController, animated: true)
            }
    
    
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                    if(segue.identifier == "homeSegue"){
                            let displayVC = segue.destination as! UITabBarController
                    }
                }
    
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""  ||
            paswordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        // Check if the password is secure
        let cleanedPassword = paswordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        return nil
    }
    func showError(_ message:String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
//    func showError(_ message:String) {
//
//        errorLabel.text = message
//        errorLabel.alpha = 1
//    }
}
