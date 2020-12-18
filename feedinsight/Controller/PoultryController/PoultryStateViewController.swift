//
//  PoultryStateViewController.swift
//  FeedInsight
//
//  Created by Hamza Iqbal on 17/12/2020.
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

class PoultryStateViewController: UIViewController, UIGestureRecognizerDelegate {
    let defaults = UserDefaults(suiteName:"User")
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var proimage: UIImageView!
    @IBOutlet weak var notificationimage: UIImageView!
    @IBOutlet weak var typeField: DropDown!
    @IBOutlet weak var strainField: DropDown!
    @IBOutlet weak var PsychField: DropDown!
    @IBOutlet weak var companyName: UITextField!
    let typeArray = ["Broiler", "Broiler Breeder", "Layer", "Layer Breeder"]
    let broiler_breeder_TypeArray = ["Ross", "Cobb", "Hubbard", "Other"]
    let layer_breeder_TypeArray = ["Bovan", "NickChick", "LSL", "Hyline", "Novogen", "Other"]
    let psych1Array = ["Starter", "Grower", "Finisher"]
    let psych2Array = ["Starter/Grower", "Production"]
    
    var broiler_ross: [[Any]] = [
        [12000,5000,80,3.2,3.2,8.6,65,20,4.3,0.22,2.2,0.017,110,120,16,1.25,0.3,0,20],
        [10000,4500,65,3,2.5,6.5,60,18,3.2,0.18,1.9,0.017,110,120,16,1.25,0.3,0,20],
        [9000,4000,55,2.2,2.2,5.4,45,15,2.2,0.15,1.6,0.011,110,120,16,1.25,0.3,0,20]
    ]
    
    var broiler_cobb: [[Any]] = [
        [13000,5000,80,3,3,9,60,15,4,0.15,2,0.02,100,100,15,1,0.35,0,40],
        [10000,5000,50,3,2,8,50,12,3,0.12,2,0.015,100,100,15,1,0.35,0,40],
        [10000,5000,50,3,2,6,50,10,3,0.12,1.5,0.015,100,100,15,1,0.35,0,40]
    ]
    
    var broiler_hubbard: [[Any]] = [
        [15000,3000,75,3,3,8,60,15,4,0.2,1.5,0.02,80,80,10,1,0.2,0,60],
        [12500,2500,70,2,2,6,40,10,3,0.1,1,0.01,80,80,10,1,0.2,0,60],
        [10000,2000,70,2,2,6,40,10,3,0.1,1,0.01,80,80,10,1,0.2,0,60]
    ]
    
    var broiler_other: [[Any]] = [
        [14000,4500,90,3,3.5,8,65,18,4.5,0.2,2,0.025,100,110,15,1.3,0.3,0,65],
        [11000,4200,80,2.8,3,7.5,55,15,3.5,0.15,1.8,0.015,105,105,13,1.4,0.28,0,55],
        [10500,4000,70,2.5,2.5,7,50,12,3,0.12,1.5,0.012,100,100,12,1.2,0.2,0,60]
    ]
    
    var broiler_breeder_ross: [[Any]] = [
        [10000,3500,100,3,3,6,35,15,3,0.15,1.5,0.02,110,120,16,1.25,0.3,0,40],
        [11000,3500,100,5,3,12,55,15,4,0.25,2,0.03,110,120,10,2,0.3,0,50]
    ]
    
    var broiler_breeder_cobb: [[Any]] = [
        [11000,3500,100,3,2.75,8,40,15,3,0.25,2,0.025,100,100,"10-15.0",1.5,0.3,0,"20-50"],
        [13000,3500,100,6,3,13,50,20,6,0.3,3,0.035,110,120,"10-15.0",2,0.3,0,"40-55"]
    ]
    
    var broiler_breeder_hubbard: [[Any]] = [
        [10000,3500,100,3,3,6,35,15,3,0.15,1.5,0.02,105,90,14,1.25,0.3,0,40],
        [13000,3200,75,5,3.5,12,60,16,5,0.25,2.5,0.035,100,100,10,2,0.35,0,60]
    ]
    
    var broiler_breeder_other: [[Double]] = [
        [10500,3500,110,3.5,3,7,35,15,3.5,0.15,2,0.025,105,130,17,1.3,0.35,0,45],
        [12000,3600,110,6,4,15,55,16,7,0.3,3,0.3,100,110,14,2,0.35,0,45]
    ]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        let popGestureRecognizer = self.navigationController!.interactivePopGestureRecognizer!
        if let targets = popGestureRecognizer.value(forKey: "targets") as? NSMutableArray {
          let gestureRecognizer = UIPanGestureRecognizer()
          gestureRecognizer.setValue(targets, forKey: "targets")
          self.view.addGestureRecognizer(gestureRecognizer)
        }
        if let busines = defaults!.value(forKey: "userbussinessStringKey"){
            self.companyName.text = busines as? String
        }
        let tapOnImage = UITapGestureRecognizer.init(target: self, action: #selector(tapOnImageAction))
        self.proimage.addGestureRecognizer(tapOnImage)
        self.proimage.isUserInteractionEnabled = true
        self.dismissKey()
        // First Field
        typeField.optionArray = typeArray
        typeField.optionIds = [20,13,24,36]
        typeField.listWillAppear {
            self.view.endEditing(true)
        }
        typeField.didSelect{(selectedText , index ,id) in
            print("Selected String: \(selectedText) \n index: \(index)")
            self.strainField.text = ""
            self.PsychField.text = ""            
        }
        typeField.rowHeight = 40
        typeField.listHeight = 160
        typeField.selectedRowColor = UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1.0)
        typeField.isSearchEnable = false
        
