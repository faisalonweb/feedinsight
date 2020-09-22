//  userSignupViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 17/06/2020.
//  Copyright © 2020 faisal. All rights reserved.

import UIKit
import iOSDropDown
import ActiveLabel
import FirebaseFirestore
import CoreLocation
import FirebaseAuth
import Firebase
import CountryPickerView
import SVProgressHUD
import SearchTextField

class userSignupViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate{
    
    let animalNameArray: [String] = ["Ruminants","Poultry","Aqua","Equines"]
    @IBOutlet weak var pickani: UIButton!
    @IBOutlet weak var collectionview: UICollectionView!
    @IBOutlet weak var pickanimal: DropDown!
    @IBOutlet weak var pickrole: UITextField!
    @IBOutlet weak var picklocation: SearchTextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var useremail: UITextField!
    @IBOutlet weak var userphoneno: UITextField!
    @IBOutlet weak var userindustry: UITextField!
    @IBOutlet weak var userbussiness: UITextField!
    @IBOutlet weak var userpassword: UITextField!
    @IBOutlet weak var usercnfpassword: UITextField!
    @IBOutlet weak var countrycode: CountryPickerView!
    @IBOutlet weak var signinoutlet: ActiveLabel!
    @IBOutlet weak var animalSelectionTableView: UITableView!
    @IBOutlet weak var industryLabel: UILabel!
    
    @IBOutlet weak var lCountry: SearchTextField!
    
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var welcomeView: UIView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var phoneView: UIView!
    @IBOutlet weak var IndustryView: UIView!
    @IBOutlet weak var otherIndustryView: UIView!
    @IBOutlet weak var typeAnimalView: UIView!
    @IBOutlet weak var businessView: UIView!
    @IBOutlet weak var roleView: UIView!
    @IBOutlet weak var locationView: UIView!
    
