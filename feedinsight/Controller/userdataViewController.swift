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
import FirebaseFirestore
import CountryPickerView
import SVProgressHUD
import SearchTextField


class userdataViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITableViewDelegate,UITableViewDataSource  {
    
    
    let animalNameArray: [String] = ["Ruminants","Poultry","Aqua","Equines"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellreuse", for: indexPath) as! animalTypeTableViewCell
        cell.labelset?.text = animalNameArray[indexPath.row]
        //cell.setimagebtn.setImage(UIImage(named:"CheckBoxChecked"), for: .normal)
        cell.setimagebtn.setImage(UIImage(named:"animaluncheck"), for: .normal)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let cell = tableView.cellForRow(at: indexPath) as! animalTypeTableViewCell
         
         if cell.setimagebtn.currentImage!.isEqual(UIImage(named: "animaluncheck")) {
             cell.setimagebtn.setImage(UIImage(named: "animalcheck"), for:  .normal)
             animalSelectionArray.append(animalNameArray[indexPath.row])
             var copyStr : String = ""
             pickAnimalSelection.setTitle("", for: .normal)
             for i in 0 ..< animalSelectionArray.count {
                 let string : String = animalSelectionArray[i] + " , "
                 copyStr = copyStr + string
                 pickAnimalSelection.setTitle(copyStr, for: .normal)
             }
         } else {
            cell.setimagebtn.setImage(UIImage(named: "animaluncheck"), for:  .normal)
             if(animalSelectionArray.count != 0) {
                 for i in 0 ..< animalSelectionArray.count {
                     if(animalSelectionArray[i] == cell.labelset.text) {
                         animalSelectionArray.remove(at: i)
                         break
                     }
                 }
             }

             var copyStr : String = ""
             pickAnimalSelection.setTitle("", for: .normal)
             for i in 0 ..< animalSelectionArray.count {
                 let string : String = animalSelectionArray[i] + " , "
                 copyStr = copyStr + string
                 pickAnimalSelection.setTitle(copyStr, for: .normal)
             }
         }
         
     }
    @IBAction func pickAnimalSelection(_ sender: Any) {
        if(self.animaltableview.isHidden == true) {
            self.animaltableview.isHidden = false
           // self.animaltableview.reloadData()
        } else {
            self.animaltableview.isHidden = true
        }
    }
    
    var animalSelectionArray: [String] = [String]()
    @IBOutlet weak var changebutton: UIButton!
    @IBOutlet weak var userdropdown: DropDown!
    @IBOutlet weak var roledropdown: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var locationField: SearchTextField!
    @IBOutlet weak var userpic: UIImageView!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var useremail: UITextField!
    @IBOutlet weak var userphone: UITextField!
    @IBOutlet weak var userotherindus: UITextField!
    @IBOutlet weak var userbuss: UITextField!
    @IBOutlet weak var userpassword: UITextField!
    @IBOutlet weak var userconfirmpassword: UITextField!
    @IBOutlet weak var countryCode: CountryPickerView!
    @IBOutlet weak var induslabel: UILabel!
    @IBOutlet weak var animaltableview: UITableView!
    
    @IBOutlet weak var pickAnimalSelection: UIButton!
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
    