        // Second Field
        strainField.optionArray = []
        strainField.optionIds = [20,13,24,36,48,60]
        strainField.listWillAppear {
            if(self.typeField.text?.isEmpty != true) {
                if(self.typeField.text! == self.typeArray[0] || self.typeField.text! == self.typeArray[1]) {
                    self.strainField.optionArray = self.broiler_breeder_TypeArray
                    self.strainField.listHeight = 160
                } else {
                    self.strainField.listHeight = 240
                    self.strainField.optionArray = self.layer_breeder_TypeArray
                }
            } else {
                let view = MessageView.viewFromNib(layout: .cardView)
                view.configureTheme(.error)
                view.configureDropShadow()
                view.configureContent(title: "Error", body: "Please select Type First")
                SwiftMessages.show(view: view)
            }
            self.view.endEditing(true)
        }
        strainField.didSelect{(selectedText , index ,id) in
            print("Selected String: \(selectedText) \n index: \(index)")
        }
        strainField.rowHeight = 40
        strainField.selectedRowColor = UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1.0)
        strainField.isSearchEnable = false
        
        // Third Field
        PsychField.optionArray = []
        PsychField.optionIds = [20,13,24,36]
        PsychField.listWillAppear {
            if(self.typeField.text?.isEmpty != true) {
                if(self.strainField.text?.isEmpty != true) {
                    if(self.typeField.text! == self.typeArray[0]) {
                        self.PsychField.optionArray = self.psych1Array
                    } else {
                        self.PsychField.optionArray = self.psych2Array
                    }
                } else {
                    let view = MessageView.viewFromNib(layout: .cardView)
                    view.configureTheme(.error)
                    view.configureDropShadow()
                    view.configureContent(title: "Error", body: "Please select Strain First")
                    SwiftMessages.show(view: view)
                }
            } else {
                let view = MessageView.viewFromNib(layout: .cardView)
                view.configureTheme(.error)
                view.configureDropShadow()
                view.configureContent(title: "Error", body: "Please select Type First")
                SwiftMessages.show(view: view)
            }
            self.view.endEditing(true)
        }
        PsychField.didSelect{(selectedText , index ,id) in
            print("Selected String: \(selectedText) \n index: \(index)")
        }
        PsychField.rowHeight = 40
        PsychField.selectedRowColor = UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1.0)
        PsychField.isSearchEnable = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
    
    @objc func tapOnImageAction() {
        self.tabBarController?.selectedIndex = 2
    }
    
    @IBAction func loadPremixBtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoadPoultryPremixesViewController") as? LoadPoultryPremixesViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    @IBAction func backBtnTap(_ sender: UIButton) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    @IBAction func nextTapped(_ sender: UIButton) {
        if(self.typeField.text?.isEmpty != true || self.strainField.text?.isEmpty != true || self.PsychField.text?.isEmpty != true) {
            Requirments.shared().poultryType = self.typeField.text!
            Requirments.shared().poultryStrain = self.strainField.text!
            Requirments.shared().poultryPsychlogyState = self.PsychField.text!
            Requirments.shared().poultryCompanyName = self.companyName.text ?? "None"
            Requirments.shared().poultryVitaminA = "10"
            Requirments.shared().poultryVitaminD3 = "10"
            Requirments.shared().poultryVitaminE = "10"
            Requirments.shared().poultryVitaminK = "10"
            Requirments.shared().poultryVitaminB1 = "10"
            Requirments.shared().poultryVitaminB2 = "10"
            Requirments.shared().poultryVitaminB3 = "10"
            Requirments.shared().poultryVitaminB5 = "10"
            Requirments.shared().poultryVitaminB6 = "10"
            Requirments.shared().poultryVitaminB7 = "10"
            Requirments.shared().poultryVitaminB9 = "10"
            Requirments.shared().poultryVitaminB12 = "10"
            Requirments.shared().poultryZInc = "10"
            Requirments.shared().poultryManganese = "10"
            Requirments.shared().poultryCopper = "10"
            Requirments.shared().poultryIodine = "10"
            Requirments.shared().poultrySelenium = "10"
            Requirments.shared().poultryCobalt = "10"
            Requirments.shared().poultryIron = "10"
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "PoultryPDFViewController") as? PoultryPDFViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        } else {
            let view = MessageView.viewFromNib(layout: .cardView)
            view.configureTheme(.error)
            view.configureDropShadow()
            view.configureContent(title: "Error", body: "Please fill all fields.")
            SwiftMessages.show(view: view)
        }
        
    }
    
}
