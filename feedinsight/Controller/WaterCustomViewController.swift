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
    let userID = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func saveOnClick(_ sender: Any) {
        let db = Firestore.firestore()
        let alertController = UIAlertController(title: "Report Name", message: "", preferredStyle: .alert)
        let withdrawAction = UIAlertAction(title: "Save", style: .default) { (aciton) in
        let text = alertController.textFields!.first!.text!
            let dict : [String : Any] = ["P" : self.PText.text ?? "none", "Ca" : self.CaText.text ?? "none", "Mg" : self.MgText.text ?? "none","K": self.KText.text ?? "none" , "Na": self.NaText.text ?? "none" , "Cl": self.ClText.text ?? "none", "S": self.S.text ?? "none" , "ReportName" : text]
            
            db.collection("WaterReports").document(self.userID!).collection("WaterReports").addDocument(data: dict){ err in
                if let err = err {
                    //                       SVProgressHUD.dismiss()
                    print("Error adding document: \(err)")
                } else {
                    //                       SVProgressHUD.dismiss()
                    print("Document added")
                }
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
        }
        alertController.addTextField { (textField) in
        textField.placeholder = "Report Name"
        }
        alertController.addAction(withdrawAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func loadOnClick(_ sender: Any) {
    }
    
    @IBAction func nextOnClick(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "premixViewController") as? premixViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}
