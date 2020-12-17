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
    let typeArray = ["Broiler", "Broiler Breeder", "Layer", "Layer Breeder"]
    let broiler_breeder_TypeArray = ["Ross", "Cobb", "Hubbard", "Other"]
    let layer_breeder_TypeArray = ["Bovan", "NickChick", "LSL", "Hyline", "Novogen", "Other"]
    
    let psych1Array = ["Starter", "Growing", "Finisher"]
    let psych2Array = ["Starter/Grower", "Production"]
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
