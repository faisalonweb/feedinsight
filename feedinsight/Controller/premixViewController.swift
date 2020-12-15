//
//  premixViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 18/07/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseAuth
import FirebaseFirestore
import SVProgressHUD
import SwiftMessages

class premixViewController: UIViewController , UIGestureRecognizerDelegate{
    
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var productDose: UITextField!
    @IBOutlet weak var pMacroText: UITextField!
    @IBOutlet weak var caMacroText: UITextField!
    @IBOutlet weak var mgMacroText: UITextField!
    @IBOutlet weak var kMacroText: UITextField!
    @IBOutlet weak var naMacroText: UITextField!
    @IBOutlet weak var clMacroText: UITextField!
    @IBOutlet weak var sMacroText: UITextField!
    @IBOutlet weak var coMicroText: UITextField!
    @IBOutlet weak var iMicroText: UITextField!
    @IBOutlet weak var mnMicroText: UITextField!
    @IBOutlet weak var cuMicroText: UITextField!
    @IBOutlet weak var cuOrganicMicroText: UITextField!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var seMicroText: UITextField!
    @IBOutlet weak var seOrganicMicroText: UITextField!
    @IBOutlet weak var znMicroText: UITextField!
    @IBOutlet weak var znOrganicMicroText: UITextField!
    @IBOutlet weak var aiuVitamin: UITextField!
    @IBOutlet weak var diuVitamin: UITextField!
    @IBOutlet weak var eiuVitamin: UITextField!
    @IBOutlet weak var niacinVitamin: UITextField!
    @IBOutlet weak var biotinVitamin: UITextField!
    
    @IBOutlet weak var feMicroText: UITextField!
    let userID = Auth.auth().currentUser?.uid
    
    var RationArr = ["Ca","P","Mg","K","S","Na","Cl","Zn","Cu","Mn","Se","Co","I","Vitamin A","Vitamin D3","Vitamin E","Niacin","Biotin"]
    //210
    var WaterRationArr = ["P","Ca","Mg", "K","S","Na","Cl"]
    // 540
    var requirmentsArr = ["P","Ca","Mg","K","Na","Cl","S","Co","Cu","I","Mn","Zn","Se","Vitamin A","Vitamin D3","Vitamin E","Niacin B3","Biotin B7"]
    //630
    var PremixArr = ["P","Ca","Mg","K","Na","Cl","S","Co","Cu","I","Mn","Se","Zn","AIU","DIU","EIU","Niacin(mg)","Biotin(mg)"]
    
