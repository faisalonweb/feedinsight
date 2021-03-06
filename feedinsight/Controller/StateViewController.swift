//
//  StateViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 22/04/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import iOSDropDown
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import SVProgressHUD
import SwiftMessages



class StateViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    let defaults = UserDefaults(suiteName:"User")
    
    @IBOutlet weak var proimage: UIImageView!
    @IBOutlet weak var notificationimage: UIImageView!
    @IBOutlet weak var PsychField: DropDown!
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var woolHairLabel: UILabel!
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var animalField: UITextField!
    var stateStatus : Bool = false
    var documentId : String = ""
    var ReportName :  String = ""
    
    
    @IBOutlet weak var CurrentBodyWeightF: UITextField!{
        didSet { CurrentBodyWeightF?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var TargetBodyWeightF: UITextField!{
        didSet { TargetBodyWeightF?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var daystoAchiveF: UITextField!{
        didSet { daystoAchiveF?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var milkInProducitonF: UITextField!{
        didSet { milkInProducitonF?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var daysinMilkF: UITextField!{
        didSet { daysinMilkF?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var daysPregnantF: UITextField! {
        didSet { daysPregnantF?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var heatStreesOutlet: UIButton!
    @IBOutlet weak var dietOutlet: UIButton!
    @IBOutlet weak var producitonOutlet: UIButton!
    @IBOutlet weak var disorderOutlet: UIButton!
    var db: Firestore!
    var detail: String?
    var name = ""
    var disorderbole = false
    var productionbole = false
    var dietbole = false
    var heatbole = false
    var toggleState = 1
    let toggleNo = UIImage(named:"Toggle-no")
    let toggleYes = UIImage(named:"toggle-Yes")
    var nameanimal = ""
    var groupcompany = ""
    var statepsychlogical = ""
    var bodycurrentweigth = ""
    var bodytargetweight = ""
    var achievedays = ""
    var milkindays = ""
    var pregnantdays = ""
    var productionmilk = ""
    var hdLabel = ""
    var diettoggle : Bool!
    var disordertoggle : Bool!
    var heattoggle : Bool!
    var productiontoggle : Bool!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let userName = defaults!.value(forKey: "usernameStringKey"){
            self.userNameLabel.text = userName as? String
            print(userName)
        }
        DispatchQueue.global().async { [weak self] in
            DispatchQueue.main.async {
                let data = self?.defaults!.value(forKey: "imageData") as? Data
                if(data != nil) {
                    self?.proimage.image = UIImage(data: data!)
                }
            }
        }
        
        if hdLabel != "" {
            headLabel.text = hdLabel
        } else {
            headLabel.text = name
        }
    }
    func setBorderRed(_ textField : UITextField) {
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 5
        textField.clipsToBounds = true
    }
    func setBorderDarkGray(_ textField : UITextField) {
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 5
        textField.clipsToBounds = true
    }

    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        let popGestureRecognizer = self.navigationController!.interactivePopGestureRecognizer!
        if let targets = popGestureRecognizer.value(forKey: "targets") as? NSMutableArray {
          let gestureRecognizer = UIPanGestureRecognizer()
          gestureRecognizer.setValue(targets, forKey: "targets")
          self.view.addGestureRecognizer(gestureRecognizer)
        }
        let tapOnImage = UITapGestureRecognizer.init(target: self, action: #selector(tapOnImageAction))
        self.proimage.addGestureRecognizer(tapOnImage)
        self.proimage.isUserInteractionEnabled = true
       
        self.dismissKey()
        nameField.text = groupcompany
        animalField.text = nameanimal
        PsychField.text = statepsychlogical
        CurrentBodyWeightF.text = bodycurrentweigth
        TargetBodyWeightF.text = bodytargetweight
        daystoAchiveF.text = achievedays
        daysinMilkF.text = milkindays
        daysPregnantF.text = pregnantdays
        milkInProducitonF.text = productionmilk
        setBorderDarkGray(nameField)
        setBorderDarkGray(animalField)
        setBorderDarkGray(PsychField)
        setBorderDarkGray(CurrentBodyWeightF)
        setBorderDarkGray(TargetBodyWeightF)
        setBorderDarkGray(daystoAchiveF)
        setBorderDarkGray(daysinMilkF)
        setBorderDarkGray(milkInProducitonF)
        setBorderDarkGray(daysPregnantF)
        
        if (name == "Deer" || name == "Sheep/Goat") {
            producitonOutlet.isHidden = false
            woolHairLabel.isHidden = false
        } else {
            producitonOutlet.isHidden = true
            woolHairLabel.isHidden = true
        }
        if (dietbole == true) {
            dietOutlet.setBackgroundImage(toggleYes, for: UIControl.State.normal)
        } else {
            dietOutlet.setBackgroundImage(toggleNo, for: UIControl.State.normal)
        }
        if (productionbole == true) {
            producitonOutlet.setBackgroundImage(toggleYes, for: UIControl.State.normal)
        } else {
            producitonOutlet.setBackgroundImage(toggleNo, for: UIControl.State.normal)
        }
        if (disorderbole == true) {
            disorderOutlet.setBackgroundImage(toggleYes, for: UIControl.State.normal)
        } else {
            disorderOutlet.setBackgroundImage(toggleNo, for: UIControl.State.normal)
        }
        if (heatbole == true) {
            heatStreesOutlet.setBackgroundImage(toggleYes, for: UIControl.State.normal)
        } else {
            heatStreesOutlet.setBackgroundImage(toggleNo, for: UIControl.State.normal)
        }
        if let busines = defaults!.value(forKey: "userbussinessStringKey"){
            self.nameField.text = busines as? String
            print(busines)
        }
        print("diet name is \(diettoggle ?? false)")
        print("animal name is \(nameanimal)")
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = false
        heatStreesOutlet.setImage(toggleYes, for: .normal)
        heatStreesOutlet.setImage(toggleNo, for: .selected)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        print("tishahaha", name)
        self.headLabel.text = name
        self.nameField.delegate = self
        self.animalField.delegate = self
        db = Firestore.firestore()
        notificationimage?.layer.cornerRadius = (notificationimage?.frame.size.width ?? 0.0) / 2
        notificationimage?.clipsToBounds = true
        notificationimage?.layer.borderWidth = 3.0
        notificationimage?.layer.borderColor = UIColor.white.cgColor
        proimage?.layer.cornerRadius = (proimage?.frame.size.width ?? 0.0) / 2
        proimage?.clipsToBounds = true
        proimage?.layer.borderWidth = 3.0
        proimage?.layer.borderColor = UIColor.white.cgColor
        PsychField.optionArray = ["Lactating", "Growing", "Dry-Gestating"]
        PsychField.optionIds = [20,13,24,36]
        PsychField.listWillAppear {
            self.view.endEditing(true)
        }
        PsychField.didSelect{(selectedText , index ,id) in
            print("Selected String: \(selectedText) \n index: \(index)")
        }
        PsychField.rowHeight = 40
        PsychField.selectedRowColor = UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1.0)
        PsychField.isSearchEnable = false
    }
    @objc func tapOnImageAction() {
        self.tabBarController?.selectedIndex = 2
    }
    @IBAction func backBtnTap(_ sender: UIButton) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    @IBAction func nextTapped(_ sender: UIButton) {
        if ((nameField.text?.isEmpty != true) && (animalField.text?.isEmpty != true) && (PsychField.text?.isEmpty != true) && (CurrentBodyWeightF.text?.isEmpty != true) && (TargetBodyWeightF.text?.isEmpty != true) && (daystoAchiveF.text?.isEmpty != true) && (daysinMilkF.text?.isEmpty != true) && (daysPregnantF.text?.isEmpty != true) && (milkInProducitonF.text?.isEmpty != true)) {

            Requirments.shared().animalKind = self.headLabel.text!
            Requirments.shared().setStateValue(companyName: nameField.text!, animalGroup: animalField.text!, physiologicalState: PsychField.text!, currentBodyWeight: CurrentBodyWeightF.text!, targetBodyWeight: TargetBodyWeightF.text!, achieveTargerWeight: daystoAchiveF.text!, daysInMilk: daysinMilkF.text!, daysPregnant: daysPregnantF.text!, milkProduction: milkInProducitonF.text! , animalKind: self.headLabel.text! , heatStress: heatbole , metaBolic: disorderbole ,  anionic : dietbole , woolProduction : productionbole)
            let vc = storyboard?.instantiateViewController(withIdentifier: "feedthreeViewController") as? feedthreeViewController
            vc?.fromStateVC = true
            self.navigationController?.pushViewController(vc!, animated: true)
        }else{
            let view = MessageView.viewFromNib(layout: .cardView)
            view.configureTheme(.error)
            view.configureDropShadow()
            view.configureContent(title: "Error", body: "Fill all fields")
            SwiftMessages.show(view: view)
        }
    }
    func showError(_ message:String) {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(.error)
        view.configureDropShadow()
        view.configureContent(title: "Error", body: message)
        SwiftMessages.show(view: view)
    }
   


    @IBAction func saveProfileTapped(_ sender: UIButton) {
        let reachability = try! Reachability.init()
        if((reachability.connection) != .unavailable) {
            let psychEnter = PsychField.text!
            self.showAlertWithThreeButton(theText: psychEnter)
        } else {
            let view = MessageView.viewFromNib(layout: .cardView)
            view.configureTheme(.error)
            view.configureDropShadow()
            view.configureContent(title: "Error", body: "check your internet connection")
            SwiftMessages.show(view: view)
        }
    }
    @IBAction func loadProfileTapped(_ sender: UIButton) {
        // weeks of gestation
        let weekofgestationval = Int(daysPregnantF.text ?? "") ?? 0
        let weekofgestation = weekofgestationval / 7
        print("weeks of gestation : \(weekofgestation)")
        // gestation progress
        let value = animalField.text
        switch value {
        case "Goat" :
            let mid = weekofgestation / 10
            let final = mid * 100
            print("goat gestation progress result : \(final)")
        case "Cow" :
            let mid = weekofgestation/5
            let final = mid * 100
            print("cow gestation progress result : \(final)")
        case "Fish" :
            let mid = weekofgestation/8
            let final = mid * 100
            print("fish gestation progress result : \(final)")
        default:
            print("animal group not found")
        }
        // weeks before calving
        let valueone = animalField.text
        switch valueone {
        case "Goat" :
            let result = 10 - weekofgestation
            print("goat weeks before calving result : \(result)")
        case "Cow" :
            let result = 20 - weekofgestation
            print("cow weeks before calving result : \(result)")
        case "Fish" :
            let result = 30 - weekofgestation
            print("fish before calving result : \(result)")
        default:
            print("animal group not found")
        }
        let vc = storyboard?.instantiateViewController(withIdentifier: "loadProfileAnimalsViewController") as? loadProfileAnimalsViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    @IBAction func productionToggleTap(_ sender: UIButton) {
        
        if (productionbole == false) {
            producitonOutlet.setBackgroundImage(toggleYes, for: UIControl.State.normal)
            productionbole = true
        }
        else {
            productionbole = false
            producitonOutlet.setBackgroundImage(toggleNo, for: UIControl.State.normal)
        }
    }
    
    @IBAction func dietToggleTap(_ sender: UIButton) {
        if (dietbole == false) {
            dietOutlet.setBackgroundImage(toggleYes, for: UIControl.State.normal)
            dietbole = true
        }
        else {
            dietbole = false
            dietOutlet.setBackgroundImage(toggleNo, for: UIControl.State.normal)
        }
    }
    @IBAction func disorderToggleTap(_ sender: UIButton) {
        
        if (disorderbole == false) {
            disorderOutlet.setBackgroundImage(toggleYes, for: UIControl.State.normal)
            disorderbole = true
        }
        else {
            disorderbole = false
            disorderOutlet.setBackgroundImage(toggleNo, for: UIControl.State.normal)
        }
    }
    @IBAction func heatStressToggleTap(_ sender: UIButton) {
        if (heatbole == false) {
            heatStreesOutlet.setBackgroundImage(toggleYes, for: UIControl.State.normal)
            heatbole = true
        }
        else {
            heatbole = false
            heatStreesOutlet.setBackgroundImage(toggleNo, for: UIControl.State.normal)
        }
    }
    func showAlertWithThreeButton(theText: String) {
        self.defaults!.set(theText, forKey: "psycholo")
        self.defaults!.set(self.animalField.text!, forKey: "rumigroup")
        self.defaults!.set(self.nameField.text!, forKey: "companyname")
        self.defaults!.synchronize()
        if ((nameField.text?.isEmpty != true) && (animalField.text?.isEmpty != true) && (PsychField.text?.isEmpty != true) && (CurrentBodyWeightF.text?.isEmpty != true) && (TargetBodyWeightF.text?.isEmpty != true) && (daystoAchiveF.text?.isEmpty != true) && (daysinMilkF.text?.isEmpty != true) && (daysPregnantF.text?.isEmpty != true) && (milkInProducitonF.text?.isEmpty != true)) {
            
            if (stateStatus == true)
            {
                let alert = UIAlertController(title: "Animal Profile", message: "", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Save as New", style: .default, handler: { (_) in
                    SVProgressHUD.show(withStatus: "it's working ...")
                    self.view.isUserInteractionEnabled = false
                    let currentDateTime = Date()
                    let formatter = DateFormatter()
                    formatter.timeStyle = .medium
                    formatter.dateStyle = .long
                    let datetimestamp = formatter.string(from: currentDateTime)
                    let daysPregnantEnter = self.daysPregnantF.text!
                    let daysinMilkEnter = self.daysinMilkF.text!
                    let milkInProducitonEnter = self.milkInProducitonF.text!
                    let daystoAchiveEnter = self.daystoAchiveF.text!
                    let TargetBodyWeightEnter = self.TargetBodyWeightF.text!
                    let CurrentBodyWeightEnter = self.CurrentBodyWeightF.text!
                    let companynameEnter = self.nameField.text!
                    let userID = Auth.auth().currentUser?.uid
                    let categoryEnter = self.headLabel.text!
                    let combinedString = "\(self.headLabel.text!)-\(self.PsychField.text!)-\(self.animalField.text!)"
                    //        let dict : [String : Any] = ["psychologicalState" : theText, "companyName" : companynameEnter, "animalGroup" : animalField.text!, "CurrentBodyWeight" : CurrentBodyWeightEnter, "TargetBodyWeight" : TargetBodyWeightEnter, "daystoAchive" : daystoAchiveEnter, "milkInProduciton" : milkInProducitonEnter, "daysinMilk" : daysinMilkEnter, "daysPregnant" : daysPregnantEnter, "userID" : userID ?? 1, "categorySelected" : categoryEnter , "disorderbole" : disorderbole,"dietbole": dietbole , "productionbole" : productionbole, "heatbole" : heatbole, "currentdate" : datetimestamp, "reportName" : combinedString]
                    let db = Firestore.firestore()
                    let newDocument = db.collection("animalState").document(userID!).collection("animalState").document()
                    newDocument.setData(["psychologicalState" : theText, "companyName" : companynameEnter, "animalGroup" : self.animalField.text!, "CurrentBodyWeight" : CurrentBodyWeightEnter, "TargetBodyWeight" : TargetBodyWeightEnter, "daystoAchive" : daystoAchiveEnter, "milkInProduciton" : milkInProducitonEnter, "daysinMilk" : daysinMilkEnter, "daysPregnant" : daysPregnantEnter, "userID" : userID ?? 1, "categorySelected" : categoryEnter , "disorderbole" : self.disorderbole,"dietbole": self.dietbole , "productionbole" : self.productionbole, "heatbole" : self.heatbole, "currentdate" : datetimestamp, "reportName" : combinedString , "DocId" : newDocument.documentID]){ err in
                        if let err = err {
                            SVProgressHUD.showError(withStatus: "Error")
                            print("Error adding document: \(err)")
                            SVProgressHUD.dismiss()
                            self.view.isUserInteractionEnabled = true
                        } else {
                            SVProgressHUD.showSuccess(withStatus: "Success")
                            print("Document added")
                            SVProgressHUD.dismiss()
                            self.view.isUserInteractionEnabled = true
                        }
                    }
                }))
                
                alert.addAction(UIAlertAction(title: "Save as Previous", style: .default, handler: { (_) in
                    SVProgressHUD.show(withStatus: "it's working ...")
                    self.view.isUserInteractionEnabled = false
                    let currentDateTime = Date()
                    let formatter = DateFormatter()
                    formatter.timeStyle = .medium
                    formatter.dateStyle = .long
                    let datetimestamp = formatter.string(from: currentDateTime)
                    let daysPregnantEnter = self.daysPregnantF.text!
                    let daysinMilkEnter = self.daysinMilkF.text!
                    let milkInProducitonEnter = self.milkInProducitonF.text!
                    let daystoAchiveEnter = self.daystoAchiveF.text!
                    let TargetBodyWeightEnter = self.TargetBodyWeightF.text!
                    let CurrentBodyWeightEnter = self.CurrentBodyWeightF.text!
                    let companynameEnter = self.nameField.text!
                    let userID = Auth.auth().currentUser?.uid
                    let categoryEnter = self.headLabel.text!
                    let combinedString = "\(self.headLabel.text!)-\(self.PsychField.text!)-\(self.animalField.text!)"
                    //        let dict : [String : Any] = ["psychologicalState" : theText, "companyName" : companynameEnter, "animalGroup" : animalField.text!, "CurrentBodyWeight" : CurrentBodyWeightEnter, "TargetBodyWeight" : TargetBodyWeightEnter, "daystoAchive" : daystoAchiveEnter, "milkInProduciton" : milkInProducitonEnter, "daysinMilk" : daysinMilkEnter, "daysPregnant" : daysPregnantEnter, "userID" : userID ?? 1, "categorySelected" : categoryEnter , "disorderbole" : disorderbole,"dietbole": dietbole , "productionbole" : productionbole, "heatbole" : heatbole, "currentdate" : datetimestamp, "reportName" : combinedString]
                    let db = Firestore.firestore()
                    let newDocument = db.collection("animalState").document(userID!).collection("animalState").document(self.documentId)
                    newDocument.setData(["psychologicalState" : theText, "companyName" : companynameEnter, "animalGroup" : self.animalField.text!, "CurrentBodyWeight" : CurrentBodyWeightEnter, "TargetBodyWeight" : TargetBodyWeightEnter, "daystoAchive" : daystoAchiveEnter, "milkInProduciton" : milkInProducitonEnter, "daysinMilk" : daysinMilkEnter, "daysPregnant" : daysPregnantEnter, "userID" : userID ?? 1, "categorySelected" : categoryEnter , "disorderbole" : self.disorderbole,"dietbole": self.dietbole , "productionbole" : self.productionbole, "heatbole" : self.heatbole, "currentdate" : datetimestamp, "reportName" : combinedString , "DocId" : newDocument.documentID]){ err in
                        if let err = err {
                            SVProgressHUD.showError(withStatus: "Error")
                            
                            print("Error adding document: \(err)")
                            SVProgressHUD.dismiss()
                            self.view.isUserInteractionEnabled = true
                        } else {
                            
                    
                            SVProgressHUD.showSuccess(withStatus: "Sucess")
                            
                            print("Document added")
                            SVProgressHUD.dismiss()
                            self.view.isUserInteractionEnabled = true
                        }
                    }
                }))
                
                alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { (_) in
                    print("You've pressed the destructive")
                }))
                self.present(alert, animated: true, completion: nil)
            }
            else {
                SVProgressHUD.show(withStatus: "it's working ...")
                self.view.isUserInteractionEnabled = false
                let currentDateTime = Date()
                let formatter = DateFormatter()
                formatter.timeStyle = .medium
                formatter.dateStyle = .long
                let datetimestamp = formatter.string(from: currentDateTime)
                let daysPregnantEnter = daysPregnantF.text!
                let daysinMilkEnter = daysinMilkF.text!
                let milkInProducitonEnter = milkInProducitonF.text!
                let daystoAchiveEnter = daystoAchiveF.text!
                let TargetBodyWeightEnter = TargetBodyWeightF.text!
                let CurrentBodyWeightEnter = CurrentBodyWeightF.text!
                let companynameEnter = nameField.text!
                let userID = Auth.auth().currentUser?.uid
                let categoryEnter = headLabel.text!
                let combinedString = "\(headLabel.text!)-\(PsychField.text!)-\(animalField.text!)"
                //        let dict : [String : Any] = ["psychologicalState" : theText, "companyName" : companynameEnter, "animalGroup" : animalField.text!, "CurrentBodyWeight" : CurrentBodyWeightEnter, "TargetBodyWeight" : TargetBodyWeightEnter, "daystoAchive" : daystoAchiveEnter, "milkInProduciton" : milkInProducitonEnter, "daysinMilk" : daysinMilkEnter, "daysPregnant" : daysPregnantEnter, "userID" : userID ?? 1, "categorySelected" : categoryEnter , "disorderbole" : disorderbole,"dietbole": dietbole , "productionbole" : productionbole, "heatbole" : heatbole, "currentdate" : datetimestamp, "reportName" : combinedString]
                let db = Firestore.firestore()
                let newDocument = db.collection("animalState").document(userID!).collection("animalState").document()
                newDocument.setData(["psychologicalState" : theText, "companyName" : companynameEnter, "animalGroup" : animalField.text!, "CurrentBodyWeight" : CurrentBodyWeightEnter, "TargetBodyWeight" : TargetBodyWeightEnter, "daystoAchive" : daystoAchiveEnter, "milkInProduciton" : milkInProducitonEnter, "daysinMilk" : daysinMilkEnter, "daysPregnant" : daysPregnantEnter, "userID" : userID ?? 1, "categorySelected" : categoryEnter , "disorderbole" : disorderbole,"dietbole": dietbole , "productionbole" : productionbole, "heatbole" : heatbole, "currentdate" : datetimestamp, "reportName" : combinedString , "DocId" : newDocument.documentID]){ err in
                    if let err = err {
                        SVProgressHUD.showError(withStatus: "Error")
                        
                        print("Error adding document: \(err)")
                        SVProgressHUD.dismiss()
                        self.view.isUserInteractionEnabled = true
                    } else {
                        
                        
                        SVProgressHUD.showSuccess(withStatus: "Sucess")
                        
                        print("Document added")
                        SVProgressHUD.dismiss()
                        self.view.isUserInteractionEnabled = true
                    }
                }
            }
            
        }
        else {
            let view = MessageView.viewFromNib(layout: .cardView)
            view.configureTheme(.error)
            view.configureDropShadow()
            view.configureContent(title: "Error", body: "Fill all fields")
            SwiftMessages.show(view: view)
        }
     
        
    }
    func saveText(theText: String) {
        SVProgressHUD.show(withStatus: "it's working ...")
        self.view.isUserInteractionEnabled = false
//        self.tabBarController!.tabBar.items![0].isEnabled = false
//        self.tabBarController!.tabBar.items![1].isEnabled = false
//        self.tabBarController!.tabBar.items![2].isEnabled = false
//        UIApplication.shared.beginIgnoringInteractionEvents()
        self.tabBarController?.tabBar.isUserInteractionEnabled = false
        
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        let datetimestamp = formatter.string(from: currentDateTime)
        let daysPregnantEnter = daysPregnantF.text!
        let daysinMilkEnter = daysinMilkF.text!
        let milkInProducitonEnter = milkInProducitonF.text!
        let daystoAchiveEnter = daystoAchiveF.text!
        let TargetBodyWeightEnter = TargetBodyWeightF.text!
        let CurrentBodyWeightEnter = CurrentBodyWeightF.text!
        let companynameEnter = nameField.text!
        let userID = Auth.auth().currentUser?.uid
        let categoryEnter = headLabel.text!
        let combinedString = "\(headLabel.text!)-\(PsychField.text!)-\(animalField.text!)"
        //        let dict : [String : Any] = ["psychologicalState" : theText, "companyName" : companynameEnter, "animalGroup" : animalField.text!, "CurrentBodyWeight" : CurrentBodyWeightEnter, "TargetBodyWeight" : TargetBodyWeightEnter, "daystoAchive" : daystoAchiveEnter, "milkInProduciton" : milkInProducitonEnter, "daysinMilk" : daysinMilkEnter, "daysPregnant" : daysPregnantEnter, "userID" : userID ?? 1, "categorySelected" : categoryEnter , "disorderbole" : disorderbole,"dietbole": dietbole , "productionbole" : productionbole, "heatbole" : heatbole, "currentdate" : datetimestamp, "reportName" : combinedString]
        let db = Firestore.firestore()
        let newDocument = db.collection("animalState").document(userID!).collection("animalState").document()
        newDocument.setData(["psychologicalState" : theText, "companyName" : companynameEnter, "animalGroup" : animalField.text!, "CurrentBodyWeight" : CurrentBodyWeightEnter, "TargetBodyWeight" : TargetBodyWeightEnter, "daystoAchive" : daystoAchiveEnter, "milkInProduciton" : milkInProducitonEnter, "daysinMilk" : daysinMilkEnter, "daysPregnant" : daysPregnantEnter, "userID" : userID ?? 1, "categorySelected" : categoryEnter , "disorderbole" : disorderbole,"dietbole": dietbole , "productionbole" : productionbole, "heatbole" : heatbole, "currentdate" : datetimestamp, "reportName" : combinedString , "DocId" : newDocument.documentID]){ err in
            if let err = err {
                SVProgressHUD.showError(withStatus: "Error")
                
                print("Error adding document: \(err)")
                SVProgressHUD.dismiss()
                self.view.isUserInteractionEnabled = true
            } else {
                SVProgressHUD.showSuccess(withStatus: "Success")
                
                print("Document added")
                SVProgressHUD.dismiss()
                self.view.isUserInteractionEnabled = true
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
extension UITextField {
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil, onCancel: (target: Any, action: Selector)? = nil) {
        let onCancel = onCancel ?? (target: self, action: #selector(cancelButtonTapped))
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))
        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(title: "Cancel", style: .plain, target: onCancel.target, action: onCancel.action),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
        ]
        toolbar.sizeToFit()
        self.inputAccessoryView = toolbar
    }
    // Default actions:
    @objc func doneButtonTapped() { self.resignFirstResponder() }
    @objc func cancelButtonTapped() { self.resignFirstResponder() }
}

extension UIViewController {
    func dismissKey()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
