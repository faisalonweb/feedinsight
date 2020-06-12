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



class StateViewController: UIViewController, UITextFieldDelegate {
    
//    @IBOutlet weak var heatStressToggle: UIImageView!
    @IBOutlet weak var headLabel: UILabel!
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
//   let mainVC = UITabBarController()
//   let searchVC = AnimalSelectionViewController()
//   let profileVC = ProfileLoadViewController()
    
    override func viewWillAppear(_ animated: Bool) { // As soon as vc appears
        super.viewWillAppear(true)
//        self.tabBarController?.tabBar.isHidden = false
//         let tabBarController = UITabBarController()
//            tabBarController.viewControllers = [mainVC, searchVC, profileVC]
//        tabBarController.selectedIndex = 2
//        tabBarController.viewControllers = controllers
    }
    override func viewDidLoad() {
     
       
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = false
        heatStreesOutlet.setImage(toggleYes, for: .normal)
        heatStreesOutlet.setImage(toggleNo, for: .selected)
        //
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
                    self.navigationController?.navigationBar.shadowImage = UIImage()
                      let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
                            navigationItem.leftBarButtonItem = backButton
        
        //
        print("tishahaha", name)
        self.headLabel.text = name
        if(self.headLabel.text == "")
        {
            self.headLabel.text = "Premix Check"
        }
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
        
        PsychField.optionArray = ["COW", "GOAT", "FISH"]
        //Its Id Values and its optional
        PsychField.optionIds = [1,23,54,22]
        PsychField.didSelect{(selectedText , index ,id) in
        }
        
    }
    @IBAction func backBtnTap(_ sender: UIButton) {
        //
        if let stack = self.navigationController?.viewControllers {
          for vc in stack where vc.isKind(of: StateViewController.self) {
            print("exists")
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
                          }
          }
        }
        else
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "profileLoadID") as! ProfileLoadViewController
           self.present(vc, animated: true, completion: nil)
            print("does not exists")
        }
        
        //
//        if let navController = self.navigationController {
//                   navController.popViewController(animated: true)
//               }
    }
    @IBAction func nextTapped(_ sender: UIButton) {
        
        db.collection("premixReport").getDocuments { (snapshot, error) in
            if error == nil && snapshot != nil{

                for document in snapshot!.documents {

                    let documentData = document.data()
                    print(documentData)
                }
            }
            else {

            }
        }
//        db.collection("wine").whereField("animalGroup", isEqualTo: "Fish").getDocuments { (snapshot, error) in
//            if error == nil {
//                 for document in snapshot!.documents {
//
//                                    let documentData = document.data()
//                                    print(documentData)
//                                }
//            }
//            else {
//
//            }
//               }
    }
    
    @IBAction func saveProfileTapped(_ sender: UIButton) {
        let psychEnter = PsychField.text!
               self.saveText(theText: psychEnter)
    }
    
    @IBAction func loadProfileTapped(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "profileLoadID") as? ProfileLoadViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func productionToggleTap(_ sender: UIButton) {
//        if producitonOutlet.currentBackgroundImage == UIImage(named:"Toggle-no")
//        {
//            producitonOutlet.setBackgroundImage(UIImage(named:"toggle-Yes"), for: .normal)
//
//        }
//        else {
//            producitonOutlet.setBackgroundImage(UIImage(named:"Toggle-no"), for: .normal)
//        }
        
        producitonOutlet.isSelected = !producitonOutlet.isSelected
                     if producitonOutlet.isSelected {
                         print("I am selected.")
                         producitonOutlet.setImage(toggleNo, for: .selected)
                         productionbole = true
                     }
                     else {
                         print("I am not selected.")
                         producitonOutlet.setImage(toggleYes, for: .normal)
                        productionbole = false
                     }


    }
   
    @IBAction func dietToggleTap(_ sender: UIButton) {
        dietOutlet.isSelected = !dietOutlet.isSelected
               if dietOutlet.isSelected {
                   print("I am selected.")
                   dietOutlet.setImage(toggleNo, for: .selected)
                   dietbole = true
               }
               else {
                   print("I am not selected.")
                   dietOutlet.setImage(toggleYes, for: .normal)
                   dietbole = false
               }

    }
    @IBAction func disorderToggleTap(_ sender: UIButton) {
        disorderOutlet.isSelected = !disorderOutlet.isSelected
               if disorderOutlet.isSelected {
                   print("I am selected.")
                   disorderOutlet.setImage(toggleNo, for: .selected)
                   disorderbole = true
                
                   
               }
               else {
                   print("I am not selected.")
                   disorderOutlet.setImage(toggleYes, for: .normal)
                    disorderbole = false
               }
    }
    @IBAction func heatStressToggleTap(_ sender: UIButton) {
        heatStreesOutlet.isSelected = !heatStreesOutlet.isSelected
        if heatStreesOutlet.isSelected {
            print("I am selected.")
            heatStreesOutlet.setImage(toggleNo, for: .selected)
            heatbole = true
        }
        else {
            print("I am not selected.")
            heatStreesOutlet.setImage(toggleYes, for: .normal)
            heatbole = false
        }
        
    }
    
    
    func saveText(theText: String) {
         let currentDateTime = Date()
                let userCalendar = Calendar.current
                let requestedComponents: Set<Calendar.Component> = [
                    .year,
                    .month,
                    .day,
                    .hour,
                    .minute,
                    .second
                ]
        let dateTimeComponents = userCalendar.dateComponents(requestedComponents, from: currentDateTime)
               let year =  dateTimeComponents.year!   // 2016
               let month =  dateTimeComponents.month!  // 10
              let day =   dateTimeComponents.day!
                print("its", year)
                 print("its", month)
                 print("its", day)
                 print("its", currentDateTime)
        
                                        let currentDate = currentDateTime
                                      let daysPregnantEnter = daysPregnantF.text!
                                     let daysinMilkEnter = daysinMilkF.text!
                                     let milkInProducitonEnter = milkInProducitonF.text!
                                     let daystoAchiveEnter = daystoAchiveF.text!
                                     let TargetBodyWeightEnter = TargetBodyWeightF.text!
                                     let CurrentBodyWeightEnter = CurrentBodyWeightF.text!
                                     let animalEnter = animalField.text!
                                     let companynameEnter = nameField.text!
                                     let userID = Auth.auth().currentUser?.uid
                                     let categoryEnter = headLabel.text!
                                    
                      //
        let dict : [String : Any] = ["psychologicalState" : theText, "companyName" : companynameEnter, "animalGroup" : animalEnter, "CurrentBodyWeight" : CurrentBodyWeightEnter, "TargetBodyWeight" : TargetBodyWeightEnter, "daystoAchive" : daystoAchiveEnter, "milkInProduciton" : milkInProducitonEnter, "daysinMilk" : daysinMilkEnter, "daysPregnant" : daysPregnantEnter, "userID" : userID ?? 1, "categorySelected" : categoryEnter , "disorderbole" : disorderbole,"dietbole": dietbole , "productionbole" : productionbole, "heatbole" : heatbole, "currentdate" : currentDate]

                      //
                        let db = Firestore.firestore()
                        db.collection("premixReport").addDocument(data: dict){ err in
                                          if let err = err {
                                              print("Error adding document: \(err)")
                                          } else {
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
