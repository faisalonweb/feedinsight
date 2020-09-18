//
//  WaterStandardViewController.swift
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

class WaterStandardViewController: UIViewController {
    
    @IBOutlet weak var P: UILabel!
    @IBOutlet weak var Ca: UILabel!
    @IBOutlet weak var Mg: UILabel!
    @IBOutlet weak var K: UILabel!
    @IBOutlet weak var Na: UILabel!
    @IBOutlet weak var Cl: UILabel!
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
        self.dismissKey() 
        super.viewDidLoad()
    }
    
    @IBAction func nextOnClick(_ sender: Any) {
        //let requirments = Requirments()
        requirments.waterPVal = 0.0
        requirments.waterKVal = 3
        requirments.waterSVal = 50
        requirments.waterCaVal = 10
        requirments.waterClVal = 67
        requirments.waterMgVal = 10
        requirments.waterNaVal = 260
        requirments.waterCalculations()
        let vc = storyboard?.instantiateViewController(withIdentifier: "premixViewController") as? premixViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
