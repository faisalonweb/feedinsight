//
//  VerifyViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 24/09/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import iOSDropDown
import ActiveLabel
import FirebaseFirestore
import CoreLocation
import FirebaseAuth
import Firebase
import SVProgressHUD
import SwiftMessages


class VerifyViewController: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet weak var emailtext: UILabel!
    @IBOutlet weak var receemail: UIButton!
    @IBOutlet weak var nextBtnOutlet: UIButton!
    
    let defaults = UserDefaults(suiteName:"User")
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
        static let keyusercountry = "usercountryKey"
    }
    var verpassword : String = ""
    var veremail : String = ""
    var veranimal : String = ""
    var verrole : String = ""
    var verlocation : String = ""
    var verusername : String = ""
    var verphoneno : String = ""
    var verindustry : String = ""
    var verbusiness : String = ""
    var vercnfpas : String = ""
    var vercountrycode : String = ""
    var vercollection : String = ""
    var verusercountry : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let emailStr : String = "We sent you a verification email on " + veremail + ". Please verify your email to access FeedInsight."
        emailtext.text = emailStr
        nextBtnOutlet.layer.cornerRadius = 0.5 * nextBtnOutlet.bounds.size.height
        nextBtnOutlet.clipsToBounds = true
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        let popGestureRecognizer = self.navigationController!.interactivePopGestureRecognizer!
        if let targets = popGestureRecognizer.value(forKey: "targets") as? NSMutableArray {
          let gestureRecognizer = UIPanGestureRecognizer()
          gestureRecognizer.setValue(targets, forKey: "targets")
          self.view.addGestureRecognizer(gestureRecognizer)
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    func showError(_ message:String) {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(.error)
        view.configureDropShadow()
        view.configureContent(title: "Error", body: message)
        SwiftMessages.show(view: view)
    }
    private var authUser : User? {
        return Auth.auth().currentUser
    }
    public func sendVerificationMail() {
        if self.authUser != nil && !self.authUser!.isEmailVerified {
            self.authUser!.sendEmailVerification(completion: { (error) in
            })
        }
    }
    
    @IBAction func didreceievemail(_ sender: Any) {
        sendVerificationMail()
    }
    @IBAction func clickonNext(_ sender: Any) {
        SVProgressHUD.show()
        Auth.auth().signIn(withEmail: veremail, password: verpassword){ (result, error) in
            if error != nil {
                SVProgressHUD.dismiss()
                self.showError(error!.localizedDescription)
            }
            else {
                if let authResult = result {
                    let user = authResult.user
                    print("User has Signed In")
                    if user.isEmailVerified {
                        self.defaults!.set(true, forKey: "usersignedin")
                        self.defaults!.synchronize()
                        let db = Firestore.firestore()
                        db.collection("users").document(authResult.user.uid).setData(["name":self.verusername, "password":self.verpassword, "uid": authResult.user.uid,"industry" : self.verindustry, "business" : self.verbusiness, "imageURL" : "","pickanimal" : self.veranimal , "pickrole" : self.verrole, "email" : self.veremail, "phone" : self.verphoneno, "location" : self.verlocation,"CollectionIndustry": self.vercollection,"UserCountry" : self.verusercountry , "countrycode": self.vercountrycode]) { (error) in
                            if error != nil {
                                SVProgressHUD.showError(withStatus:"Data insertion failed")
                                self.showError(error!.localizedDescription)
                                SVProgressHUD.dismiss()
                            }
                            else {
                                self.defaults!.set(self.verrole, forKey: dKeys.keyRole)
                                self.defaults!.set(self.verlocation, forKey: dKeys.keyLocation)
                                self.defaults!.set(self.verusername, forKey: dKeys.keyusername)
                                self.defaults!.set(self.veremail, forKey: dKeys.keyuseremail)
                                self.defaults!.set(self.verphoneno, forKey: dKeys.keyuserphoneno)
                                self.defaults!.set(self.verindustry, forKey: dKeys.keyuserindustry)
                                self.defaults!.set(self.verbusiness, forKey: dKeys.keyuserbussiness)
                                self.defaults!.set(self.verpassword, forKey: dKeys.keyuserpassowrd)
                                self.defaults!.set(self.vercountrycode, forKey: dKeys.keycountrycode)
                                self.defaults!.set(self.veranimal, forKey: dKeys.keyAnimal)
                                self.defaults!.set(self.vercollection, forKey: dKeys.keycollectionview)
                                self.defaults!.set(self.verusercountry, forKey: dKeys.keyusercountry)
                                self.defaults!.synchronize()
                                SVProgressHUD.dismiss()
                                self.transitionToHome()
                            }
                        }
                    } else {
                        SVProgressHUD.dismiss()
                        self.showError("Please verify your email.")
                    }
                }
                SVProgressHUD.dismiss()
            }
        }
    }
    func transitionToHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signUpViewController = storyboard.instantiateViewController(withIdentifier: "tabar") as! UITabBarController
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
}
