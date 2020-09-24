//
//  WaterCustomViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 12/08/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseAuth
import FirebaseFirestore
import SVProgressHUD

class WaterCustomViewController: UIViewController {
    
    @IBOutlet weak var P: UILabel!
    @IBOutlet weak var Ca: UILabel!
    @IBOutlet weak var Mg: UILabel!
    @IBOutlet weak var K: UILabel!
    @IBOutlet weak var Cl: UILabel!
    @IBOutlet weak var Na: UILabel!
    @IBOutlet weak var S: UILabel!
    @IBOutlet weak var PText: UITextField!
    @IBOutlet weak var CaText: UITextField!
    @IBOutlet weak var MgText: UITextField!
    @IBOutlet weak var KText: UITextField!
    @IBOutlet weak var NaText: UITextField!
    @IBOutlet weak var ClText: UITextField!
    @IBOutlet weak var SText: UITextField!
    var waterStatus : Bool = false
    var documentID : String = ""
    var reportName : String = ""
    let userID = Auth.auth().currentUser?.uid    
    override func viewDidLoad() {
        self.dismissKey() 
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(doThisWhenNotify),
                                               name: NSNotification.Name(rawValue: "myNotificationKey"),
                                               object: nil)
        super.viewDidLoad()
    }
    @objc func doThisWhenNotify(notification: NSNotification) {
        print(notification.userInfo ?? "")
        if let dict = notification.userInfo as NSDictionary? {
            PText.text = dict["P"] as? String
            CaText.text = dict["Ca"] as? String
            MgText.text = dict["Mg"] as? String
            KText.text = dict["K"] as? String
            NaText.text = dict["Na"] as? String
            ClText.text = dict["Cl"] as? String
            SText.text = dict["S"] as? String
            SText.text = dict["S"] as? String
            reportName = (dict["ReportName"] as? String)!
            documentID = (dict["DocId"] as? String)!
            waterStatus = (dict["waterStatus"] as? Bool)!
        }
    }
    @IBAction func saveOnClick(_ sender: Any) {
        if(waterStatus == true){
            // Create Alert
            let dialogMessage = UIAlertController(title: "Water Profile", message: "", preferredStyle: .alert)
            
            // Create OK button with action handler
            let new = UIAlertAction(title: "Save as New", style: .default, handler: { (action) -> Void in
                let currentDateTime = Date()
                let formatter = DateFormatter()
                formatter.timeStyle = .medium
                formatter.dateStyle = .long
                let datetimestamp = formatter.string(from: currentDateTime)
                let db = Firestore.firestore()
                let alertController = UIAlertController(title: "Water Profile", message: "", preferredStyle: .alert)
                let withdrawAction = UIAlertAction(title: "Save", style: .default) { (aciton) in
                    SVProgressHUD.show(withStatus: "it's working ...")
                    let text = alertController.textFields!.first!.text!
                    //                let dict : [String : Any] = ["P" : self.PText.text ?? "none", "Ca" : self.CaText.text ?? "none", "Mg" : self.MgText.text ?? "none","K": self.KText.text ?? "none" , "Na": self.NaText.text ?? "none" , "Cl": self.ClText.text ?? "none", "S": self.SText.text ?? "none" , "ReportName" : text,"currentdatetime": datetimestamp]
                    let newDocument =  db.collection("waterReports").document(self.userID!).collection("waterReports").document()
                    newDocument.setData(["P" : self.PText.text ?? "none", "Ca" : self.CaText.text ?? "none", "Mg" : self.MgText.text ?? "none","K": self.KText.text ?? "none" , "Na": self.NaText.text ?? "none" , "Cl": self.ClText.text ?? "none", "S": self.SText.text ?? "none" , "ReportName" : text,"currentdatetime": datetimestamp , "DocId": newDocument.documentID]){ err in
                        if let err = err {
                            //                       SVProgressHUD.dismiss()
                           SVProgressHUD.showError(withStatus: "Error")
                            
                            print("Error adding document: \(err)")
                            SVProgressHUD.dismiss()
                        } else {
                            //                       SVProgressHUD.dismiss()
                            SVProgressHUD.showSuccess(withStatus: "Sucess")
                            
                            print("Document added")
                            SVProgressHUD.dismiss()
                        }
                    }
                }
                let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
                }
                alertController.addTextField { (textField) in
                    textField.placeholder = "Water Profile"
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
                let newDocument =  db.collection("waterReports").document(self.userID!).collection("waterReports").document(self.documentID)
                newDocument.setData(["P" : self.PText.text ?? "none", "Ca" : self.CaText.text ?? "none", "Mg" : self.MgText.text ?? "none","K": self.KText.text ?? "none" , "Na": self.NaText.text ?? "none" , "Cl": self.ClText.text ?? "none", "S": self.SText.text ?? "none" , "ReportName" : self.reportName,"currentdatetime": datetimestamp, "DocId": newDocument.documentID]){ err in
                    if let err = err {
                        //                       SVProgressHUD.dismiss()
                       SVProgressHUD.showError(withStatus: "Error")
                        
                        print("Error adding document: \(err)")
                        SVProgressHUD.dismiss()
                    } else {
                        //                       SVProgressHUD.dismiss()
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
            let alertController = UIAlertController(title: "Water Profile", message: "", preferredStyle: .alert)
            let withdrawAction = UIAlertAction(title: "Save", style: .default) { (aciton) in
                SVProgressHUD.show(withStatus: "it's working ...")
                let text = alertController.textFields!.first!.text!
                //                let dict : [String : Any] = ["P" : self.PText.text ?? "none", "Ca" : self.CaText.text ?? "none", "Mg" : self.MgText.text ?? "none","K": self.KText.text ?? "none" , "Na": self.NaText.text ?? "none" , "Cl": self.ClText.text ?? "none", "S": self.SText.text ?? "none" , "ReportName" : text,"currentdatetime": datetimestamp]
                let newDocument =  db.collection("waterReports").document(self.userID!).collection("waterReports").document()
                newDocument.setData(["P" : self.PText.text ?? "none", "Ca" : self.CaText.text ?? "none", "Mg" : self.MgText.text ?? "none","K": self.KText.text ?? "none" , "Na": self.NaText.text ?? "none" , "Cl": self.ClText.text ?? "none", "S": self.SText.text ?? "none" , "ReportName" : text,"currentdatetime": datetimestamp , "DocId": newDocument.documentID]){ err in
                    if let err = err {
                        //                       SVProgressHUD.dismiss()
                        SVProgressHUD.showError(withStatus: "Error")
                        
                        print("Error adding document: \(err)")
                        SVProgressHUD.dismiss()
                    } else {
                        //                       SVProgressHUD.dismiss()
                        SVProgressHUD.showSuccess(withStatus: "Sucess")
                        
                        print("Document added")
                        SVProgressHUD.dismiss()
                    }
                }
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
            }
            alertController.addTextField { (textField) in
                textField.placeholder = "Water Profile"
            }
            alertController.addAction(withdrawAction)
            alertController.addAction(cancelAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    @IBAction func loadOnClick(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "waterrationViewController") as? waterrationViewController
        vc?.screenNAME = "water"
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func nextOnClick(_ sender: Any) {
        //let requirments = Requirments()
        Requirments.shared().waterPVal = Double(PText.text!) ?? 0.0
        Requirments.shared().waterKVal = Double(KText.text!) ?? 0.0
        Requirments.shared().waterSVal = Double(SText.text!) ?? 0.0
        Requirments.shared().waterCaVal = Double(CaText.text!) ?? 0.0
        Requirments.shared().waterClVal = Double(ClText.text!) ?? 0.0
        Requirments.shared().waterMgVal = Double(MgText.text!) ?? 0.0
        Requirments.shared().waterNaVal = Double(NaText.text!) ?? 0.0
        Requirments.shared().waterCalculations()
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "premixViewController") as? premixViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
