//
//  userdataViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 10/06/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import iOSDropDown
import Firebase
import FirebaseAuth
import CountryPickerView
import SVProgressHUD


class userdataViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate  {
    
    @IBOutlet weak var changebutton: UIButton!
    @IBOutlet weak var userdropdown: DropDown!
    @IBOutlet weak var roledropdown: DropDown!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var locationField: DropDown!
    @IBOutlet weak var userpic: UIImageView!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var useremail: UITextField!
    @IBOutlet weak var userphone: UITextField!
    @IBOutlet weak var userotherindus: UITextField!
    @IBOutlet weak var userbuss: UITextField!
    @IBOutlet weak var userpassword: UITextField!
    @IBOutlet weak var userconfirmpassword: UITextField!
    @IBOutlet weak var countryCode: CountryPickerView!
    var db: Firestore!
    var urllink : URL!
    var urlbool : Bool = false
    var collectionselectedcell : String = "pak"
    var nmr : Int = 0
    let defaults = UserDefaults.standard
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
    var pickerData1: [String] = [String]()
    var workarray: [String] = [String]()
    var industrycellValue = ""
    private let locationManager = LocationManager()
    
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
            self.locationField.text = output
        }
    }
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidLoad() {
        DispatchQueue.main.async { [weak self] in
            
            let data = self?.defaults.value(forKey: "imageData") as? Data
            if(data != nil) {
                self?.userpic.image = UIImage(data: data!)
            }
        }
        if let userName = defaults.value(forKey: dKeys.keyusername){
            
            self.username.text = userName as? String
            print(userName)
        }
        if let userEmail = defaults.value(forKey: dKeys.keyuseremail){
            
            self.useremail.text = userEmail as? String
            print(userEmail)
        }
        if let animal = defaults.value(forKey: dKeys.keyAnimal){
            
            self.userdropdown.text = animal as? String
            print(animal)
        }
        if let countrycode = defaults.value(forKey: dKeys.keycountrycode){
            
            self.countryCode.setCountryByPhoneCode(countrycode as! String)
            print(countrycode)
        }
        if let location = defaults.value(forKey: dKeys.keyLocation){
            
            self.locationField.text = location as? String
            print(location)
        }
        if let role = defaults.value(forKey: dKeys.keyRole){
            
            self.roledropdown.text = role as? String
            print(role)
        }
        if let busines = defaults.value(forKey: dKeys.keyuserbussiness){
            
            self.userbuss.text = busines as? String
            print(busines)
        }
        if let indus = defaults.value(forKey: dKeys.keyuserindustry){
            
            self.userotherindus.text = indus as? String
            print(indus)
        }
        if let pass = defaults.value(forKey: dKeys.keyuserpassowrd){
            
            self.userpassword.text = pass as? String
            print(pass)
        }
        if let passcnf = defaults.value(forKey: dKeys.keyuserpassowrd){
            
            self.userconfirmpassword.text = passcnf as? String
            print(passcnf)
        }
        if let phone = defaults.value(forKey: dKeys.keyuserphoneno){
            
            self.userphone.text = phone as? String
            print(phone)
        }
        if let collectioncell = defaults.value(forKey: dKeys.keycollectionview){
            self.collectionselectedcell = collectioncell as! String
            print(collectioncell)
        }
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
                self.username.text = currentusername as? String
                self.useremail.text = currentuseremail as? String
                self.userphone.text = currentuserphone as? String
                self.userotherindus.text = currentuserindustry as? String
                self.userbuss.text = currentuserbusiness as? String
                self.userpassword.text = currentuserpass as? String
                self.userconfirmpassword.text = currentuserpass as? String
                self.userdropdown.text = currentuserpickanimal as? String
                self.locationField.text = currentuserlocation as? String
                self.roledropdown.text = currentuserrole as? String
                self.nmr = currentusercountrycode as? Int ?? 0
                self.collectionselectedcell = currentusercollectionindustry as! String
                self.countryCode.setCountryByPhoneCode(currentusercountrycode as! String)
                self.collectionView.reloadData()
            }
        }
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        let text = try! String(contentsOfFile: Bundle.main.path(forResource: "world-cities", ofType: "txt")!)
        let lineArray = text.components(separatedBy: "\n")
        for eachLA in lineArray {
            workarray = eachLA.components(separatedBy: ",")
            pickerData1.append(workarray[0])
        }
        locationField.optionArray = pickerData1
        locationField.didSelect{(selectedText , index ,id) in
        }
        userdropdown.optionArray = ["Cow","Deer","Camel"]
        userdropdown.didSelect{(selectedText , index ,id) in
        }
        roledropdown.optionArray = ["Admin","Client","Lender"]
        roledropdown.didSelect{(selectedText , index ,id) in
        }
        let itemSize = UIScreen.main.bounds.width/3 - 2
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 16
        collectionView.collectionViewLayout = layout
        userpic.layer.cornerRadius = userpic.frame.size.width/2
        userpic.clipsToBounds = true
        userpic.layer.borderWidth = 2.0
        userpic.layer.borderColor = UIColor.white.cgColor
        changebutton.layer.cornerRadius = 8
        
    }
    @IBAction func backbutton(_ sender: Any) {
        let vcone = storyboard?.instantiateViewController(withIdentifier: "tabar") as? UITabBarController; self.navigationController?.pushViewController(vcone!, animated: true)
    }
    @IBAction func changeData(_ sender: Any) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        SVProgressHUD.show(withStatus: "it's working ...")
        if urlbool == true {
            let storage = Storage.storage()
            let storageRef =  storage.reference().child("user/\(uid)")
            let localFile = urllink
            _ = storageRef.putFile(from: localFile!, metadata: nil) { (metadata, err) in
                guard metadata != nil else {
                    print(err?.localizedDescription ?? "none")
                    return
                }
                storageRef.downloadURL(completion: { (url, error) in
                    if let err = error{
                        print(err)
                    } else {
                        let localFile = url?.absoluteString
                        let fileUrl = URL(string: url!.absoluteString)
                        let data = try? Data(contentsOf:fileUrl!)
                        self.userpic.image = UIImage(data: data!)
                        UserDefaults().set(data, forKey: "imageData")
                        let country = self.countryCode.selectedCountry
                        let db = Firestore.firestore()
                        let userID = Auth.auth().currentUser?.uid
                        let userEmail =  Auth.auth().currentUser?.email
                        let currentUser =  Auth.auth().currentUser
                        if self.username.text != nil && self.useremail.text != nil && self.userotherindus.text != nil && self.userbuss.text != nil && self.userphone.text != nil && self.userdropdown.text != nil && self.roledropdown.text != nil && self.locationField.text != nil && self.userpassword.text != nil {
                            Auth.auth().currentUser?.updatePassword(to: self.userpassword.text!) { (error) in
                                if  let error = error {
                                    print(error)
                                }
                            }
                            db.collection("users").document("\(userID ?? "00")").updateData(["name": self.username.text!, "email": self.useremail.text!, "pickanimal": self.userdropdown.text! , "pickrole" : self.roledropdown.text! , "location": self.locationField.text!, "industry" : self.userotherindus.text!, "imageURL": localFile!, "business" : self.userbuss.text!,"CollectionIndustry": self.industrycellValue,"countrycode": country.phoneCode,"password": self.userpassword.text!, "userconfirmpassword": self.userconfirmpassword.text!]){ error in
                                if let error = error {
                                    print("error while updating the reord \(error)")
                                }
                                else {
                                    SVProgressHUD.dismiss()
                                    if self.useremail.text != userEmail {
                                        currentUser?.updateEmail(to: self.useremail.text!){ error in
                                            if  let error = error {
                                                print(error)
                                            }
                                            else {
                                                //                                SVProgressHUD.dismiss()
                                                print("No error while updating the email")
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                })
            }
        } else {
            let country = self.countryCode.selectedCountry
            let db = Firestore.firestore()
            let userID = Auth.auth().currentUser?.uid
            let userEmail =  Auth.auth().currentUser?.email
            let currentUser =  Auth.auth().currentUser
            if username.text != nil && useremail.text != nil && userotherindus.text != nil && userbuss.text != nil && userphone.text != nil && userdropdown.text != nil && roledropdown.text != nil && locationField.text != nil && userpassword.text != nil {
                Auth.auth().currentUser?.updatePassword(to: userpassword.text!) { (error) in
                    if  let error = error {
                        print(error)
                    }
                }
                db.collection("users").document("\(userID ?? "00")").updateData(["name": username.text!, "email": useremail.text!, "pickanimal": userdropdown.text! , "pickrole" : roledropdown.text! , "location": locationField.text!, "industry" : userotherindus.text!, "business" : userbuss.text!,"CollectionIndustry": self.industrycellValue,"countrycode": country.phoneCode,"password": userpassword.text!, "userconfirmpassword": userconfirmpassword.text!]){ error in
                    if let error = error {
                        print("error while updating the reord \(error)")
                    }
                    else {
                        SVProgressHUD.dismiss()
                        if self.useremail.text != userEmail {
                            
                            currentUser?.updateEmail(to: self.useremail.text!){ error in
                                
                                if  let error = error {
                                    
                                    print(error)
                                }
                                else {
                                    //                                SVProgressHUD.dismiss()
                                    print("No error while updating the email")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func selectPhoto(_ sender: UIButton) {
        
        let imagecontroller = UIImagePickerController()
        imagecontroller.delegate = self
        imagecontroller.sourceType = .photoLibrary
        self.present(imagecontroller, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        userpic.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        // Bool true
        self.dismiss(animated: true, completion: nil)
        
        if let url = info[UIImagePickerController.InfoKey.imageURL] as? URL {
            self.urlbool = true
            print("pic url is \(url)")
            
            
            self.urllink = url
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "usercell", for: indexPath) as! userCollectionViewCell
        let cellIndex = indexPath.item
        cell.imageusr.image = imageArr[cellIndex]
        cell.labelusr.text = textArr[cellIndex]
        industrycellValue = cell.labelusr.text!
        if(self.collectionselectedcell == cell.labelusr.text!) {
            cell.backgroundColor = UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1.0)
            cell.imageusr.image = imageArr1[cellIndex]
            cell.labelusr.textColor = UIColor.white
        }
        cell.layer.cornerRadius = 10
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! userCollectionViewCell
        let cellIndex = indexPath.item
        cell.imageusr.image = imageArr1[cellIndex]
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! userCollectionViewCell
        let cellIndex = indexPath.item
        cell.imageusr.image = imageArr[cellIndex]
    }
}