    @IBOutlet weak var cityCountry: UIView!
    @IBOutlet weak var passView: UIView!
    @IBOutlet weak var cnfpassView: UIView!
    @IBOutlet weak var signupView: UIView!
    
    
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
    let defaults = UserDefaults.standard
    var SignupCollectionData = [SignupModel]()
    var pickerData1: [String] = [String]()
    var pickerData2: [String] = [String]()
    var workarray: [String] = [String]()
    var animalSelectionArray: [String] = [String]()
    var collectionViewSelectedName: [String] = [String]()
    private let locationManager = LocationManager()
    var industrycellValue = ""
    let textArr = ["Research","Farming","Feed \nManufacturing","Feed Additives \nTrader/Distributor "]
    let imageArr: [UIImage] = [
        UIImage(named: "research-unselected")!,
        UIImage(named: "farm-unselected")!,
        UIImage(named: "feedmanufacturing-unselected")!,
        UIImage(named: "feedmanufacturing-unselected")!
    ]
    let animalArr: [UIImage] = [
        UIImage(named: "CheckBoxChecked")!,
        UIImage(named: "CheckBoxChecked")!,
        UIImage(named: "CheckBoxChecked")!,
    ]
    let animalArrOne: [UIImage] = [
        UIImage(named: "CheckBoxUnChecked")!,
        UIImage(named: "CheckBoxUnChecked")!,
        UIImage(named: "CheckBoxUnChecked")!,
    ]
    let imageArr1: [UIImage] = [
        UIImage(named: "research-selected")!,
        UIImage(named: "farm-selected")!,
        UIImage(named: "feedmanufacturing-selected")!,
        UIImage(named: "feedmanufacturing-selected")!
    ]
    
    
    private func setCurrentLocation() {
        
        guard let exposedLocation = self.locationManager.exposedLocation else {
            print("*** Error in \(#function): exposedLocation is nil")
            return
        }
        self.locationManager.getPlace(for: exposedLocation) { placemark in
            guard let placemark = placemark else {
                return
            }
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
            self.lCountry.text = output
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {    //delegate method
        self.animalSelectionTableView.isHidden = true
    }
    fileprivate func localCountries() -> [String] {
        if let path = Bundle.main.path(forResource: "countries", ofType: "json") {
            do {
                let jsonData = try Data(contentsOf: URL(fileURLWithPath: path), options: .dataReadingMapped)
                let jsonResult = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as! [[String:String]]
                
                var countryNames = [String]()
                for country in jsonResult {
                    countryNames.append(country["name"]!)
                }
                
                return countryNames
            } catch {
                print("Error parsing jSON: \(error)")
                return []
            }
        }
        return []
    }
    
    override func viewDidLoad() {
        self.dismissKey()
        self.pickrole.delegate = self
        self.userpassword.delegate = self
        self.username.delegate = self
        self.useremail.delegate = self
        self.userphoneno.delegate = self
        self.userindustry.delegate = self
        self.usercnfpassword.delegate = self
        self.userbussiness.delegate = self
        self.usercnfpassword.delegate = self
        
        let tapemail = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        let tapheader = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        let tapwelcome = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        let tapname = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        let tapphone = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        let tapotherindus = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        let tapanimal = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        let tapbuss = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        let taplocation = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        let taprole = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        let tappass = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        let tapcnfpass = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        
        emailView.addGestureRecognizer(tapemail)
        headerView.addGestureRecognizer(tapheader)
        welcomeView.addGestureRecognizer(tapwelcome)
        nameView.addGestureRecognizer(tapname)
        phoneView.addGestureRecognizer(tapphone)
        otherIndustryView.addGestureRecognizer(tapotherindus)
        typeAnimalView.addGestureRecognizer(tapanimal)
        businessView.addGestureRecognizer(tapbuss)
        locationView.addGestureRecognizer(taplocation)
        roleView.addGestureRecognizer(taprole)
        passView.addGestureRecognizer(tappass)
        cnfpassView.addGestureRecognizer(tapcnfpass)
        animalSelectionTableView.clipsToBounds = false
        animalSelectionTableView.layer.masksToBounds = false
        animalSelectionTableView.layer.shadowColor = UIColor.lightGray.cgColor
        animalSelectionTableView.layer.shadowOffset = CGSize(width: 0, height: 0)
        animalSelectionTableView.layer.shadowRadius = 5.0
        animalSelectionTableView.layer.shadowOpacity = 0.5
        pickani.titleEdgeInsets.top = 0
        pickani.titleEdgeInsets.left = 8
        pickani.titleEdgeInsets.bottom = 0
        pickani.titleEdgeInsets.right = 0
        self.setCurrentLocation()
        SignupCollectionData = DataAppend.getAllSignupData()
        self.animalSelectionTableView.isHidden = true
        super.viewDidLoad()
        pickani.setTitleColor(.lightGray, for: .normal)
        let text = try! String(contentsOfFile: Bundle.main.path(forResource: "world-cities", ofType: "txt")!)
        let lineArray = text.components(separatedBy: "\n")
        for eachLA in lineArray {
            workarray = eachLA.components(separatedBy: ",")
            pickerData1.append(workarray[0])
        }
        let countries = localCountries()
        lCountry.filterStrings(countries)
        lCountry.maxNumberOfResults = 5
        lCountry.theme.font = UIFont.systemFont(ofSize: 14)
        lCountry.theme.bgColor = UIColor (red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        lCountry.theme.borderColor = UIColor (red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        lCountry.theme.separatorColor = UIColor (red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        lCountry.theme.cellHeight = 40
        lCountry.itemSelectionHandler = { filteredResults, itemPosition in
            let item = filteredResults[itemPosition]
            self.lCountry.text = item.title
        }
        lCountry.minCharactersNumberToStartFiltering = 3
        lCountry.comparisonOptions = [.anchored]
        pickani.layer.borderWidth = 0.3
        pickani.layer.borderColor = UIColor(red:192/255, green:192/255, blue:192/255, alpha: 1).cgColor
        picklocation.filterStrings(pickerData1)
        picklocation.maxNumberOfResults = 5
        picklocation.theme.font = UIFont.systemFont(ofSize: 14)
        picklocation.theme.bgColor = UIColor (red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        picklocation.theme.borderColor = UIColor (red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        picklocation.theme.separatorColor = UIColor (red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        picklocation.theme.cellHeight = 40
        picklocation.itemSelectionHandler = { filteredResults, itemPosition in
            let item = filteredResults[itemPosition]
            self.picklocation.text = item.title
        }
        picklocation.minCharactersNumberToStartFiltering = 3
        picklocation.comparisonOptions = [.anchored]
        
        let layout = UICollectionViewFlowLayout()
        let itemSize = UIScreen.main.bounds.width/3 - 2
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 10
        collectionview.collectionViewLayout = layout
        let customType = ActiveType.custom(pattern: "\\sSign\\sIn") //Looks for "are"
        signinoutlet.enabledTypes.append(customType)
        self.pickrole.delegate = self
        self.userpassword.delegate = self
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
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }

    @objc func tapAction() {
        self.animalSelectionTableView.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalSelection", for: indexPath) as! AnimalSelectionTableViewCell
        cell.setAnimalName?.text = animalNameArray[indexPath.row]
        cell.tickImage.setImage(UIImage(named:"animaluncheck"), for: .normal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! AnimalSelectionTableViewCell
        
        if cell.tickImage.currentImage!.isEqual(UIImage(named: "animaluncheck")) {
            cell.tickImage.setImage(UIImage(named: "animalcheck"), for:  .normal)
            animalSelectionArray.append(animalNameArray[indexPath.row])
            var copyStr : String = ""
            pickani.setTitle("Pick Animal", for: .normal)
            pickani.setTitleColor(.lightGray, for: .normal)
            for i in 0 ..< animalSelectionArray.count {
                let string : String = animalSelectionArray[i] + " , "
                copyStr = copyStr + string
                pickani.setTitle(copyStr, for: .normal)
                pickani.setTitleColor(.black, for: .normal)
                
            }
        } else {
            cell.tickImage.setImage(UIImage(named: "animaluncheck"), for:  .normal)
            if(animalSelectionArray.count != 0) {
                for i in 0 ..< animalSelectionArray.count {
                    if(animalSelectionArray[i] == cell.setAnimalName.text) {
                        animalSelectionArray.remove(at: i)
                        break
                    }
                }
            }
            
            var copyStr : String = ""
            pickani.setTitleColor(.lightGray, for: .normal)
            pickani.setTitle("Pick Animal", for: .normal)
            for i in 0 ..< animalSelectionArray.count {
                let string : String = animalSelectionArray[i] + " , "
                copyStr = copyStr + string
                pickani.setTitle(copyStr, for: .normal)
                pickani.setTitleColor(.black, for: .normal)
            }
        }
        
    }
    @IBAction func pickAnimalAction(_ sender: Any) {
        if(self.animalSelectionTableView.isHidden == true) {
            self.animalSelectionTableView.isHidden = false
            //self.animalSelectionTableView.reloadData()
        } else {
            self.animalSelectionTableView.isHidden = true
        }
    }
    @IBAction func singuponclick(_ sender: Any) {
        SVProgressHUD.show()
        let country = self.countrycode.selectedCountry
        print(country)
        if(collectionViewSelectedName.count > 0) {
            industrycellValue = collectionViewSelectedName[0]
        } else {
            industrycellValue = ""
        }
        let error = validateFields()
        if error != nil {
            SVProgressHUD.dismiss()
            showError(error!)
        }
        else {
            let firstName = username.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let industryEnter = userindustry.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = useremail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = userpassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let busindessEnter = userbussiness.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let pickrolEnter = pickrole.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let pickanimalEnter = self.pickani.titleLabel!.text!
            let phoneEnter = userphoneno.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let locationEnter = picklocation.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let countryUser = lCountry.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                if err != nil {
                    SVProgressHUD.showError(withStatus:"user creation failed")
                    self.showError(err!.localizedDescription)
                    SVProgressHUD.dismiss()
                }
                else {
                    let db = Firestore.firestore()
                    db.collection("users").document(result!.user.uid).setData(["name":firstName, "password":password, "uid": result!.user.uid,"industry" : industryEnter, "business" : busindessEnter, "imageURL" : "","pickanimal" : pickanimalEnter , "pickrole" : pickrolEnter, "email" : email, "phone" : phoneEnter, "location" : locationEnter,"CollectionIndustry": self.industrycellValue,"UserCountry" : countryUser , "countrycode": country.phoneCode]) { (error) in
                        if error != nil {
                            SVProgressHUD.showError(withStatus:"Data insertion failed")
                            self.showError(error!.localizedDescription)
                            SVProgressHUD.dismiss()
                        }
                        else {
                            self.defaults.set(true, forKey: "usersignedin")
                            self.defaults.synchronize()
                            let currentusername = firstName
                            let currentuseremail = email
                            let currentuserphone = phoneEnter
                            let currentuserindustry = industryEnter
                            let currentuserbusiness = busindessEnter
                            let currentuserpass = password
                            let currentuserpickanimal = pickanimalEnter
                            let currentuserlocation = locationEnter
                            let currentuserrole = pickrolEnter
                            let currentusercountrycode = country.phoneCode
                            let currentusercollectionindustry =  self.industrycellValue
                            let UserCountry =  countryUser
                            
                            
//                            let imageURL = dataDescription?["imageURL"] as? String
//                            if (imageURL != "") {
//                                let fileUrl = URL(string: imageURL!)
//                                let data = try? Data(contentsOf:fileUrl!)
//                                UserDefaults().set(data, forKey: "imageData")
//                                self.userDefault.set(imageURL, forKey: "Link")
//                            }
                            self.defaults.set(currentuserrole, forKey: dKeys.keyRole)
                            self.defaults.set(currentuserlocation, forKey: dKeys.keyLocation)
                            self.defaults.set(currentusername, forKey: dKeys.keyusername)
                            self.defaults.set(currentuseremail, forKey: dKeys.keyuseremail)
                            self.defaults.set(currentuserphone, forKey: dKeys.keyuserphoneno)
                            self.defaults.set(currentuserindustry, forKey: dKeys.keyuserindustry)
                            self.defaults.set(currentuserbusiness, forKey: dKeys.keyuserbussiness)
                            self.defaults.set(currentuserpass, forKey: dKeys.keyuserpassowrd)
                            self.defaults.set(currentusercountrycode, forKey: dKeys.keycountrycode)
                            self.defaults.set(currentuserpickanimal, forKey: dKeys.keyAnimal)
                            self.defaults.set(currentusercollectionindustry, forKey: dKeys.keycollectionview)
                            self.defaults.set(UserCountry, forKey: dKeys.keyusercountry)
                            
                            SVProgressHUD.showSuccess(withStatus: "Success")
                            self.transitionToHome()
                            SVProgressHUD.dismiss()
                        }
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
        if(industrycellValue == "") {
            if (self.userindustry.text == "") {
                return "please select your Industry!"
            }
        }
        if username.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            usercnfpassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            useremail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            usercnfpassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            pickrole.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            //pickanimal.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            userbussiness.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            userphoneno.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            picklocation.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lCountry.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            return "Please fill in all fields."
        }
        if userpassword.text != usercnfpassword.text {
            return "Passwords don't Match"
        }
        return nil
    }
    
    func transitionToHome() {
//        let vcone = storyboard?.instantiateViewController(withIdentifier: "SigninVC") as? LoginViewController; self.navigationController?.pushViewController(vcone!, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signUpViewController = storyboard.instantiateViewController(withIdentifier: "tabar") as! UITabBarController
        self.navigationController?.pushViewController(signUpViewController, animated: true)
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
        cell.signuplabel.numberOfLines = 0
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = true
        if(collectionViewSelectedName.count > 0) {
            userindustry.alpha = 0.3
            industryLabel.textColor = UIColor.init(red: 169/255, green: 169/255, blue: 169/255, alpha: 0.5)
            userindustry.isUserInteractionEnabled =  false
            for i in 0 ..< collectionViewSelectedName.count {
                let string : String = collectionViewSelectedName[i]
                if(string == textArr[cellIndex]) {
                    cell.signupimage.image = imageArr1[cellIndex]
                    cell.backgroundColor =  UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1.0)
                    cell.signuplabel.textColor = UIColor.white
                    break
                } else {
                    cell.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
                    cell.signupimage.image = imageArr[cellIndex]
                    cell.signuplabel.textColor = UIColor.black
                }
            }
        } else {
            userindustry.alpha = 1
            industryLabel.textColor = UIColor.init(red: 81/255, green: 23/255, blue: 79/255, alpha: 1)
            userindustry.isUserInteractionEnabled =  true
            cell.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
            cell.signupimage.image = imageArr[cellIndex]
            cell.signuplabel.textColor = UIColor.black
        }
        cell.signuplabel.text = textArr[cellIndex]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellIndex = indexPath.item
        var boolValue = false
        if(collectionViewSelectedName.count > 0) {
            for i in 0 ..< collectionViewSelectedName.count {
                let string : String = collectionViewSelectedName[i]
                if(string == textArr[cellIndex]) {
                    collectionViewSelectedName.removeAll()
                    boolValue = true
                    break
                }
            }
        }
        if(boolValue == false) {
            collectionViewSelectedName.removeAll()
            collectionViewSelectedName.append(textArr[indexPath.row])
        }
        self.collectionview.reloadData()
    }
}



