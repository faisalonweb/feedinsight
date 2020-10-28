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
import SwiftMessages
class userSignupViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UIGestureRecognizerDelegate{
    
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
    let defaults = UserDefaults(suiteName:"User")
    var SignupCollectionData = [SignupModel]()
    var pickerData1: [String] = [String]()
    var pickerData2: [String] = [String]()
    var workarray: [String] = [String]()
    var animalSelectionArray: [String] = [String]()
    var collectionViewSelectedName: [String] = [String]()
    var country : String = ""
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
            if let country = placemark.country {
                self.lCountry.text = country
            }
            if let town = placemark.locality {
                self.picklocation.text = town
            }
            
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
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        let popGestureRecognizer = self.navigationController!.interactivePopGestureRecognizer!
        if let targets = popGestureRecognizer.value(forKey: "targets") as? NSMutableArray {
          let gestureRecognizer = UIPanGestureRecognizer()
          gestureRecognizer.setValue(targets, forKey: "targets")
          self.view.addGestureRecognizer(gestureRecognizer)
        }
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
                var string : String = ""
                if(i == 0) {
                    string = animalSelectionArray[i]
                } else {
                    string = " , " + animalSelectionArray[i]
                }
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
                var string : String = ""
                if(i == 0) {
                    string = animalSelectionArray[i]
                } else {
                    string = " , " + animalSelectionArray[i]
                }
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
    
    @IBAction func singuponclick(_ sender: Any) {
        SVProgressHUD.show()
        self.username.isUserInteractionEnabled = false
        self.userindustry.isUserInteractionEnabled = false
        self.useremail.isUserInteractionEnabled = false
        self.userpassword.isUserInteractionEnabled = false
        self.userbussiness.isUserInteractionEnabled = false
        self.pickrole.isUserInteractionEnabled = false
        self.pickani.isUserInteractionEnabled = false
        self.userphoneno.isUserInteractionEnabled = false
        self.picklocation.isUserInteractionEnabled = false
        self.lCountry.isUserInteractionEnabled = false
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
            self.username.isUserInteractionEnabled = true
            self.userindustry.isUserInteractionEnabled = true
            self.useremail.isUserInteractionEnabled = true
            self.userpassword.isUserInteractionEnabled = true
            self.userbussiness.isUserInteractionEnabled = true
            self.pickrole.isUserInteractionEnabled = true
            self.pickani.isUserInteractionEnabled = true
            self.userphoneno.isUserInteractionEnabled = true
            self.picklocation.isUserInteractionEnabled = true
            self.lCountry.isUserInteractionEnabled = true
        }
        else {
            let country = country.phoneCode
            let firstName = self.username.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let industryEnter = self.userindustry.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = self.useremail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = self.userpassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let busindessEnter = self.userbussiness.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let pickrolEnter = self.pickrole.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let pickanimalEnter = self.pickani.titleLabel!.text!
            let phoneEnter = self.userphoneno.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let locationEnter = self.picklocation.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let countryUser = self.lCountry.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                if err != nil {
                    SVProgressHUD.showError(withStatus:"user creation failed")
                    self.showError(err!.localizedDescription)
                    SVProgressHUD.dismiss()
                    self.username.isUserInteractionEnabled = true
                    self.userindustry.isUserInteractionEnabled = true
                    self.useremail.isUserInteractionEnabled = true
                    self.userpassword.isUserInteractionEnabled = true
                    self.userbussiness.isUserInteractionEnabled = true
                    self.pickrole.isUserInteractionEnabled = true
                    self.pickani.isUserInteractionEnabled = true
                    self.userphoneno.isUserInteractionEnabled = true
                    self.picklocation.isUserInteractionEnabled = true
                    self.lCountry.isUserInteractionEnabled = true
                }
                else {
                    self.sendVerificationMail()
                    SVProgressHUD.showSuccess(withStatus: "Success")
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let signUpViewController = storyboard.instantiateViewController(withIdentifier: "VerifyViewController") as! VerifyViewController
                    signUpViewController.veremail = email
                    signUpViewController.verpassword = password
                    signUpViewController.verrole = pickrolEnter
                    signUpViewController.veranimal = pickanimalEnter
                    signUpViewController.verphoneno = phoneEnter
                    signUpViewController.verlocation = locationEnter
                    signUpViewController.verusername = firstName
                    signUpViewController.verindustry = industryEnter
                    signUpViewController.vercollection = self.industrycellValue
                    signUpViewController.verbusiness = busindessEnter
                    signUpViewController.vercountrycode = country
                    signUpViewController.verusercountry = countryUser
                    self.navigationController?.pushViewController(signUpViewController, animated: true)
                    SVProgressHUD.dismiss()
                    self.username.isUserInteractionEnabled = true
                    self.userindustry.isUserInteractionEnabled = true
                    self.useremail.isUserInteractionEnabled = true
                    self.userpassword.isUserInteractionEnabled = true
                    self.userbussiness.isUserInteractionEnabled = true
                    self.pickrole.isUserInteractionEnabled = true
                    self.pickani.isUserInteractionEnabled = true
                    self.userphoneno.isUserInteractionEnabled = true
                    self.picklocation.isUserInteractionEnabled = true
                    self.lCountry.isUserInteractionEnabled = true
                }
            }
        }
    }
    
    func showError(_ message:String) {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(.error)
        view.configureDropShadow()
        view.configureContent(title: "Error", body: message)
        SwiftMessages.show(view: view)
    }
    func alert(_ title: String, message: String) {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(.error)
        view.configureDropShadow()
        view.configureContent(title: title, body: message)
        SwiftMessages.show(view: view)
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
            lCountry.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || self.animalSelectionArray.count == 0 {
            return "Please fill in all fields."
        }
        if userpassword.text != usercnfpassword.text {
            return "Passwords don't Match"
        }
        return nil
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