    var premixStatus : Bool = false
    var DocumentId : String = ""
    var ReportName : String = ""
    let defaults = UserDefaults(suiteName:"User")
    // Macro Mineral
    var productNameData = ""
    var productDoseData = ""
    var pMacroMineralData = ""
    var caMacroMinerlData = ""
    var mgMacroMineralData = ""
    var kMacroMineralData = ""
    var naMacroMineralData = ""
    var clMacroMineralData = ""
    var sMacroMineralData = ""
    // Micro Mineral
    var coMicroMineralData = ""
    var iMicroMineralData = ""
    var mnMicroMineralData = ""
    var cuMicroMineralData = ""
    var feMicroMineralData = ""
    var cuOrganicMicroMineralData = ""
    var seMicroMineralData = ""
    var seOrganicMicroMineralData = ""
    var znMicroMineralData = ""
    var znOrganicMicroMineralData = ""
    // Vitamin
    var aiuVitaminData = ""
    var diuVitaminData = ""
    var eiuVitaminData = ""
    var niacinVitaminData = ""
    var biotinVitaminData = ""
    @IBOutlet weak var profileimage: UIImageView!
    override func viewDidLoad() {
        self.dismissKey()
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
        self.profileimage.addGestureRecognizer(tapOnImage)
        self.profileimage.isUserInteractionEnabled = true
        //profileimage?.layer.cornerRadius = (profileimage?.frame.size.width ?? 0.0) / 2
        profileimage?.layer.cornerRadius = (profileimage?.frame.size.width ?? 0.0) / 2
        profileimage?.clipsToBounds = true
        profileimage?.layer.borderWidth = 3.0
        profileimage?.layer.borderColor = UIColor.white.cgColor
        // Macro Data
        productName.text = productNameData
        productDose.text = productDoseData
        pMacroText.text  = pMacroMineralData
        caMacroText.text  = caMacroMinerlData
        mgMacroText.text  = mgMacroMineralData
        kMacroText.text =   kMacroMineralData
        naMacroText.text = naMacroMineralData
        clMacroText.text = clMacroMineralData
        sMacroText.text = sMacroMineralData
        // Micro Data
        coMicroText.text = coMicroMineralData
        iMicroText.text = iMicroMineralData
        mnMicroText.text = mnMicroMineralData
        cuMicroText.text = cuMicroMineralData
        feMicroText.text = feMicroMineralData
        cuOrganicMicroText.text = cuOrganicMicroMineralData
        seMicroText.text = seMicroMineralData
        seOrganicMicroText.text = seOrganicMicroMineralData
        znMicroText.text = znMicroMineralData
        znOrganicMicroText.text = znOrganicMicroMineralData
        //Vitamins
        aiuVitamin.text = aiuVitaminData
        diuVitamin.text = diuVitaminData
        eiuVitamin.text = eiuVitaminData
        niacinVitamin.text = niacinVitaminData
        biotinVitamin.text = biotinVitaminData
        
    }
    @objc func tapOnImageAction() {
        self.tabBarController?.selectedIndex = 2
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let userName = defaults!.value(forKey: "usernameStringKey"){
            self.userNameLabel.text = userName as? String
            print(userName)
        }
        DispatchQueue.global().async {
            DispatchQueue.main.async {
                let data = self.defaults!.value(forKey: "imageData") as? Data
                if(data != nil) {
                    self.profileimage.image = UIImage(data: data!)
                }
            }
        }
    }
    @IBAction func backBtn(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    @IBAction func saveOnClick(_ sender: Any) {
        let reachability = try! Reachability.init()
        
        if((reachability.connection) != .unavailable) {
            if (premixStatus == true) {
                if (self.productName.text == "" &&  self.productDose.text == "" && self.pMacroText.text == ""
                        && self.caMacroText.text == "" && self.mgMacroText.text == "" && self.kMacroText.text == "" && self.naMacroText.text == "" && self.clMacroText.text == "" && self.sMacroText.text == "" && self.coMicroText.text == "" &&
                        self.cuMicroText.text == "" &&  self.cuOrganicMicroText.text == "" && self.seMicroText.text == "" &&  self.seOrganicMicroText.text == "" &&  self.znMicroText.text == "" && self.znOrganicMicroText.text == "" && self.aiuVitamin.text == "" && self.diuVitamin.text == "" && self.eiuVitamin.text == "" && self.niacinVitamin.text == "" && self.biotinVitamin.text == "") {
                    
                    let view = MessageView.viewFromNib(layout: .cardView)
                    view.configureTheme(.error)
                    view.configureDropShadow()
                    view.configureContent(title: "Error", body: "Kindly fill at least one text field")
                    SwiftMessages.show(view: view)
                } else {
                    let dialogMessage = UIAlertController(title: "Premix Profile", message: "", preferredStyle: .alert)
                    let new = UIAlertAction(title: "Save as New", style: .default, handler: { (action) -> Void in
                        let currentDateTime = Date()
                        let formatter = DateFormatter()
                        formatter.timeStyle = .medium
                        formatter.dateStyle = .long
                        let datetimestamp = formatter.string(from: currentDateTime)
                        let db = Firestore.firestore()
                        let alertController = UIAlertController(title: "Premix Profile", message: "", preferredStyle: .alert)
                        let withdrawAction = UIAlertAction(title: "Save", style: .default) { (aciton) in
                            SVProgressHUD.show(withStatus: "it's working ...")
                            self.view.isUserInteractionEnabled = false
                            let text = alertController.textFields!.first!.text!
                            let newDocument = db.collection("premixReports").document(self.userID!).collection("premixReports").document()
                            var dict1: Dictionary<String, String> = [:]
                            dict1 = ["productName": self.productName.text ?? "none",
                                     "productDose" : self.productDose.text ?? "none",
                                     "pMacroMineral" : self.pMacroText.text ?? "none",
                                     "caMacroMineral": self.caMacroText.text ?? "none" ,
                                     "mgMacroMineral": self.mgMacroText.text ?? "none" ,
                                     "kMacroMineral": self.kMacroText.text ?? "none",
                                     "naMacroMineral": self.naMacroText.text ?? "none" ,
                                     "clMacroMineral": self.clMacroText.text ?? "none" ,
                                     "sMacroMineral": self.sMacroText.text ?? "none",
                                     "coMicroMineral": self.coMicroText.text ?? "none",
                                     "cu(inorganic)MicroMineral": self.cuMicroText.text ?? "none",
                                     "cu(organic)MicroMineral": self.cuOrganicMicroText.text ?? "none",
                                     "se(inorganic)MicroMineral": self.seMicroText.text ?? "none",
                                     "se(organic)MicroMineral": self.seOrganicMicroText.text ?? "none",
                                     "zn(inorganic)MicroMineral": self.znMicroText.text ?? "none",
                                     "zn(organic)MicroMineral": self.znOrganicMicroText.text ?? "none",
                                     "aiuVitamin": self.aiuVitamin.text ?? "none",
                                     "diuVitamin": self.diuVitamin.text ?? "none",
                                     "eiuVitamin": self.eiuVitamin.text ?? "none",
                                     "niacinVitamin": self.niacinVitamin.text ?? "none",
                                     "biotinVitamin": self.biotinVitamin.text ?? "none",
                                     "ReportName" : text,
                                     "currentdatetime": datetimestamp,
                                     "DocId": newDocument.documentID
                            ]
                            newDocument.setData(dict1){ err in
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
                        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
                        }
                        alertController.addTextField { (textField) in
                            textField.placeholder = "Premix Profile"
                        }
                        alertController.addAction(withdrawAction)
                        alertController.addAction(cancelAction)
                        self.present(alertController, animated: true, completion: nil)
                    })
                    
                    // Create Cancel button with action handlder
                    let previous = UIAlertAction(title: "Save as Previous", style: .default) { (action) -> Void in
                        SVProgressHUD.show(withStatus: "it's working ...")
                        self.view.isUserInteractionEnabled = false
                        let currentDateTime = Date()
                        let formatter = DateFormatter()
                        formatter.timeStyle = .medium
                        formatter.dateStyle = .long
                        let datetimestamp = formatter.string(from: currentDateTime)
                        let db = Firestore.firestore()
                        
                        let newDocument = db.collection("premixReports").document(self.userID!).collection("premixReports").document(self.DocumentId)
                        var dict1: Dictionary<String, String> = [:]
                        dict1 = ["productName": self.productName.text ?? "none",
                                 "productDose" : self.productDose.text ?? "none",
                                 "pMacroMineral" : self.pMacroText.text ?? "none",
                                 "caMacroMineral": self.caMacroText.text ?? "none" ,
                                 "mgMacroMineral": self.mgMacroText.text ?? "none" ,
                                 "kMacroMineral": self.kMacroText.text ?? "none",
                                 "naMacroMineral": self.naMacroText.text ?? "none" ,
                                 "clMacroMineral": self.clMacroText.text ?? "none" ,
                                 "sMacroMineral": self.sMacroText.text ?? "none",
                                 "coMicroMineral": self.coMicroText.text ?? "none",
                                 "iMicroMineral": self.iMicroText.text ?? "none",
                                 "mnMicroMineral": self.mnMicroText.text ?? "none",
                                 "cu(inorganic)MicroMineral": self.cuMicroText.text ?? "none",
                                 "cu(organic)MicroMineral": self.cuOrganicMicroText.text ?? "none",
                                 "se(inorganic)MicroMineral": self.seMicroText.text ?? "none",
                                 "se(organic)MicroMineral": self.seOrganicMicroText.text ?? "none",
                                 "zn(inorganic)MicroMineral": self.znMicroText.text ?? "none",
                                 "zn(organic)MicroMineral": self.znOrganicMicroText.text ?? "none",
                                 "aiuVitamin": self.aiuVitamin.text ?? "none",
                                 "diuVitamin": self.diuVitamin.text ?? "none",
                                 "eiuVitamin": self.eiuVitamin.text ?? "none",
                                 "niacinVitamin": self.niacinVitamin.text ?? "none",
                                 "biotinVitamin": self.biotinVitamin.text ?? "none",
                                 "ReportName" : self.ReportName,
                                 "currentdatetime": datetimestamp,
                                 "DocId": newDocument.documentID
                        ]
                        newDocument.setData(dict1){ err in
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
                    let destructive = UIAlertAction(title: "Cancel", style: .destructive) { (action) -> Void in
                    }
                    
                    //Add OK and Cancel button to an Alert object
                    dialogMessage.addAction(new)
                    dialogMessage.addAction(previous)
                    dialogMessage.addAction(destructive)
                    
                    // Present alert message to user
                    self.present(dialogMessage, animated: true, completion: nil)
                }
            }
            else {
                if (self.productName.text == "" &&  self.productDose.text == "" && self.pMacroText.text == ""
                        && self.caMacroText.text == "" && self.mgMacroText.text == "" && self.kMacroText.text == "" && self.naMacroText.text == "" && self.clMacroText.text == "" && self.sMacroText.text == "" && self.coMicroText.text == "" &&
                        self.cuMicroText.text == "" &&  self.cuOrganicMicroText.text == "" && self.seMicroText.text == "" &&  self.seOrganicMicroText.text == "" &&  self.znMicroText.text == "" && self.znOrganicMicroText.text == "" && self.aiuVitamin.text == "" && self.diuVitamin.text == "" && self.eiuVitamin.text == "" && self.niacinVitamin.text == "" && self.biotinVitamin.text == "") {
                    
                    let view = MessageView.viewFromNib(layout: .cardView)
                    view.configureTheme(.error)
                    view.configureDropShadow()
                    view.configureContent(title: "Error", body: "Kindly fill at least one text field")
                    SwiftMessages.show(view: view)
                }
                else {
                    let currentDateTime = Date()
                    let formatter = DateFormatter()
                    formatter.timeStyle = .medium
                    formatter.dateStyle = .long
                    let datetimestamp = formatter.string(from: currentDateTime)
                    let db = Firestore.firestore()
                    let alertController = UIAlertController(title: "Premix Profile", message: "", preferredStyle: .alert)
                    let withdrawAction = UIAlertAction(title: "Save", style: .default) { (aciton) in
                        SVProgressHUD.show(withStatus: "it's working ...")
                        self.view.isUserInteractionEnabled = false
                        let text = alertController.textFields!.first!.text!
                        let newDocument = db.collection("premixReports").document(self.userID!).collection("premixReports").document()
                        var dict1: Dictionary<String, String> = [:]
                        dict1 = ["productName": self.productName.text ?? "none",
                                 "productDose" : self.productDose.text ?? "none",
                                 "pMacroMineral" : self.pMacroText.text ?? "none",
                                 "caMacroMineral": self.caMacroText.text ?? "none" ,
                                 "mgMacroMineral": self.mgMacroText.text ?? "none" ,
                                 "kMacroMineral": self.kMacroText.text ?? "none",
                                 "naMacroMineral": self.naMacroText.text ?? "none" ,
                                 "clMacroMineral": self.clMacroText.text ?? "none" ,
                                 "sMacroMineral": self.sMacroText.text ?? "none",
                                 "coMicroMineral": self.coMicroText.text ?? "none",
                                 "iMicroMineral": self.iMicroText.text ?? "none",
                                 "mnMicroMineral": self.mnMicroText.text ?? "none",
                                 "cu(inorganic)MicroMineral": self.cuMicroText.text ?? "none",
                                 "cu(organic)MicroMineral": self.cuOrganicMicroText.text ?? "none",
                                 "se(inorganic)MicroMineral": self.seMicroText.text ?? "none",
                                 "se(organic)MicroMineral": self.seOrganicMicroText.text ?? "none",
                                 "zn(inorganic)MicroMineral": self.znMicroText.text ?? "none",
                                 "zn(organic)MicroMineral": self.znOrganicMicroText.text ?? "none",
                                 "aiuVitamin": self.aiuVitamin.text ?? "none",
                                 "diuVitamin": self.diuVitamin.text ?? "none",
                                 "eiuVitamin": self.eiuVitamin.text ?? "none",
                                 "niacinVitamin": self.niacinVitamin.text ?? "none",
                                 "biotinVitamin": self.biotinVitamin.text ?? "none",
                                 "ReportName" : text,
                                 "currentdatetime": datetimestamp,
                                 "DocId": newDocument.documentID
                        ]
                        newDocument.setData(dict1){ err in
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
                    let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
                    }
                    alertController.addTextField { (textField) in
                        textField.placeholder = "Premix Profile"
                    }
                    alertController.addAction(withdrawAction)
                    alertController.addAction(cancelAction)
                    self.present(alertController, animated: true, completion: nil)
                }
                
                
            }
        } else {
            let view = MessageView.viewFromNib(layout: .cardView)
            view.configureTheme(.error)
            view.configureDropShadow()
            view.configureContent(title: "Error", body: "check your internet connection")
            SwiftMessages.show(view: view)
        }
        
        
    }
    
    @IBAction func loadOnClick(_ sender: Any) {
        premixStatus = true
        let vc = storyboard?.instantiateViewController(withIdentifier: "waterrationViewController") as? waterrationViewController
        vc?.screenNAME = "premix"
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func skipButton(_ sender: Any) {
        let reachability = try! Reachability.init()
        if((reachability.connection) != .unavailable) {
            Requirments.shared().productName = productName.text!
            Requirments.shared().productDose = Double(productDose.text!) ?? 0
            var doseinKG : Double = Double(productDose.text!) ?? 0
            doseinKG = doseinKG / 1000
            let pMacroText1 = Double(pMacroText.text!) ?? 0
            let pMacroText2 = Double(caMacroText.text!) ?? 0
            let pMacroText3 = Double(mgMacroText.text!) ?? 0
            let pMacroText4 = Double(kMacroText.text!) ?? 0
            let pMacroText5 = Double(naMacroText.text!) ?? 0
            let pMacroText6 = Double(clMacroText.text!) ?? 0
            let pMacroText7 = Double(sMacroText.text!) ?? 0
            let pMacroText8 = Double(coMicroText.text!) ?? 0
            
            let cu1 = Double(cuMicroText.text!) ?? 0
            let cu2 = Double(cuOrganicMicroText.text!) ?? 0
            let se1 = Double(seMicroText.text!) ?? 0
            let se2 = Double(seOrganicMicroText.text!) ?? 0
            let zn1 = Double(znMicroText.text!) ?? 0
            let zn2 = Double(znOrganicMicroText.text!) ?? 0
            let mn1 = Double(mnMicroText.text!) ?? 0
            let mn2 = Double(feMicroText.text!) ?? 0
            
            let totalCu = cu1 + cu2
            let totalSe = se1 + se2
            let totalZn = zn1 + zn2
            let totalMn = mn1 + mn2
            
            let pMacroText23 = Double(iMicroText.text!) ?? 0
            let pMacroText15 = Double(aiuVitamin.text!) ?? 0
            let pMacroText16 = Double(diuVitamin.text!) ?? 0
            let pMacroText17 = Double(eiuVitamin.text!) ?? 0
            let pMacroText18 = Double(niacinVitamin.text!) ?? 0
            let pMacroText19 = Double(biotinVitamin.text!) ?? 0
            
            let pMacroText20 = Double(totalCu)
            let pMacroText21 = Double(totalSe)
            let pMacroText22 = Double(totalZn)
            let pMacroText25 = Double(totalMn)
            
            Requirments.shared().pMacroText1 = String(pMacroText1)
            Requirments.shared().caMacroText1 = String(pMacroText2)
            Requirments.shared().mgMacroText1 = String(pMacroText3)
            Requirments.shared().kMacroText1 = String(pMacroText4)
            Requirments.shared().naMacroText1 = String(pMacroText5)
            Requirments.shared().clMacroText1 = String(pMacroText6)
            Requirments.shared().sMacroText1 = String(pMacroText7)
            Requirments.shared().coMicroText1 = String(pMacroText8)
            Requirments.shared().cuMicroText1 = cuMicroText.text
            Requirments.shared().seMicroText1 = seMicroText.text
            Requirments.shared().znMicroText1 = znMicroText.text!
            Requirments.shared().aiuVitamin1 = String(pMacroText15)
            Requirments.shared().diuVitamin1 = String(pMacroText16)
            Requirments.shared().eiuVitamin1 = String(pMacroText17)
            Requirments.shared().niacinVitamin1 = String(pMacroText18)
            Requirments.shared().biotinVitamin1 = String(pMacroText19)
            Requirments.shared().iMicroText1 = String(pMacroText23)
            Requirments.shared().mnMicroText1 = mnMicroText.text!
            Requirments.shared().mnOrganicMicroText1 = self.feMicroText.text
            Requirments.shared().cuOrganicMicroText1 = self.cuOrganicMicroText.text
            Requirments.shared().seOrganicMicroText1 = self.seOrganicMicroText.text
            Requirments.shared().znOrganicMicroText1 = self.znOrganicMicroText.text
            
            Requirments.shared().pMacroText = pMacroText1 * doseinKG
            Requirments.shared().caMacroText = pMacroText2 * doseinKG
            Requirments.shared().mgMacroText = pMacroText3 * doseinKG
            Requirments.shared().kMacroText = pMacroText4 * doseinKG
            Requirments.shared().naMacroText = pMacroText5 * doseinKG
            Requirments.shared().clMacroText = pMacroText6 * doseinKG
            Requirments.shared().sMacroText = pMacroText7 * doseinKG
            Requirments.shared().coMicroText = pMacroText8 * doseinKG
            Requirments.shared().cuMicroText = pMacroText20 * doseinKG
            Requirments.shared().seMicroText = pMacroText21 * doseinKG
            Requirments.shared().znMicroText = pMacroText22 * doseinKG
            Requirments.shared().aiuVitamin = pMacroText15 * doseinKG
            Requirments.shared().diuVitamin = pMacroText16 * doseinKG
            Requirments.shared().eiuVitamin = pMacroText17 * doseinKG
            Requirments.shared().niacinVitamin = pMacroText18 * doseinKG
            Requirments.shared().biotinVitamin = pMacroText19 * doseinKG
            Requirments.shared().iMicroText = pMacroText23 * doseinKG
            Requirments.shared().mnMicroText = pMacroText25 * doseinKG
            Requirments.shared().appendOriginalPremixValues()
            Requirments.shared().appendPremixValues()
            
            /*
             Save Report code start
             */
            
            let currentDateTime = Date()
            let formatter = DateFormatter()
            formatter.timeStyle = .medium
            formatter.dateStyle = .long
            let datetimestamp = formatter.string(from: currentDateTime)
            let db = Firestore.firestore()
            var na = Requirments.shared().rationArrayFinal[14]+Requirments.shared().primexArrayFinal[14]+Requirments.shared().waterArrayFinal[14]
            var cl = Requirments.shared().rationArrayFinal[15]+Requirments.shared().primexArrayFinal[15]+Requirments.shared().waterArrayFinal[15]
            var s = Requirments.shared().rationArrayFinal[16]+Requirments.shared().primexArrayFinal[16]+Requirments.shared().waterArrayFinal[16]
            var k = Requirments.shared().rationArrayFinal[17]+Requirments.shared().primexArrayFinal[17]+Requirments.shared().waterArrayFinal[17]
            
            na = (na / Requirments.shared().DMI) / 39.0
            cl = (cl / Requirments.shared().DMI) / 23.0
            s = (s / Requirments.shared().DMI) / 35.5
            k = (k / Requirments.shared().DMI) / 16
            
            var deb = na + k - cl
            var dcab = na + k - cl - s
            
            deb = deb * 1000
            dcab = dcab * 1000
            
            Requirments.shared().deb = String(deb)
            Requirments.shared().dcab = String(dcab)
            let alertController = UIAlertController(title: "Pdf Report", message: "", preferredStyle: .alert)
            let withdrawAction = UIAlertAction(title: "Generate", style: .default) { [self] (aciton) in
                SVProgressHUD.show(withStatus: "it's working ...")
                self.view.isUserInteractionEnabled = false
                let text = alertController.textFields!.first!.text!
                let newDocument =  db.collection("pdfReports").document(self.userID!).collection("pdfReports").document()
                newDocument.setData(["ReportName" : text,
                                     "currentdatetime": datetimestamp,
                                     "DocId": newDocument.documentID,
                                     "CompanyName":Requirments.shared().companyName!,
                                     "ruminantType":Requirments.shared().animalKind!,
                                     "ruminantGroup":Requirments.shared().animalGroup!,
                                     "ruminantState":Requirments.shared().physiologicalState!,
                                     "preparedBy":self.defaults!.value(forKey: "usernameStringKey")!,
                                     "reportType":"Premix Check",
                                     "RequirmentsVal": Requirments.shared().reqArrayFinal,
                                     "RationVal": Requirments.shared().rationArrayFinal ,
                                     "WaterVal" : Requirments.shared().waterArrayFinal,
                                     "PremixVal": Requirments.shared().primexArrayFinal,
                                     "originalWaterArray" : Requirments.shared().OriginalwaterArrayFinal,
                                     "originalPremixArray" : Requirments.shared().OriginalprimexArrayFinal,
                                     "originalDropDownvalues" : dropdownvalues,
                                     "originalDropDownfloatvalues" : dropdownfloatValue,
                                     "companyName1": Requirments.shared().companyName! as String,
                                     "animalGroup1": Requirments.shared().animalGroup! as String,
                                     "physiologicalState1": Requirments.shared().physiologicalState! as String,
                                     "currentBodyWeight1": Requirments.shared().currentBodyWeight! as String,
                                     "targetBodyWeight1": Requirments.shared().targetBodyWeight! as String,
                                     "achieveTargetWeight1": Requirments.shared().achieveTargetWeight! as String,
                                     "daysInMilk1": Requirments.shared().daysInMilk! as String,
                                     "daysPregnant1": Requirments.shared().daysPregnant! as String,
                                     "milkProduction1": Requirments.shared().milkProduction! as String,
                                     "animalKind1": Requirments.shared().animalKind! as String,
                                     "heatStress1": Requirments.shared().heatStress?.description ?? "none",
                                     "metaBolic1": Requirments.shared().metaBolic?.description ?? "none",
                                     "anionic1": Requirments.shared().anionic?.description ?? "none",
                                     "woolProduction1": Requirments.shared().woolProduction?.description ?? "none",
                                     "deb" : Requirments.shared().deb ?? "0.0",
                                     "dcab" : Requirments.shared().dcab ?? "0.0"
                ]){ err in
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
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SwitchPDFViewController") as? SwitchPDFViewController
                        vc?.reportName = text
                        vc?.reportDate = datetimestamp
                        self.navigationController?.pushViewController(vc!, animated: true)
                    }
                }
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
            }
            alertController.addTextField { (textField) in
                textField.placeholder = "Pdf Report"
            }
            alertController.addAction(withdrawAction)
            alertController.addAction(cancelAction)
            alertController.textFields!.first!.text! = Requirments.shared().animalKind! + " " + Requirments.shared().animalGroup! + " " + Requirments.shared().physiologicalState!
            self.present(alertController, animated: true, completion: nil)
        } else {
            Requirments.shared().productName = productName.text!
            Requirments.shared().productDose = Double(productDose.text!) ?? 0
            var doseinKG : Double = Double(productDose.text!) ?? 0
            doseinKG = doseinKG / 1000
            let pMacroText1 = Double(pMacroText.text!) ?? 0
            let pMacroText2 = Double(caMacroText.text!) ?? 0
            let pMacroText3 = Double(mgMacroText.text!) ?? 0
            let pMacroText4 = Double(kMacroText.text!) ?? 0
            let pMacroText5 = Double(naMacroText.text!) ?? 0
            let pMacroText6 = Double(clMacroText.text!) ?? 0
            let pMacroText7 = Double(sMacroText.text!) ?? 0
            let pMacroText8 = Double(coMicroText.text!) ?? 0
            
            let cu1 = Double(cuMicroText.text!) ?? 0
            let cu2 = Double(cuOrganicMicroText.text!) ?? 0
            let se1 = Double(seMicroText.text!) ?? 0
            let se2 = Double(seOrganicMicroText.text!) ?? 0
            let zn1 = Double(znMicroText.text!) ?? 0
            let zn2 = Double(znOrganicMicroText.text!) ?? 0
            let mn1 = Double(mnMicroText.text!) ?? 0
            let mn2 = Double(feMicroText.text!) ?? 0
            
            let totalCu = cu1 + cu2
            let totalSe = se1 + se2
            let totalZn = zn1 + zn2
            let totalMn = mn1 + mn2
            
            let pMacroText23 = Double(iMicroText.text!) ?? 0
            let pMacroText15 = Double(aiuVitamin.text!) ?? 0
            let pMacroText16 = Double(diuVitamin.text!) ?? 0
            let pMacroText17 = Double(eiuVitamin.text!) ?? 0
            let pMacroText18 = Double(niacinVitamin.text!) ?? 0
            let pMacroText19 = Double(biotinVitamin.text!) ?? 0
            
            let pMacroText20 = Double(totalCu)
            let pMacroText21 = Double(totalSe)
            let pMacroText22 = Double(totalZn)
            let pMacroText25 = Double(totalMn)
            
            Requirments.shared().pMacroText1 = String(pMacroText1)
            Requirments.shared().caMacroText1 = String(pMacroText2)
            Requirments.shared().mgMacroText1 = String(pMacroText3)
            Requirments.shared().kMacroText1 = String(pMacroText4)
            Requirments.shared().naMacroText1 = String(pMacroText5)
            Requirments.shared().clMacroText1 = String(pMacroText6)
            Requirments.shared().sMacroText1 = String(pMacroText7)
            Requirments.shared().coMicroText1 = String(pMacroText8)
            Requirments.shared().cuMicroText1 = cuMicroText.text
            Requirments.shared().seMicroText1 = seMicroText.text
            Requirments.shared().znMicroText1 = znMicroText.text!
            Requirments.shared().aiuVitamin1 = String(pMacroText15)
            Requirments.shared().diuVitamin1 = String(pMacroText16)
            Requirments.shared().eiuVitamin1 = String(pMacroText17)
            Requirments.shared().niacinVitamin1 = String(pMacroText18)
            Requirments.shared().biotinVitamin1 = String(pMacroText19)
            Requirments.shared().iMicroText1 = String(pMacroText23)
            Requirments.shared().mnMicroText1 = mnMicroText.text!
            Requirments.shared().mnOrganicMicroText1 = self.feMicroText.text
            Requirments.shared().cuOrganicMicroText1 = self.cuOrganicMicroText.text
            Requirments.shared().seOrganicMicroText1 = self.seOrganicMicroText.text
            Requirments.shared().znOrganicMicroText1 = self.znOrganicMicroText.text
            
            Requirments.shared().pMacroText = pMacroText1 * doseinKG
            Requirments.shared().caMacroText = pMacroText2 * doseinKG
            Requirments.shared().mgMacroText = pMacroText3 * doseinKG
            Requirments.shared().kMacroText = pMacroText4 * doseinKG
            Requirments.shared().naMacroText = pMacroText5 * doseinKG
            Requirments.shared().clMacroText = pMacroText6 * doseinKG
            Requirments.shared().sMacroText = pMacroText7 * doseinKG
            Requirments.shared().coMicroText = pMacroText8 * doseinKG
            Requirments.shared().cuMicroText = pMacroText20 * doseinKG
            Requirments.shared().seMicroText = pMacroText21 * doseinKG
            Requirments.shared().znMicroText = pMacroText22 * doseinKG
            Requirments.shared().aiuVitamin = pMacroText15 * doseinKG
            Requirments.shared().diuVitamin = pMacroText16 * doseinKG
            Requirments.shared().eiuVitamin = pMacroText17 * doseinKG
            Requirments.shared().niacinVitamin = pMacroText18 * doseinKG
            Requirments.shared().biotinVitamin = pMacroText19 * doseinKG
            Requirments.shared().iMicroText = pMacroText23 * doseinKG
            Requirments.shared().mnMicroText = pMacroText25 * doseinKG
            Requirments.shared().appendPremixValues()
            var na = Requirments.shared().rationArrayFinal[14]+Requirments.shared().primexArrayFinal[14]+Requirments.shared().waterArrayFinal[14]
            var cl = Requirments.shared().rationArrayFinal[15]+Requirments.shared().primexArrayFinal[15]+Requirments.shared().waterArrayFinal[15]
            var s = Requirments.shared().rationArrayFinal[16]+Requirments.shared().primexArrayFinal[16]+Requirments.shared().waterArrayFinal[16]
            var k = Requirments.shared().rationArrayFinal[17]+Requirments.shared().primexArrayFinal[17]+Requirments.shared().waterArrayFinal[17]
            
            na = (na / Requirments.shared().DMI) / 39.0
            cl = (cl / Requirments.shared().DMI) / 23.0
            s = (s / Requirments.shared().DMI) / 35.5
            k = (k / Requirments.shared().DMI) / 16
            
            var deb = na + k - cl
            var dcab = na + k - cl - s
            
            deb = deb * 1000
            dcab = dcab * 1000
            
            Requirments.shared().deb = String(deb)
            Requirments.shared().dcab = String(dcab)
            let currentDateTime = Date()
            let formatter = DateFormatter()
            formatter.timeStyle = .medium
            formatter.dateStyle = .long
            let datetimestamp = formatter.string(from: currentDateTime)
            self.view.isUserInteractionEnabled = true
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SwitchPDFViewController") as? SwitchPDFViewController
            vc?.reportName = "Testing Report"
            vc?.reportDate = datetimestamp
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    @IBAction func nextButton(_ sender: Any) {
        
        let reachability = try! Reachability.init()
        if((reachability.connection) != .unavailable) {
            Requirments.shared().productName = productName.text!
            Requirments.shared().productDose = Double(productDose.text!) ?? 0
            var doseinKG : Double = Double(productDose.text!) ?? 0
            doseinKG = doseinKG / 1000
            let pMacroText1 = Double(pMacroText.text!) ?? 0
            let pMacroText2 = Double(caMacroText.text!) ?? 0
            let pMacroText3 = Double(mgMacroText.text!) ?? 0
            let pMacroText4 = Double(kMacroText.text!) ?? 0
            let pMacroText5 = Double(naMacroText.text!) ?? 0
            let pMacroText6 = Double(clMacroText.text!) ?? 0
            let pMacroText7 = Double(sMacroText.text!) ?? 0
            let pMacroText8 = Double(coMicroText.text!) ?? 0
            
            let cu1 = Double(cuMicroText.text!) ?? 0
            let cu2 = Double(cuOrganicMicroText.text!) ?? 0
            let se1 = Double(seMicroText.text!) ?? 0
            let se2 = Double(seOrganicMicroText.text!) ?? 0
            let zn1 = Double(znMicroText.text!) ?? 0
            let zn2 = Double(znOrganicMicroText.text!) ?? 0
            let mn1 = Double(mnMicroText.text!) ?? 0
            let mn2 = Double(feMicroText.text!) ?? 0
            let totalCu = cu1 + cu2
            let totalSe = se1 + se2
            let totalZn = zn1 + zn2
            let totalMn = mn1 + mn2
            let pMacroText23 = Double(iMicroText.text!) ?? 0
            let pMacroText15 = Double(aiuVitamin.text!) ?? 0
            let pMacroText16 = Double(diuVitamin.text!) ?? 0
            let pMacroText17 = Double(eiuVitamin.text!) ?? 0
            let pMacroText18 = Double(niacinVitamin.text!) ?? 0
            let pMacroText19 = Double(biotinVitamin.text!) ?? 0
            
            let pMacroText20 = Double(totalCu)
            let pMacroText21 = Double(totalSe)
            let pMacroText22 = Double(totalZn)
            let pMacroText25 = Double(totalMn)
            
            Requirments.shared().pMacroText1 = String(pMacroText1)
            Requirments.shared().caMacroText1 = String(pMacroText2)
            Requirments.shared().mgMacroText1 = String(pMacroText3)
            Requirments.shared().kMacroText1 = String(pMacroText4)
            Requirments.shared().naMacroText1 = String(pMacroText5)
            Requirments.shared().clMacroText1 = String(pMacroText6)
            Requirments.shared().sMacroText1 = String(pMacroText7)
            Requirments.shared().coMicroText1 = String(pMacroText8)
            Requirments.shared().cuMicroText1 = cuMicroText.text
            Requirments.shared().seMicroText1 = seMicroText.text
            Requirments.shared().znMicroText1 = znMicroText.text!
            Requirments.shared().aiuVitamin1 = String(pMacroText15)
            Requirments.shared().diuVitamin1 = String(pMacroText16)
            Requirments.shared().eiuVitamin1 = String(pMacroText17)
            Requirments.shared().niacinVitamin1 = String(pMacroText18)
            Requirments.shared().biotinVitamin1 = String(pMacroText19)
            Requirments.shared().iMicroText1 = String(pMacroText23)
            Requirments.shared().mnMicroText1 = mnMicroText.text!
            Requirments.shared().mnOrganicMicroText1 = self.feMicroText.text
            Requirments.shared().cuOrganicMicroText1 = self.cuOrganicMicroText.text
            Requirments.shared().seOrganicMicroText1 = self.seOrganicMicroText.text
            Requirments.shared().znOrganicMicroText1 = self.znOrganicMicroText.text
            
            Requirments.shared().pMacroText = pMacroText1 * doseinKG
            Requirments.shared().caMacroText = pMacroText2 * doseinKG
            Requirments.shared().mgMacroText = pMacroText3 * doseinKG
            Requirments.shared().kMacroText = pMacroText4 * doseinKG
            Requirments.shared().naMacroText = pMacroText5 * doseinKG
            Requirments.shared().clMacroText = pMacroText6 * doseinKG
            Requirments.shared().sMacroText = pMacroText7 * doseinKG
            Requirments.shared().coMicroText = pMacroText8 * doseinKG
            Requirments.shared().cuMicroText = pMacroText20 * doseinKG
            Requirments.shared().seMicroText = pMacroText21 * doseinKG
            Requirments.shared().znMicroText = pMacroText22 * doseinKG
            Requirments.shared().aiuVitamin = pMacroText15 * doseinKG
            Requirments.shared().diuVitamin = pMacroText16 * doseinKG
            Requirments.shared().eiuVitamin = pMacroText17 * doseinKG
            Requirments.shared().niacinVitamin = pMacroText18 * doseinKG
            Requirments.shared().biotinVitamin = pMacroText19 * doseinKG
            Requirments.shared().iMicroText = pMacroText23 * doseinKG
            Requirments.shared().mnMicroText = pMacroText25 * doseinKG
            
            Requirments.shared().appendPremixValues()
            Requirments.shared().appendOriginalPremixValues()
            
            let currentDateTime = Date()
            let formatter = DateFormatter()
            formatter.timeStyle = .medium
            formatter.dateStyle = .long
            
            var na = Requirments.shared().rationArrayFinal[14]+Requirments.shared().primexArrayFinal[14]+Requirments.shared().waterArrayFinal[14]
            var cl = Requirments.shared().rationArrayFinal[15]+Requirments.shared().primexArrayFinal[15]+Requirments.shared().waterArrayFinal[15]
            var s = Requirments.shared().rationArrayFinal[16]+Requirments.shared().primexArrayFinal[16]+Requirments.shared().waterArrayFinal[16]
            var k = Requirments.shared().rationArrayFinal[17]+Requirments.shared().primexArrayFinal[17]+Requirments.shared().waterArrayFinal[17]
            
            na = (na / Requirments.shared().DMI) / 39.0
            cl = (cl / Requirments.shared().DMI) / 23.0
            s = (s / Requirments.shared().DMI) / 35.5
            k = (k / Requirments.shared().DMI) / 16
            
            var deb = na + k - cl
            var dcab = na + k - cl - s
            
            deb = deb * 1000
            dcab = dcab * 1000
            
            Requirments.shared().deb = String(deb)
            Requirments.shared().dcab = String(dcab)
            
            let datetimestamp = formatter.string(from: currentDateTime)
            let db = Firestore.firestore()
            let alertController = UIAlertController(title: "Pdf Report", message: "", preferredStyle: .alert)
            let withdrawAction = UIAlertAction(title: "Generate", style: .default) { [self] (aciton) in
                SVProgressHUD.show(withStatus: "it's working ...")
                self.view.isUserInteractionEnabled = false
                let text = alertController.textFields!.first!.text!
                let newDocument =  db.collection("pdfReports").document(self.userID!).collection("pdfReports").document()
                newDocument.setData(["ReportName" : text,
                                     "currentdatetime": datetimestamp,
                                     "DocId": newDocument.documentID,
                                     "CompanyName":Requirments.shared().companyName!,
                                     "ruminantType":Requirments.shared().animalKind!,
                                     "ruminantGroup":Requirments.shared().animalGroup!,
                                     "ruminantState":Requirments.shared().physiologicalState!,
                                     "preparedBy":self.defaults!.value(forKey: "usernameStringKey")!,
                                     "reportType":"Premix Check",
                                     "RequirmentsVal": Requirments.shared().reqArrayFinal,
                                     "RationVal": Requirments.shared().rationArrayFinal ,
                                     "WaterVal" : Requirments.shared().waterArrayFinal,
                                     "PremixVal": Requirments.shared().primexArrayFinal,
                                     "originalWaterArray" : Requirments.shared().OriginalwaterArrayFinal,
                                     "originalPremixArray" : Requirments.shared().OriginalprimexArrayFinal,
                                     "originalDropDownvalues" : dropdownvalues,
                                     "originalDropDownfloatvalues" : dropdownfloatValue,
                                     "companyName1": Requirments.shared().companyName! as String,
                                     "animalGroup1": Requirments.shared().animalGroup! as String,
                                     "physiologicalState1": Requirments.shared().physiologicalState! as String,
                                     "currentBodyWeight1": Requirments.shared().currentBodyWeight! as String,
                                     "targetBodyWeight1": Requirments.shared().targetBodyWeight! as String,
                                     "achieveTargetWeight1": Requirments.shared().achieveTargetWeight! as String,
                                     "daysInMilk1": Requirments.shared().daysInMilk! as String,
                                     "daysPregnant1": Requirments.shared().daysPregnant! as String,
                                     "milkProduction1": Requirments.shared().milkProduction! as String,
                                     "animalKind1": Requirments.shared().animalKind! as String,
                                     "heatStress1": Requirments.shared().heatStress?.description ?? "none",
                                     "metaBolic1": Requirments.shared().metaBolic?.description ?? "none",
                                     "anionic1": Requirments.shared().anionic?.description ?? "none",
                                     "woolProduction1": Requirments.shared().woolProduction?.description ?? "none",
                                     "deb" : Requirments.shared().deb ?? "0.0",
                                     "dcab" : Requirments.shared().dcab ?? "0.0"
                                     
                ]) { err in
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
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SwitchPDFViewController") as? SwitchPDFViewController
                        vc?.reportName = text
                        vc?.reportDate = datetimestamp
                        self.navigationController?.pushViewController(vc!, animated: true)
                    }
                }
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
            }
            alertController.addTextField { (textField) in
                textField.placeholder = "Pdf Report"
            }
            alertController.addAction(withdrawAction)
            alertController.addAction(cancelAction)
            alertController.textFields!.first!.text! = Requirments.shared().animalKind! + " " + Requirments.shared().animalGroup! + " " + Requirments.shared().physiologicalState!
            self.present(alertController, animated: true, completion: nil)
        } else {
            Requirments.shared().productName = productName.text!
            Requirments.shared().productDose = Double(productDose.text!) ?? 0
            var doseinKG : Double = Double(productDose.text!) ?? 0
            doseinKG = doseinKG / 1000
            let pMacroText1 = Double(pMacroText.text!) ?? 0
            let pMacroText2 = Double(caMacroText.text!) ?? 0
            let pMacroText3 = Double(mgMacroText.text!) ?? 0
            let pMacroText4 = Double(kMacroText.text!) ?? 0
            let pMacroText5 = Double(naMacroText.text!) ?? 0
            let pMacroText6 = Double(clMacroText.text!) ?? 0
            let pMacroText7 = Double(sMacroText.text!) ?? 0
            let pMacroText8 = Double(coMicroText.text!) ?? 0
            
            let cu1 = Double(cuMicroText.text!) ?? 0
            let cu2 = Double(cuOrganicMicroText.text!) ?? 0
            let se1 = Double(seMicroText.text!) ?? 0
            let se2 = Double(seOrganicMicroText.text!) ?? 0
            let zn1 = Double(znMicroText.text!) ?? 0
            let zn2 = Double(znOrganicMicroText.text!) ?? 0
            let mn1 = Double(mnMicroText.text!) ?? 0
            let mn2 = Double(feMicroText.text!) ?? 0
            let totalCu = cu1 + cu2
            let totalSe = se1 + se2
            let totalZn = zn1 + zn2
            let totalMn = mn1 + mn2
            let pMacroText23 = Double(iMicroText.text!) ?? 0
            let pMacroText15 = Double(aiuVitamin.text!) ?? 0
            let pMacroText16 = Double(diuVitamin.text!) ?? 0
            let pMacroText17 = Double(eiuVitamin.text!) ?? 0
            let pMacroText18 = Double(niacinVitamin.text!) ?? 0
            let pMacroText19 = Double(biotinVitamin.text!) ?? 0
            
            let pMacroText20 = Double(totalCu)
            let pMacroText21 = Double(totalSe)
            let pMacroText22 = Double(totalZn)
            let pMacroText25 = Double(totalMn)
            
            Requirments.shared().pMacroText1 = String(pMacroText1)
            Requirments.shared().caMacroText1 = String(pMacroText2)
            Requirments.shared().mgMacroText1 = String(pMacroText3)
            Requirments.shared().kMacroText1 = String(pMacroText4)
            Requirments.shared().naMacroText1 = String(pMacroText5)
            Requirments.shared().clMacroText1 = String(pMacroText6)
            Requirments.shared().sMacroText1 = String(pMacroText7)
            Requirments.shared().coMicroText1 = String(pMacroText8)
            Requirments.shared().cuMicroText1 = cuMicroText.text
            Requirments.shared().seMicroText1 = seMicroText.text
            Requirments.shared().znMicroText1 = znMicroText.text!
            Requirments.shared().aiuVitamin1 = String(pMacroText15)
            Requirments.shared().diuVitamin1 = String(pMacroText16)
            Requirments.shared().eiuVitamin1 = String(pMacroText17)
            Requirments.shared().niacinVitamin1 = String(pMacroText18)
            Requirments.shared().biotinVitamin1 = String(pMacroText19)
            Requirments.shared().iMicroText1 = String(pMacroText23)
            Requirments.shared().mnMicroText1 = mnMicroText.text!
            Requirments.shared().mnOrganicMicroText1 = self.feMicroText.text
            Requirments.shared().cuOrganicMicroText1 = self.cuOrganicMicroText.text
            Requirments.shared().seOrganicMicroText1 = self.seOrganicMicroText.text
            Requirments.shared().znOrganicMicroText1 = self.znOrganicMicroText.text
            
            Requirments.shared().pMacroText = pMacroText1 * doseinKG
            Requirments.shared().caMacroText = pMacroText2 * doseinKG
            Requirments.shared().mgMacroText = pMacroText3 * doseinKG
            Requirments.shared().kMacroText = pMacroText4 * doseinKG
            Requirments.shared().naMacroText = pMacroText5 * doseinKG
            Requirments.shared().clMacroText = pMacroText6 * doseinKG
            Requirments.shared().sMacroText = pMacroText7 * doseinKG
            Requirments.shared().coMicroText = pMacroText8 * doseinKG
            Requirments.shared().cuMicroText = pMacroText20 * doseinKG
            Requirments.shared().seMicroText = pMacroText21 * doseinKG
            Requirments.shared().znMicroText = pMacroText22 * doseinKG
            Requirments.shared().aiuVitamin = pMacroText15 * doseinKG
            Requirments.shared().diuVitamin = pMacroText16 * doseinKG
            Requirments.shared().eiuVitamin = pMacroText17 * doseinKG
            Requirments.shared().niacinVitamin = pMacroText18 * doseinKG
            Requirments.shared().biotinVitamin = pMacroText19 * doseinKG
            Requirments.shared().iMicroText = pMacroText23 * doseinKG
            Requirments.shared().mnMicroText = pMacroText25 * doseinKG
            
            Requirments.shared().appendPremixValues()
            let currentDateTime = Date()
            let formatter = DateFormatter()
            formatter.timeStyle = .medium
            formatter.dateStyle = .long
            var na = Requirments.shared().rationArrayFinal[14]+Requirments.shared().primexArrayFinal[14]+Requirments.shared().waterArrayFinal[14]
            var cl = Requirments.shared().rationArrayFinal[15]+Requirments.shared().primexArrayFinal[15]+Requirments.shared().waterArrayFinal[15]
            var s = Requirments.shared().rationArrayFinal[16]+Requirments.shared().primexArrayFinal[16]+Requirments.shared().waterArrayFinal[16]
            var k = Requirments.shared().rationArrayFinal[17]+Requirments.shared().primexArrayFinal[17]+Requirments.shared().waterArrayFinal[17]
            
            na = (na / Requirments.shared().DMI) / 39.0
            cl = (cl / Requirments.shared().DMI) / 23.0
            s = (s / Requirments.shared().DMI) / 35.5
            k = (k / Requirments.shared().DMI) / 16
            
            var deb = na + k - cl
            var dcab = na + k - cl - s
            
            deb = (deb * 1000).roundToDecimal(1)
            dcab = (dcab * 1000).roundToDecimal(1)
            
            Requirments.shared().deb = String(deb)
            Requirments.shared().dcab = String(dcab)
            let datetimestamp = formatter.string(from: currentDateTime)
            self.view.isUserInteractionEnabled = true
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SwitchPDFViewController") as? SwitchPDFViewController
            vc?.reportName = "Testing Report"
            vc?.reportDate = datetimestamp
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        
    }
}
