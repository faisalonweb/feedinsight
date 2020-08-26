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
    struct dKeys {
        static let keyAnimal = "animalStringKey"
        static let keyRole = "roleStringKey"
        static let keyLocation = "locationStringKey"
        static let keyusername = "usernameStringKey"
        static let keyuseremail = "useremailStringKey"
        static let keyuserphoneno = "userphonenoStringKey"
        static let keyuserindustry = "userindustryStringKey"
        static let keyuserbussiness = "userbussinessStringKey"
        static let keyuserpassowrd = "userpasswordStringKey"
        static let keyusercnfpassword = "usercnfpasswordStringKey"
        static let keycountrycode = "countrycodeStringKey"
        static let keycollectionview = "collectionviewStringKey"
    }
    func SignupSelection(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signUpViewController = storyboard.instantiateViewController(withIdentifier: "userSignupViewController") as! userSignupViewController
        //  self.present(signUpViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(signUpViewController, animated: true)
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
        emailField.isUserInteractionEnabled = false
        paswordField.isUserInteractionEnabled = false
        let error = validateFields()
        if error != nil {
            showError(error!)
            print("error")
            self.emailField.isUserInteractionEnabled = true
            self.paswordField.isUserInteractionEnabled = true
        }
        else {
            let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = paswordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if error != nil {
                    // Couldn't sign in
                    SVProgressHUD.dismiss()
                    self.emailField.isUserInteractionEnabled = true
                    self.paswordField.isUserInteractionEnabled = true
                    self.showError(error!.localizedDescription)
                }
                else {
                    SVProgressHUD.dismiss()
                    self.emailField.isUserInteractionEnabled = true
                    self.paswordField.isUserInteractionEnabled = true
                    self.userDefault.set(true, forKey: "usersignedin")
                    self.userDefault.synchronize()
                    
                    let docRef = Firestore.firestore().collection("users").whereField("uid", isEqualTo: Auth.auth().currentUser?.uid ?? "")
                    docRef.getDocuments { (querySnapshot, err) in
                        if let err = err {
                            print(err.localizedDescription)
                            return
                        } else if querySnapshot!.documents.count != 1 {
                            print("More than one documents or none")
                        } else {
                            let document = querySnapshot!.documents.first
                            let dataDescription = document?.data()
                            let currentusername = dataDescription?["name"]
                            let currentuseremail = dataDescription?["email"]
                            let currentuserphone = dataDescription?["phone"]
                            let currentuserindustry = dataDescription?["industry"]
                            let currentuserbusiness = dataDescription?["business"]
                            let currentuserpass = dataDescription?["password"]
                            let currentuserpickanimal = dataDescription?["pickanimal"]
                            let currentuserlocation = dataDescription?["location"]
                            let currentuserrole = dataDescription?["pickrole"]
                            let currentusercountrycode = dataDescription?["countrycode"]
                            let currentusercollectionindustry =  dataDescription?["CollectionIndustry"]
                            self.userDefault.set(currentuserpickanimal, forKey: dKeys.keyAnimal)
                            let imageURL = dataDescription?["imageURL"]
                            let fileUrl = URL(string: imageURL as! String)
                            let data = try? Data(contentsOf:fileUrl!)
                            UserDefaults().set(data, forKey: "imageData")
                            self.userDefault.set(imageURL, forKey: "Link")
                            self.userDefault.set(currentuserrole, forKey: dKeys.keyRole)
                            self.userDefault.set(currentuserlocation, forKey: dKeys.keyLocation)
                            self.userDefault.set(currentusername, forKey: dKeys.keyusername)
                            self.userDefault.set(currentuseremail, forKey: dKeys.keyuseremail)
                            self.userDefault.set(currentuserphone, forKey: dKeys.keyuserphoneno)
                            self.userDefault.set(currentuserindustry, forKey: dKeys.keyuserindustry)
                            self.userDefault.set(currentuserbusiness, forKey: dKeys.keyuserbussiness)
                            self.userDefault.set(currentuserpass, forKey: dKeys.keyuserpassowrd)
                            self.userDefault.set(currentusercountrycode, forKey: dKeys.keycountrycode)
                            self.userDefault.set(currentusercollectionindustry, forKey: dKeys.keycollectionview)
                        }
                    }
                    print(result?.user.uid ?? 0)
                    if #available(iOS 13.0, *) {
                        self.transitionToHome()
                    } else {
                        // Fallback on earlier versions
                    }
                }
            }
        }
    }
    func transitionToHome() {
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
        //        let cleanedPassword = paswordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        //
        //        if Utilities.isPasswordValid(cleanedPassword) == false {
        //            // Password isn't secure enough
        //            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        //        }
        
        return nil
    }
    func showError(_ message:String) {
        SVProgressHUD.dismiss()
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
