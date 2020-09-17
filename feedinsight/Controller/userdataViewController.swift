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


class userdataViewController: UIViewController , UICollectionViewDataSource , UICollectionViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate  {
    
    
    let animalNameArray: [String] = ["Ruminants","Poultry","Aqua","Equines"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "cellreuse", for: indexPath) as! animalTypeTableViewCell
        let animalName : String = defaults.value(forKey: dKeys.keyAnimal) as? String ?? "Pick Animal"
        let animalNameList : [String] = animalName.components(separatedBy: ",")
        for i in 0 ..< animalNameList.count {
            let string = animalNameList[i]
            let trimmedString = string.trimmingCharacters(in: .whitespaces)
            if(animalNameArray[indexPath.row] == trimmedString) {
                cell.setimagebtn.setImage(UIImage(named: "animalcheck"), for:  .normal)
                animalSelectionArray.append(animalNameArray[indexPath.row])
                break
            } else {
                 cell.setimagebtn.setImage(UIImage(named:"animaluncheck"), for: .normal)
            }
        }
        cell.labelset?.text = animalNameArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! animalTypeTableViewCell
        
        if cell.setimagebtn.currentImage!.isEqual(UIImage(named: "animaluncheck")) {
            cell.setimagebtn.setImage(UIImage(named: "animalcheck"), for:  .normal)
            animalSelectionArray.append(animalNameArray[indexPath.row])
            var copyStr : String = ""
            pickAnimalSelection.setTitle("Pick Animal", for: .normal)
            pickAnimalSelection.setTitleColor(.lightGray, for: .normal)
            for i in 0 ..< animalSelectionArray.count {
                let string : String = animalSelectionArray[i] + " , "
                copyStr = copyStr + string
                pickAnimalSelection.setTitle(copyStr, for: .normal)
                pickAnimalSelection.setTitleColor(.black, for: .normal)
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
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var indusview: UIView!
    @IBOutlet weak var otherindusView: UIView!
    @IBOutlet weak var animalView: UIView!
    @IBOutlet weak var bussView: UIView!
    @IBOutlet weak var roleView: UIView!
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var password: UIView!
    @IBOutlet weak var cnfpassView: UIView!
    @IBOutlet weak var changeView: UIView!
    
    @IBOutlet weak var personName: UILabel!
    
    
    
    
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
        super.viewWillAppear(true)
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {    //delegate method
        self.animaltableview.isHidden = true
       }
    
    @objc func tapOnImageAction() {
        let imagecontroller = UIImagePickerController()
        imagecontroller.delegate = self
        imagecontroller.sourceType = .photoLibrary
        self.present(imagecontroller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        self.dismissKey()
        
        let tapOnImage = UITapGestureRecognizer.init(target: self, action: #selector(tapOnImageAction))
        let tapemail = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        let tapheader = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        //let tapwelcome = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        let tapname = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        let tapphone = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        //let tapindus = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        let tapotherindus = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        let tapanimal = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        let tapbuss = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        let taplocation = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        let taprole = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        let tappass = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        let tapcnfpass = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        //let tapsignup = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        userpic.addGestureRecognizer(tapOnImage)
        emailView.addGestureRecognizer(tapemail)
        headerView.addGestureRecognizer(tapheader)
        nameView.addGestureRecognizer(tapname)
        phoneView.addGestureRecognizer(tapphone)
        //indusview.addGestureRecognizer(tapindus)
        otherindusView.addGestureRecognizer(tapotherindus)
        animalView.addGestureRecognizer(tapanimal)
        bussView.addGestureRecognizer(tapbuss)
        locationView.addGestureRecognizer(taplocation)
        roleView.addGestureRecognizer(taprole)
        password.addGestureRecognizer(tappass)
        cnfpassView.addGestureRecognizer(tapcnfpass)
        //changeView.addGestureRecognizer(tapsignup)
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
        self.username.delegate = self
        self.useremail.delegate = self
        self.userpassword.delegate = self
        self.userbuss.delegate = self
        self.userphone.delegate = self
        self.roledropdown.delegate = self
        self.userconfirmpassword.delegate = self
        self.userotherindus.delegate = self
        self.locationField.delegate = self
        DispatchQueue.main.async { [weak self] in
            
            let data = self?.defaults.value(forKey: "imageData") as? Data
            if(data != nil) {
                self?.userpic.image = UIImage(data: data!)
            }
        }
        
        if let userName = defaults.value(forKey: dKeys.keyusername){
            
            self.username.text = userName as? String
            self.personName.text = userName as? String
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
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        let text = try! String(contentsOfFile: Bundle.main.path(forResource: "world-cities", ofType: "txt")!)
        let lineArray = text.components(separatedBy: "\n")
        for eachLA in lineArray {
            workarray = eachLA.components(separatedBy: ",")
            pickerData1.append(workarray[0])
        }
        locationField.filterStrings(pickerData1)
        locationField.maxNumberOfResults = 2
        locationField.theme.font = UIFont.systemFont(ofSize: 14)
        locationField.theme.bgColor = UIColor (red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        locationField.theme.borderColor = UIColor (red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        locationField.theme.separatorColor = UIColor (red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        locationField.theme.cellHeight = 40
        locationField.itemSelectionHandler = { filteredResults, itemPosition in
            let item = filteredResults[itemPosition]
            print("Item at position \(itemPosition): \(item.title)")
            self.locationField.text = item.title
        }
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
        let alert = UIAlertController(title: "Logout", message: "Are you sure you want to logout from feedInsight?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "YES", style: UIAlertAction.Style.destructive, handler: { action in
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
                let defaults = UserDefaults.standard
                let dictionary = defaults.dictionaryRepresentation()
                dictionary.keys.forEach { key in
                    defaults.removeObject(forKey: key)
                }
                let vcone = self.storyboard?.instantiateViewController(withIdentifier: "SignInID") as? SigninFscreenViewController;
                self.navigationController?.pushViewController(vcone!, animated: true)
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    @objc func tapAction() {

        self.animaltableview.isHidden = true

       }
    @IBAction func clickOnLogoutIcon(_ sender: Any) {
        let alert = UIAlertController(title: "Logout", message: "Are you sure you want to logout from feedInsight?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "YES", style: UIAlertAction.Style.destructive, handler: { action in
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
                let defaults = UserDefaults.standard
                let dictionary = defaults.dictionaryRepresentation()
                dictionary.keys.forEach { key in
                    defaults.removeObject(forKey: key)
                }
                let vcone = self.storyboard?.instantiateViewController(withIdentifier: "SignInID") as? SigninFscreenViewController;
                self.navigationController?.pushViewController(vcone!, animated: true)
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
                            db.collection("users").document("\(userID ?? "00")").updateData(["name": self.username.text!, "email": self.useremail.text!,"phone":self.userphone.text!, "pickanimal": self.pickAnimalSelection.titleLabel!.text! , "pickrole" : self.roledropdown.text! , "location": self.locationField.text!, "industry" : self.userotherindus.text!, "imageURL": localFile!, "business" : self.userbuss.text!,"CollectionIndustry": self.industrycellValue,"countrycode": country.phoneCode,"password": self.userpassword.text!, "userconfirmpassword": self.userconfirmpassword.text!]){ error in
                                if let error = error {
                                    print("error while updating the reord \(error)")
                                }
                                else {
                                    SVProgressHUD.dismiss()
//                                    var roledrop : String = self.roledropdown.text!
//                                    var location : String = self.locationField.text!
//                                    var username : String = self.username.text!
//                                    var useremail: String = self.useremail.text!
//                                    var userphone : String = self.userphone.text!
//                                    var userindus : String = self.userotherindus.text!
//                                    var userbus : String = self.userbuss.text!
//                                    var userpas : String = self.userpassword.text!
//                                    var usercnfpas : String = self.userconfirmpassword!
//                                    var usercoll : String = self.industrycellValue!
//
                                    self.defaults.set(self.roledropdown.text, forKey: dKeys.keyRole)
                                    self.defaults.set(self.locationField.text, forKey: dKeys.keyLocation)
                                    self.defaults.set(self.username.text, forKey: dKeys.keyusername)
                                    self.personName.text = self.username.text
                                    self.defaults.set(self.useremail.text, forKey: dKeys.keyuseremail)
                                    self.defaults.set(self.userphone.text, forKey: dKeys.keyuserphoneno)
                                    self.defaults.set(self.userotherindus.text, forKey: dKeys.keyuserindustry)
                                    self.defaults.set(self.userbuss.text, forKey: dKeys.keyuserbussiness)
                                    self.defaults.set(self.userpassword.text, forKey: dKeys.keyuserpassowrd)
                                    self.defaults.set(self.userconfirmpassword.text, forKey: dKeys.keycountrycode)
                                    self.defaults.set(self.industrycellValue, forKey: dKeys.keycollectionview)
                                    self.defaults.set(self.pickAnimalSelection.titleLabel!.text!, forKey: dKeys.keyAnimal)
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
                db.collection("users").document("\(userID ?? "00")").updateData(["name": username.text!, "email": useremail.text!,"phone":self.userphone.text!, "pickanimal": self.pickAnimalSelection.titleLabel!.text! , "pickrole" : roledropdown.text! , "location": locationField.text!, "industry" : userotherindus.text!, "business" : userbuss.text!,"CollectionIndustry": self.industrycellValue,"countrycode": country.phoneCode,"password": userpassword.text!, "userconfirmpassword": userconfirmpassword.text!]){ error in
                    if let error = error {
                        print("error while updating the reord \(error)")
                    }
                    else {
                        SVProgressHUD.dismiss()
                        self.defaults.set(self.roledropdown.text, forKey: dKeys.keyRole)
                        self.defaults.set(self.locationField.text, forKey: dKeys.keyLocation)
                        self.defaults.set(self.username.text, forKey: dKeys.keyusername)
                        self.personName.text = self.username.text
                        self.defaults.set(self.useremail.text, forKey: dKeys.keyuseremail)
                        self.defaults.set(self.userphone.text, forKey: dKeys.keyuserphoneno)
                        self.defaults.set(self.userotherindus.text, forKey: dKeys.keyuserindustry)
                        self.defaults.set(self.userbuss.text, forKey: dKeys.keyuserbussiness)
                        self.defaults.set(self.userpassword.text, forKey: dKeys.keyuserpassowrd)
                        self.defaults.set(self.userconfirmpassword.text, forKey: dKeys.keycountrycode)
                        self.defaults.set(self.industrycellValue, forKey: dKeys.keycollectionview)
                        self.defaults.set(self.pickAnimalSelection.titleLabel!.text!, forKey: dKeys.keyAnimal)
                        if self.useremail.text != userEmail {
                            
                            currentUser?.updateEmail(to: self.useremail.text!){ error in
                                
                                if  let error = error {
                                    
                                    print(error)
                                }
                                else {
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
        industrycellValue = cell.labelusr.text!
        cell.imageusr.image = imageArr1[cellIndex]
        //self.collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! userCollectionViewCell
        let cellIndex = indexPath.item
        cell.labelusr.numberOfLines = 0
        cell.imageusr.image = imageArr[cellIndex]
    }
}
