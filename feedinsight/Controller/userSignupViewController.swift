//
//  userSignupViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 17/06/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import iOSDropDown
import ActiveLabel
import FirebaseFirestore
import CoreLocation
import FirebaseAuth
import Firebase
import CountryPickerView
import SVProgressHUD

class userSignupViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource {
    
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var pickanimal: DropDown!
    @IBOutlet weak var pickrole: DropDown!
    @IBOutlet weak var picklocation: DropDown!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var useremail: UITextField!
    @IBOutlet weak var userphoneno: UITextField!
    @IBOutlet weak var userindustry: UITextField!
    @IBOutlet weak var userbussiness: UITextField!
    @IBOutlet weak var userpassword: UITextField!
    @IBOutlet weak var usercnfpassword: UITextField!
    @IBOutlet weak var countrycode: CountryPickerView!
    
    @IBOutlet weak var signinoutlet: ActiveLabel!
    
    
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
    }
    let defaults = UserDefaults.standard
    
    var SignupCollectionData = [SignupModel]()
    
    
    
    var pickerData1: [String] = [String]()
    var workarray: [String] = [String]()
    private let locationManager = LocationManager()
    var industrycellValue = ""
    
    let textArr = ["Research","Farming","FoodManufacturing"]
    let imageArr: [UIImage] = [
        UIImage(named: "research-unselected")!,
        UIImage(named: "farm-unselected")!,
        UIImage(named: "feedmanufacturing-unselected")!,
    ]
    let imageArr1: [UIImage] = [
        UIImage(named: "research-selected")!,
        UIImage(named: "farm-selected")!,
        UIImage(named: "feedmanufacturing-selected")!,
    ]
    private func setCurrentLocation() {
        
        guard let exposedLocation = self.locationManager.exposedLocation else {
            print("*** Error in \(#function): exposedLocation is nil")
            return
        }
        
        self.locationManager.getPlace(for: exposedLocation) { placemark in
            guard let placemark = placemark else { return }
            
            var output = "Our location is:"
            if let country = placemark.country {
                output = output + "\n\(country)"
            }
            if let state = placemark.administrativeArea {
                output = output + "\n\(state)"
            }
            if let town = placemark.locality {
                output = output + "\n\(town)"
            }
            self.picklocation.text = output
        }
    }
    override func viewDidLoad() {
        
        SignupCollectionData = DataAppend.getAllSignupData()
        super.viewDidLoad()
        
        let text = try! String(contentsOfFile: Bundle.main.path(forResource: "world-cities", ofType: "txt")!)
        let lineArray = text.components(separatedBy: "\n")
        for eachLA in lineArray
        {
            workarray = eachLA.components(separatedBy: ",")
            pickerData1.append(workarray[0])
            
        }
        pickanimal.optionArray = ["Cow","Deer","Camel"]
        pickanimal.didSelect{(selectedText , index ,id) in
        }
        pickrole.optionArray = ["Option 1", "Option 2", "Option 3"]
        pickrole.optionArray = ["Admin","user","manager"]
        pickrole.didSelect{(selectedText , index ,id) in
        }
        picklocation.optionArray = pickerData1
        picklocation.didSelect{(selectedText , index ,id) in
        }
        let itemSize = UIScreen.main.bounds.width/3 - 2
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 16
        collectionview.collectionViewLayout = layout
        
        let customType = ActiveType.custom(pattern: "\\sSign\\sIn") //Looks for "are"
        signinoutlet.enabledTypes.append(customType)
        signinoutlet.urlMaximumLength = 91
        
        signinoutlet.customize { label in
            signinoutlet.text = "Have an Account? Sign In"
            signinoutlet.numberOfLines = 1
            signinoutlet.lineSpacing = 4
            signinoutlet.customColor[customType] = UIColor(red: 81/255, green: 23/255, blue: 79/255, alpha: 1.0)
            signinoutlet.customSelectedColor[customType] = UIColor.black
            signinoutlet.configureLinkAttribute = { (type, attributes, isSelected) in
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
    func SignupSelection(){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signUpViewController = storyboard.instantiateViewController(withIdentifier: "SigninVC") as! LoginViewController
        //  self.present(signUpViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
    @IBAction func singuponclick(_ sender: Any) {
        SVProgressHUD.show()
        
        let country = self.countrycode.selectedCountry
        print(country)
        let error = validateFields()
        if error != nil {
            SVProgressHUD.dismiss()
            showError(error!)
        }
        else {
            
            // Create cleaned versions of the data
            let firstName = username.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let industryEnter = userindustry.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = useremail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = userpassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let busindessEnter = userbussiness.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let pickrolEnter = pickrole.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let pickanimalEnter = pickanimal.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let phoneEnter = userphoneno.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let locationEnter = picklocation.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                // Check for errors
                if err != nil {
                    SVProgressHUD.dismiss()
                    
                    // There was an error creating the user
                    self.showError(err!.localizedDescription)
                }
                else {
                    
                    
                    
                    let db = Firestore.firestore()
                    db.collection("users").document(result!.user.uid).setData(["name":firstName, "password":password, "uid": result!.user.uid,"industry" : industryEnter, "business" : busindessEnter, "pickanimal" : pickanimalEnter, "pickrole" : pickrolEnter, "email" : email, "phone" : phoneEnter, "location" : locationEnter,"CollectionIndustry": self.industrycellValue , "countrycode": country.phoneCode]) { (error) in
                        
                        if error != nil {
                            // Show error message
                            SVProgressHUD.dismiss()
                            self.showError(error!.localizedDescription)
                        }
                        
                        
                    }
                    // Transition to the home screen
                    if #available(iOS 13.0, *) {
                        SVProgressHUD.dismiss()
                        
                        self.transitionToHome()
                    } else {
                        // Fallback on earlier versions
                    }
                }
            }
            
        }
        
        
    }
    func showError(_ message:String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alert(_ title: String, message: String) {
        let vc = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        vc.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(vc, animated: true, completion: nil)
    }
    func validateFields() -> String? {
        
        //  var a = false
        if ( industrycellValue == "")
        {
            if (self.userindustry.text == "")
            {
                return "please select your Industry!"
            }
            
        }
        if username.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            usercnfpassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            useremail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            usercnfpassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            pickrole.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            pickanimal.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            userbussiness.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            userphoneno.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            picklocation.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        let cleanedPassword = usercnfpassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        if userpassword.text != usercnfpassword.text {
            return "Passwords don't Match"
        }
        
        
        return nil
    }
    
    func transitionToHome() {
        
        //            let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        //
        //            view.window?.rootViewController = homeViewController
        //            view.window?.makeKeyAndVisible()
        
        let vcone = storyboard?.instantiateViewController(withIdentifier: "SigninVC") as? LoginViewController; self.navigationController?.pushViewController(vcone!, animated: true)
        /// homeSegue
    }
    
    @IBAction func backbtn(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "usersignup", for: indexPath) as! userSignupCollectionViewCell
        let cellIndex = indexPath.item
        cell.signupimage.image = SignupCollectionData[cellIndex].singupImg
        cell.signuplabel.text = SignupCollectionData[cellIndex].signupStr
        //        industrycellValue =  cell.signuplabel.text!
        //         industrycellValue = ""
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! userSignupCollectionViewCell
        let cellIndex = indexPath.item
        cell.signupimage.image = imageArr1[cellIndex]
        cell.signuplabel.text = textArr[cellIndex]
        industrycellValue =  cell.signuplabel.text!
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! userSignupCollectionViewCell
        let cellIndex = indexPath.item
        
        cell.signupimage.image = SignupCollectionData[cellIndex].singupImg
        cell.signuplabel.text = SignupCollectionData[cellIndex].signupStr
    }
    
    
    
}


