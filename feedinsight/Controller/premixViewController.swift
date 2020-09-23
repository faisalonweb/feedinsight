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
    let userID = Auth.auth().currentUser?.uid
    var premixStatus : Bool = false
    var DocumentId : String = ""
    var ReportName : String = ""
    let defaults = UserDefaults.standard
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
    var cuMicroMineralData = ""
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
        cuMicroText.text = cuMicroMineralData
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let userName = defaults.value(forKey: "usernameStringKey"){
            self.userNameLabel.text = userName as? String
            print(userName)
        }
        DispatchQueue.main.async { [weak self] in
            let data = self?.defaults.value(forKey: "imageData") as? Data
            if(data != nil) {
                self?.profileimage.image = UIImage(data: data!)
            }
        }
    }
    @IBAction func backBtn(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    @IBAction func saveOnClick(_ sender: Any) {
        
        if (premixStatus == true) {
            // Create Alert
            let dialogMessage = UIAlertController(title: "Premix Profile", message: "", preferredStyle: .alert)
           
            
            // Create OK button with action handler
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
                        } else {
                            SVProgressHUD.showSuccess(withStatus: "Sucess")
                            
                            print("Document added")
                            SVProgressHUD.dismiss()
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
                    } else {
                        SVProgressHUD.showSuccess(withStatus: "Sucess")
                        
                        print("Document added")
                        SVProgressHUD.dismiss()
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
                    } else {
                        SVProgressHUD.showSuccess(withStatus: "Sucess")
                        
                        print("Document added")
                        SVProgressHUD.dismiss()
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
    @IBAction func loadOnClick(_ sender: Any) {
        premixStatus = true
        let vc = storyboard?.instantiateViewController(withIdentifier: "waterrationViewController") as? waterrationViewController
        vc?.screenNAME = "premix"
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func skipButton(_ sender: Any) {
        requirments.productName = productName.text!
        requirments.productDose = Double(productDose.text!) ?? 0.0
        var doseinKG : Double = Double(productDose.text!) ?? 0.0
        doseinKG = doseinKG / 1000
        let pMacroText1 = Double(pMacroText.text!) ?? 0.0
        let pMacroText2 = Double(caMacroText.text!) ?? 0.0
        let pMacroText3 = Double(mgMacroText.text!) ?? 0.0
        let pMacroText4 = Double(kMacroText.text!) ?? 0.0
        let pMacroText5 = Double(naMacroText.text!) ?? 0.0
        let pMacroText6 = Double(clMacroText.text!) ?? 0.0
        let pMacroText7 = Double(sMacroText.text!) ?? 0.0
        let pMacroText8 = Double(coMicroText.text!) ?? 0.0
        let pMacroText9 = Double(cuMicroText.text!) ?? 0.0
        let pMacroText10 = Double(cuOrganicMicroText.text!) ?? 0.0
        let pMacroText11 = Double(seMicroText.text!) ?? 0.0
        let pMacroText12 = Double(seOrganicMicroText.text!) ?? 0.0
        let pMacroText13 = Double(znMicroText.text!) ?? 0.0
        let pMacroText14 = Double(znOrganicMicroText.text!) ?? 0.0
        let pMacroText15 = Double(aiuVitamin.text!) ?? 0.0
        let pMacroText16 = Double(diuVitamin.text!) ?? 0.0
        let pMacroText17 = Double(eiuVitamin.text!) ?? 0.0
        let pMacroText18 = Double(niacinVitamin.text!) ?? 0.0
        let pMacroText19 = Double(biotinVitamin.text!) ?? 0.0
        
        requirments.pMacroText = pMacroText1 * doseinKG
        requirments.caMacroText = pMacroText2 * doseinKG
        requirments.mgMacroText = pMacroText3 * doseinKG
        requirments.kMacroText = pMacroText4 * doseinKG
        requirments.naMacroText = pMacroText5 * doseinKG
        requirments.clMacroText = pMacroText6 * doseinKG
        requirments.sMacroText = pMacroText7 * doseinKG
        requirments.coMicroText = pMacroText8 * doseinKG
        requirments.cuMicroText = pMacroText9 * doseinKG
        requirments.cuOrganicMicroText = pMacroText10 * doseinKG
        requirments.seMicroText = pMacroText11 * doseinKG
        requirments.seOrganicMicroText = pMacroText12 * doseinKG
        requirments.znMicroText = pMacroText13 * doseinKG
        requirments.znOrganicMicroText = pMacroText14 * doseinKG
        requirments.aiuVitamin = pMacroText15 * doseinKG
        requirments.diuVitamin = pMacroText16 * doseinKG
        requirments.eiuVitamin = pMacroText17 * doseinKG
        requirments.niacinVitamin = pMacroText18 * doseinKG
        requirments.biotinVitamin = pMacroText19 * doseinKG
        requirments.appendPremixValues()
        let vc = storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as? ResultsViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        requirments.productName = productName.text!
        requirments.productDose = Double(productDose.text!) ?? 0.0
        var doseinKG : Double = Double(productDose.text!) ?? 0.0
        doseinKG = doseinKG / 1000
        let pMacroText1 = Double(pMacroText.text!) ?? 0.0
        let pMacroText2 = Double(caMacroText.text!) ?? 0.0
        let pMacroText3 = Double(mgMacroText.text!) ?? 0.0
        let pMacroText4 = Double(kMacroText.text!) ?? 0.0
        let pMacroText5 = Double(naMacroText.text!) ?? 0.0
        let pMacroText6 = Double(clMacroText.text!) ?? 0.0
        let pMacroText7 = Double(sMacroText.text!) ?? 0.0
        let pMacroText8 = Double(coMicroText.text!) ?? 0.0
        let pMacroText9 = Double(cuMicroText.text!) ?? 0.0
        let pMacroText10 = Double(cuOrganicMicroText.text!) ?? 0.0
        let totalCu =  cuMicroText.text! + cuOrganicMicroText.text!
        let pMacroText11 = Double(seMicroText.text!) ?? 0.0
        let pMacroText12 = Double(seOrganicMicroText.text!) ?? 0.0
        let totalSe = seMicroText.text! + seOrganicMicroText.text!
        let pMacroText13 = Double(znMicroText.text!) ?? 0.0
        let pMacroText14 = Double(znOrganicMicroText.text!) ?? 0.0
        let totalZn =  znMicroText.text! + znOrganicMicroText.text!
        let pMacroText15 = Double(aiuVitamin.text!) ?? 0.0
        let pMacroText16 = Double(diuVitamin.text!) ?? 0.0
        let pMacroText17 = Double(eiuVitamin.text!) ?? 0.0
        let pMacroText18 = Double(niacinVitamin.text!) ?? 0.0
        let pMacroText19 = Double(biotinVitamin.text!) ?? 0.0
        let pMacroText20 = Double(totalCu) ?? 0.0
        let pMacroText21 = Double(totalSe) ?? 0.0
        let pMacroText22 = Double(totalZn) ?? 0.0
        
        
        requirments.pMacroText = pMacroText1 * doseinKG
        requirments.caMacroText = pMacroText2 * doseinKG
        requirments.mgMacroText = pMacroText3 * doseinKG
        requirments.kMacroText = pMacroText4 * doseinKG
        requirments.naMacroText = pMacroText5 * doseinKG
        requirments.clMacroText = pMacroText6 * doseinKG
        requirments.sMacroText = pMacroText7 * doseinKG
        requirments.coMicroText = pMacroText8 * doseinKG
        requirments.cuMicroText = pMacroText20 * doseinKG
        //requirments.cuOrganicMicroText = pMacroText10 * doseinKG
        requirments.seMicroText = pMacroText21 * doseinKG
        //requirments.seOrganicMicroText = pMacroText12 * doseinKG
        requirments.znMicroText = pMacroText22 * doseinKG
        //requirments.znOrganicMicroText = pMacroText14 * doseinKG
        requirments.aiuVitamin = pMacroText15 * doseinKG
        requirments.diuVitamin = pMacroText16 * doseinKG
        requirments.eiuVitamin = pMacroText17 * doseinKG
        requirments.niacinVitamin = pMacroText18 * doseinKG
        requirments.biotinVitamin = pMacroText19 * doseinKG
        requirments.appendPremixValues()
        let vc = storyboard?.instantiateViewController(withIdentifier: "ResultsViewController") as? ResultsViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
