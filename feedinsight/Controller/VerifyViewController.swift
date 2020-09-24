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



class VerifyViewController: UIViewController {
    @IBOutlet weak var emailtext: UILabel!
    @IBOutlet weak var receemail: UIButton!
    
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
    
    var navBar: UINavigationBar = UINavigationBar()
    override func viewDidLoad() {
        super.viewDidLoad()
//        addNavBarImage()
//        setCustomNavBarView()
        emailtext.text = veremail

       
    }
    func showError(_ message:String) {
        //SVProgressHUD.dismiss()
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    private var authUser : User? {
        return Auth.auth().currentUser
    }
    public func sendVerificationMail() {
        if self.authUser != nil && !self.authUser!.isEmailVerified {
            self.authUser!.sendEmailVerification(completion: { (error) in
                // Notify the user that the mail has sent or couldn't because of an error.
            })
        }
        else {
            // Either the user is not available, or the user is already verified.
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
                                self.defaults!.set(self.veranimal, forKey: dKeys.keyuseremail)
                                self.defaults!.set(self.verphoneno, forKey: dKeys.keyuserphoneno)
                                self.defaults!.set(self.verindustry, forKey: dKeys.keyuserindustry)
                                self.defaults!.set(self.verbusiness, forKey: dKeys.keyuserbussiness)
                                self.defaults!.set(self.verpassword, forKey: dKeys.keyuserpassowrd)
                                self.defaults!.set(self.vercountrycode, forKey: dKeys.keycountrycode)
                                self.defaults!.set(self.veranimal, forKey: dKeys.keyAnimal)
                                self.defaults!.set(self.vercollection, forKey: dKeys.keycollectionview)
                                self.defaults!.set(self.verusercountry, forKey: dKeys.keyusercountry)
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
    
    func addNavBarImage() {
        //navigationItem.titleView = UIImageView(image: UIImage(named: "AppIcon"))
            let navController = navigationController!

            let image = UIImage(named: "AppIcon")!
            let imageView = UIImageView(image: image)

            let bannerWidth = navController.navigationBar.frame.size.width
            let bannerHeight = navController.navigationBar.frame.size.height

            let bannerX = bannerWidth / 2 - image.size.width / 2
            let bannerY = bannerHeight / 2 - image.size.height / 2

            imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit

            navigationItem.titleView = imageView
        }
    func setCustomNavBarView() {
            self.navBar.frame = CGRect(x: 0, y: 0, width: 350, height: 50)  // Set you custom width and Height
            self.navBar.backgroundColor = UIColor.gray
            self.view.addSubview(navBar)

        }

}
