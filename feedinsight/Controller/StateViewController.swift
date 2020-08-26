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

class StateViewController: UIViewController, UITextFieldDelegate {
    let defaults = UserDefaults.standard
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var woolHairLabel: UILabel!
    @IBOutlet weak var proimage: UIImageView!
    @IBOutlet weak var notificationimage: UIImageView!
    @IBOutlet weak var PsychField: DropDown!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var animalField: UITextField!
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
        DispatchQueue.main.async { [weak self] in
            let data = self?.defaults.value(forKey: "imageData") as? Data
            if(data != nil) {
                self?.proimage.image = UIImage(data: data!)
            }
        }
        if hdLabel != "" {
            headLabel.text = hdLabel
        } else {
            headLabel.text = name
        }
    }
    override func viewDidLoad() {
        nameField.text = groupcompany
        animalField.text = nameanimal
        PsychField.text = statepsychlogical
        CurrentBodyWeightF.text = bodycurrentweigth
        TargetBodyWeightF.text = bodytargetweight
        daystoAchiveF.text = achievedays
        daysinMilkF.text = milkindays
        daysPregnantF.text = pregnantdays
        milkInProducitonF.text = productionmilk
        if (name == "Deer" || name == "Sheep/Goat") {
            producitonOutlet.isHidden = false
            woolHairLabel.isHidden = false
        }
        else {
            producitonOutlet.isHidden = true
            woolHairLabel.isHidden = true
        }
        if (dietbole == true) {
            dietOutlet.setBackgroundImage(toggleYes, for: UIControl.State.normal)
        }
        else {
            dietOutlet.setBackgroundImage(toggleNo, for: UIControl.State.normal)
        }
        if (productionbole == true) {
            producitonOutlet.setBackgroundImage(toggleYes, for: UIControl.State.normal)
        }
        else {
            producitonOutlet.setBackgroundImage(toggleNo, for: UIControl.State.normal)
        }
        if (disorderbole == true) {
            disorderOutlet.setBackgroundImage(toggleYes, for: UIControl.State.normal)
        }
        else {
            disorderOutlet.setBackgroundImage(toggleNo, for: UIControl.State.normal)
        }
        if (heatbole == true) {
            heatStreesOutlet.setBackgroundImage(toggleYes, for: UIControl.State.normal)
        }
        else {
            heatStreesOutlet.setBackgroundImage(toggleNo, for: UIControl.State.normal)
        }
        if let busines = defaults.value(forKey: "userbussinessStringKey"){
            
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
        PsychField.optionIds = [1,23,54,22]
        PsychField.didSelect{(selectedText , index ,id) in
        }
    }
    @IBAction func backBtnTap(_ sender: UIButton) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    @IBAction func nextTapped(_ sender: UIButton) {
        let requirments = Requirments()
        requirments.setStateValue(companyName: nameField.text!, animalGroup: animalField.text!, physiologicalState: PsychField.text!, currentBodyWeight: CurrentBodyWeightF.text!, targetBodyWeight: TargetBodyWeightF.text!, achieveTargerWeight: daystoAchiveF.text!, daysInMilk: daysinMilkF.text!, daysPregnant: daysPregnantF.text!, milkProduction: milkInProducitonF.text! , animalKind: name , heatStress: heatbole , metaBolic: disorderbole ,  anionic : dietbole , woolProduction : productionbole)
        let vc = storyboard?.instantiateViewController(withIdentifier: "feedthreeViewController") as? feedthreeViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    func showError(_ message:String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func saveProfileTapped(_ sender: UIButton) {
        let psychEnter = PsychField.text!
        self.saveText(theText: psychEnter)
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
    func saveText(theText: String) {
        SVProgressHUD.show(withStatus: "it's working ...")
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
        let dict : [String : Any] = ["psychologicalState" : theText, "companyName" : companynameEnter, "animalGroup" : combinedString, "CurrentBodyWeight" : CurrentBodyWeightEnter, "TargetBodyWeight" : TargetBodyWeightEnter, "daystoAchive" : daystoAchiveEnter, "milkInProduciton" : milkInProducitonEnter, "daysinMilk" : daysinMilkEnter, "daysPregnant" : daysPregnantEnter, "userID" : userID ?? 1, "categorySelected" : categoryEnter , "disorderbole" : disorderbole,"dietbole": dietbole , "productionbole" : productionbole, "heatbole" : heatbole, "currentdate" : datetimestamp]
        let db = Firestore.firestore()
        db.collection("animalState").document(userID!).collection("animalState").addDocument(data: dict){ err in
            if let err = err {
                SVProgressHUD.dismiss()
                print("Error adding document: \(err)")
            } else {
                SVProgressHUD.dismiss()
                print("Document added")
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
