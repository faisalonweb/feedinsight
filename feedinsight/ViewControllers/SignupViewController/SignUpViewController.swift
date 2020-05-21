//
//  SignUpViewController.swift
//  FeedInsight
//
//  Created by Mac on 13/04/2020.
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
//                    class SignUpViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate, CLLocationManagerDelegate {

class SignUpViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate {
    
    // var currentLocation:CLLocation?
    @IBOutlet weak var locationField: DropDown!
    @IBOutlet weak var signinOutlet: ActiveLabel!
    
    @IBOutlet weak var countryView: CountryPickerView!
    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneField: UITextField! {
        didSet { phoneField?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var IndustryField: UITextField!
    @IBOutlet weak var businessField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var repasswordField: UITextField!
    @IBOutlet weak var pickanimalfield: DropDown!
    @IBOutlet weak var pickroleField: DropDown!
    let textArr = ["Research","Farming","FoodManufacturing"]
    var db: Firestore!
    var pickerData1: [String] = [String]()
    var workarray: [String] = [String]()
    private let locationManager = LocationManager()
    
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
    
    @IBAction func backBtn(_ sender: UIButton) {
        // self.dismiss(animated: true, completion: nil)
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
        
    }
    
    @IBAction func SignupTap(_ sender: UIButton) {
        let country = self.countryView.selectedCountry
        print(country)
        let error = validateFields()
        if error != nil {
            showError(error!)
        }
        else {
            
            // Create cleaned versions of the data
            let firstName = NameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let industryEnter = IndustryField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let busindessEnter = businessField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let pickrolEnter = pickroleField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let pickanimalEnter = pickanimalfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let phoneEnter = phoneField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let locationEnter = locationField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                    self.showError(err!.localizedDescription)
                }
                else {
                    
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["name":firstName, "password":password, "uid": result!.user.uid,"industry" : industryEnter, "business" : busindessEnter, "pickanimal" : pickanimalEnter, "pickrole" : pickrolEnter, "email" : email, "phone" : phoneEnter, "location" : locationEnter, "countrycode": country.phoneCode]) { (error) in
                        
                        if error != nil {
                            // Show error message
                            self.showError(error!.localizedDescription)
                        }
                    }
                    // Transition to the home screen
                    if #available(iOS 13.0, *) {
                        self.transitionToHome()
                    } else {
                        // Fallback on earlier versions
                    }
                }
            }
            
        }
        //
        let nameEnter = NameField.text!
        self.saveText(theText: nameEnter)
        // it will get all useers data save in user collection
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
    
    @available(iOS 13.0, *)
    func transitionToHome() {
        
        //            let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        //
        //            view.window?.rootViewController = homeViewController
        //            view.window?.makeKeyAndVisible()
        
        performSegue(withIdentifier: "showDetailSegue", sender: self)
        /// homeSegue
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showDetailSegue"){
            let displayVC = segue.destination as! LoginViewController
        }
    }
    
    func saveText(theText: String) {
        let passwordEnter = passwordField.text!
        let industryEnter =    IndustryField.text!
        let busindessEnter =   businessField.text!
        let repasswordEnter =  repasswordField.text!
        let pickanimalEnter =    pickanimalfield.text!
        let pickrolEnter =    pickroleField.text!
        let emailEnter = emailField.text!
        let phoneEnter = phoneField.text!
        let locationEnter = locationField.text!
        //
        let dict : [String : Any] = ["name" : theText, "PASSWORD" : passwordEnter, "REPASSWORD" : repasswordEnter, "industry" : industryEnter, "business" : busindessEnter, "pickanimal" : pickanimalEnter, "pickrole" : pickrolEnter, "email" : emailEnter, "phone" : phoneEnter, "location" : locationEnter]
        
        //
        let db = Firestore.firestore()
        db.collection("users").addDocument(data: dict){ err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added")
            }
        }
    }
    
    func SignupSelection(){
        print("yesss i cameeee")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signUpViewController = storyboard.instantiateViewController(withIdentifier: "SigninVC") as! LoginViewController
        //  self.present(signUpViewController, animated: true, completion: nil)
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
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
            self.locationField.text = output
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let height: CGFloat = 0 //whatever height you want
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + height)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        db = Firestore.firestore()
        // self.setCurrentLocation()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        self.NameField.delegate = self
        self.emailField.delegate = self
        self.phoneField.delegate = self
        self.IndustryField.delegate = self
        self.businessField.delegate = self
        self.passwordField.delegate = self
        self.repasswordField.delegate = self
        
        let text = try! String(contentsOfFile: Bundle.main.path(forResource: "world-cities", ofType: "txt")!)
        let lineArray = text.components(separatedBy: "\n")
        for eachLA in lineArray
        {
            workarray = eachLA.components(separatedBy: ",")
            pickerData1.append(workarray[0])
            
        }
        let itemSize = UIScreen.main.bounds.width/3 - 2
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 16
        collectionView.collectionViewLayout = layout
        
        pickanimalfield.optionArray = ["Option 1", "Option 2", "Option 3"]
        pickanimalfield.optionArray = ["Cow","Deer","Camel"]
        pickanimalfield.didSelect{(selectedText , index ,id) in
        }
        locationField.optionArray = pickerData1
        locationField.didSelect{(selectedText , index ,id) in
        }
        pickroleField.optionArray = ["Option 1", "Option 2", "Option 3"]
        pickroleField.optionArray = ["Admin","user","manager"]
        pickroleField.didSelect{(selectedText , index ,id) in
        }
        //
        let customType = ActiveType.custom(pattern: "\\sSign\\sIn") //Looks for "are"
        signinOutlet.enabledTypes.append(customType)
        signinOutlet.urlMaximumLength = 91
        
        signinOutlet.customize { label in
            signinOutlet.text = "Have an Account? Sign In"
            signinOutlet.numberOfLines = 1
            signinOutlet.lineSpacing = 4
            signinOutlet.customColor[customType] = UIColor(red: 81/255, green: 23/255, blue: 79/255, alpha: 1.0)
            signinOutlet.customSelectedColor[customType] = UIColor.black
            signinOutlet.configureLinkAttribute = { (type, attributes, isSelected) in
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
    func validateFields() -> String? {
        //  var a = false
        if NameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            repasswordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            pickroleField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            pickanimalfield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            businessField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            IndustryField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            phoneField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            locationField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        let cleanedPassword = repasswordField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        if passwordField.text != repasswordField.text {
            return "Passwords don't Match"
        }
        
        
        return nil
    }
    
    //        @IBAction func accountBtn(_ sender: Any) {
    //            print("came came")
    //            let vc = storyboard?.instantiateViewController(withIdentifier: "SigninVC") as? SignUpViewController
    //            self.navigationController?.pushViewController(vc!, animated: true)
    //        }
    
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! SignUpCollectionViewCell
        let cellIndex = indexPath.item
        cell.industryImage.image = imageArr[cellIndex]
        cell.industryLabel.text = textArr[cellIndex]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SignUpCollectionViewCell
        let cellIndex = indexPath.item
        cell.industryImage.image = imageArr1[cellIndex]
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! SignUpCollectionViewCell
        let cellIndex = indexPath.item
        cell.industryImage.image = imageArr[cellIndex]
    }
    
    
}