    let textArr = ["Research","Farming","Feed \nManufacturing"]
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
        //        if(userotherindus.text == ""){
        //            userotherindus.textColor = UIColor.init(red: 169/255, green: 169/255, blue: 169/255, alpha: 0.5)
        //            userotherindus.isUserInteractionEnabled =  false
        //        }
    }
    
    override func viewDidLoad() {
        self.animaltableview.isHidden = true
        animaltableview.clipsToBounds = false
        animaltableview.layer.masksToBounds = false
        animaltableview.layer.shadowColor = UIColor.lightGray.cgColor
        animaltableview.layer.shadowOffset = CGSize(width: 0, height: 0)
        animaltableview.layer.shadowRadius = 5.0
        animaltableview.layer.shadowOpacity = 0.5
        
        pickAnimalSelection.titleEdgeInsets.top = 0
        pickAnimalSelection.titleEdgeInsets.left = 8
        pickAnimalSelection.titleEdgeInsets.bottom = 0
        pickAnimalSelection.titleEdgeInsets.right = 0
        pickAnimalSelection.layer.borderWidth = 1
        pickAnimalSelection.layer.borderColor = UIColor(red:192/255, green:192/255, blue:192/255, alpha: 1).cgColor
        
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
        
                    //self.userdropdown.text = animal as? String
                    //print(animal)
                    self.pickAnimalSelection.setTitle(animal as? String, for: .normal)
                   
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
            if(indus as? String == "") {
                //userotherindus.textColor = UIColor.init(red: 169/255, green: 169/255, blue: 169/255, alpha: 0.5)
                induslabel.textColor = UIColor.init(red: 169/255, green: 169/255, blue: 169/255, alpha: 0.5)
                userotherindus.isUserInteractionEnabled =  false
                userotherindus.alpha = 0.3
            } else {
                self.userotherindus.text = indus as? String
                print("industry values is \(indus)")
            }
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
                //self.userdropdown.text = currentuserpickanimal as? String
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
//        locationField.optionArray = pickerData1
//        locationField.didSelect{(selectedText , index ,id) in
//        }
//        locationField.arrowSize = 0
//        locationField.selectedRowColor = UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1.0)
        //        userdropdown.optionArray = ["Cow","Deer","Camel"]
        //        userdropdown.didSelect{(selectedText , index ,id) in
        //        }
        //        userdropdown.selectedRowColor = UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1.0)
         locationField.filterStrings(pickerData1)
         locationField.maxNumberOfResults = 2
         locationField.theme.font = UIFont.systemFont(ofSize: 14)
         locationField.theme.bgColor = UIColor (red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
         locationField.theme.borderColor = UIColor (red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
         locationField.theme.separatorColor = UIColor (red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        locationField.theme.cellHeight = 40
        locationField.itemSelectionHandler = { filteredResults, itemPosition in
             // Just in case you need the item position
             let item = filteredResults[itemPosition]
             print("Item at position \(itemPosition): \(item.title)")

             // Do whatever you want with the picked item
             self.locationField.text = item.title
         }
        
//        roledropdown.optionArray = ["Admin","Client","Lender"]
//        roledropdown.didSelect{(selectedText , index ,id) in
//        }
//        roledropdown.selectedRowColor = UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1.0)
        //let itemSize = UIScreen.main.bounds.width/5 - 3
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 117, height: 150)
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 10
        collectionView.collectionViewLayout = layout
        userpic.layer.cornerRadius = userpic.frame.size.width/2
        userpic.clipsToBounds = true
        userpic.layer.borderWidth = 2.0
        userpic.layer.borderColor = UIColor.white.cgColor
        changebutton.layer.cornerRadius = 8
        
    }
    @IBAction func clickOnLogout(_ sender: Any) {
            let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            let defaults = UserDefaults.standard
            let dictionary = defaults.dictionaryRepresentation()
            dictionary.keys.forEach { key in
                defaults.removeObject(forKey: key)
            }
            let vcone = storyboard?.instantiateViewController(withIdentifier: "SignInID") as? SigninFscreenViewController; self.navigationController?.pushViewController(vcone!, animated: true)
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
          
    }
    
    @IBAction func clickOnLogoutIcon(_ sender: Any) {
        
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
            let defaults = UserDefaults.standard
            let dictionary = defaults.dictionaryRepresentation()
            dictionary.keys.forEach { key in
                defaults.removeObject(forKey: key)
            }
            let vcone = storyboard?.instantiateViewController(withIdentifier: "SignInID") as? SigninFscreenViewController; self.navigationController?.pushViewController(vcone!, animated: true)
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
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
                        if self.username.text != nil && self.useremail.text != nil && self.userotherindus.text != nil && self.userbuss.text != nil && self.userphone.text != nil && self.roledropdown.text != nil && self.locationField.text != nil && self.userpassword.text != nil {
                            Auth.auth().currentUser?.updatePassword(to: self.userpassword.text!) { (error) in
                                if  let error = error {
                                    print(error)
                                }
                            }
                            db.collection("users").document("\(userID ?? "00")").updateData(["name": self.username.text!, "email": self.useremail.text!, "pickanimal": self.pickAnimalSelection.titleLabel!.text! , "pickrole" : self.roledropdown.text! , "location": self.locationField.text!, "industry" : self.userotherindus.text!, "imageURL": localFile!, "business" : self.userbuss.text!,"CollectionIndustry": self.industrycellValue,"countrycode": country.phoneCode,"password": self.userpassword.text!, "userconfirmpassword": self.userconfirmpassword.text!]){ error in
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
            if username.text != nil && useremail.text != nil && userotherindus.text != nil && userbuss.text != nil && userphone.text != nil && roledropdown.text != nil && locationField.text != nil && userpassword.text != nil {
                Auth.auth().currentUser?.updatePassword(to: userpassword.text!) { (error) in
                    if  let error = error {
                        print(error)
                    }
                }
                db.collection("users").document("\(userID ?? "00")").updateData(["name": username.text!, "email": useremail.text!, "pickanimal": self.pickAnimalSelection.titleLabel!.text! , "pickrole" : roledropdown.text! , "location": locationField.text!, "industry" : userotherindus.text!, "business" : userbuss.text!,"CollectionIndustry": self.industrycellValue,"countrycode": country.phoneCode,"password": userpassword.text!, "userconfirmpassword": userconfirmpassword.text!]){ error in
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
        cell.labelusr.numberOfLines = 0
        industrycellValue = cell.labelusr.text!
        if(self.collectionselectedcell == cell.labelusr.text!) {
            cell.backgroundColor = UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1.0)
            cell.imageusr.image = imageArr1[cellIndex]
            cell.labelusr.textColor = UIColor.white
        }
        
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! userCollectionViewCell
        let cellIndex = indexPath.item
        cell.labelusr.numberOfLines = 0
        cell.imageusr.image = imageArr1[cellIndex]
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! userCollectionViewCell
        let cellIndex = indexPath.item
        cell.labelusr.numberOfLines = 0
        cell.imageusr.image = imageArr[cellIndex]
    }
}
