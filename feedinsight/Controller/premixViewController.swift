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

class premixViewController: UIViewController {
    
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
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.isNavigationBarHidden = true
        profileimage?.layer.cornerRadius = (profileimage?.frame.size.width ?? 0.0) / 2
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
        seOrganicMicroText.text = seMicroMineralData
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
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        let datetimestamp = formatter.string(from: currentDateTime)
        let db = Firestore.firestore()
        let alertController = UIAlertController(title: "Report Name", message: "", preferredStyle: .alert)
        let withdrawAction = UIAlertAction(title: "Save", style: .default) { (aciton) in
            let text = alertController.textFields!.first!.text!
            let dict : [String : Any] = ["productName": self.productName.text ?? "none", "productDose" : self.productDose.text ?? "none", "pMacroMineral" : self.pMacroText.text ?? "none","caMacroMineral": self.caMacroText.text ?? "none" , "mgMacroMineral": self.mgMacroText.text ?? "none" , "kMacroMineral": self.kMacroText.text ?? "none", "naMacroMineral": self.naMacroText.text ?? "none" , "clMacroMineral": self.clMacroText.text ?? "none" , "sMacroMineral": self.sMacroText.text ?? "none","coMicroMineral": self.coMicroText.text ?? "none","cu(inorganic)MicroMineral": self.cuMicroText.text ?? "none","cu(organic)MicroMineral": self.cuOrganicMicroText.text ?? "none","se(inorganic)MicroMineral": self.seMicroText.text ?? "none","se(organic)MicroMineral": self.seOrganicMicroText.text ?? "none","zn(inorganic)MicroMineral": self.znMicroText.text ?? "none","zn(organic)MicroMineral": self.znOrganicMicroText.text ?? "none","aiuVitamin": self.aiuVitamin.text ?? "none","diuVitamin": self.diuVitamin.text ?? "none","eiuVitamin": self.eiuVitamin.text ?? "none","niacinVitamin": self.niacinVitamin.text ?? "none","biotinVitamin": self.biotinVitamin.text ?? "none","ReportName" : text,"currentdatetime": datetimestamp]
            
            db.collection("premixReports").document(self.userID!).collection("premixReports").addDocument(data: dict){ err in
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
        let vc = storyboard?.instantiateViewController(withIdentifier: "waterrationViewController") as? waterrationViewController
        vc?.screenNAME = "premix"
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func skipButton(_ sender: Any) {
        requirments.productName = productName.text!
        requirments.productDose = Double(productDose.text!) ?? 0.0
        var doseinKG : Double = Double(productDose.text!) ?? 0.0
        doseinKG = doseinKG / 1000
        requirments.pMacroText = Double(pMacroText.text!) ?? 0.0 * doseinKG
        requirments.caMacroText = Double(caMacroText.text!) ?? 0.0 * doseinKG
        requirments.mgMacroText = Double(mgMacroText.text!) ?? 0.0 * doseinKG
        requirments.kMacroText = Double(kMacroText.text!) ?? 0.0 * doseinKG
        requirments.naMacroText = Double(naMacroText.text!) ?? 0.0 * doseinKG
        requirments.clMacroText = Double(clMacroText.text!) ?? 0.0 * doseinKG
        requirments.sMacroText = Double(sMacroText.text!) ?? 0.0 * doseinKG
        requirments.coMicroText = Double(coMicroText.text!) ?? 0.0 * doseinKG
        requirments.cuMicroText = Double(cuMicroText.text!) ?? 0.0 * doseinKG
        requirments.cuOrganicMicroText = Double(cuOrganicMicroText.text!) ?? 0.0 * doseinKG
        requirments.seMicroText = Double(seMicroText.text!) ?? 0.0 * doseinKG
        requirments.seOrganicMicroText = Double(seOrganicMicroText.text!) ?? 0.0  * doseinKG
        requirments.znMicroText = Double(znMicroText.text!) ?? 0.0 * doseinKG
        requirments.znOrganicMicroText = Double(znOrganicMicroText.text!) ?? 0.0 * doseinKG
        requirments.aiuVitamin = Double(aiuVitamin.text!) ?? 0.0 * doseinKG
        requirments.diuVitamin = Double(diuVitamin.text!) ?? 0.0 * doseinKG
        requirments.eiuVitamin = Double(eiuVitamin.text!) ?? 0.0 * doseinKG
        requirments.niacinVitamin = Double(niacinVitamin.text!) ?? 0.0 * doseinKG
        requirments.biotinVitamin = Double(biotinVitamin.text!) ?? 0.0 * doseinKG
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
    }
    
}
