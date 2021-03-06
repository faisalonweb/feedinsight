//
//  wateroneViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 30/06/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseAuth
import FirebaseFirestore

class wateroneViewController: UIViewController , UIGestureRecognizerDelegate{
    
    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var standardbtn: UIButton!
    @IBOutlet weak var custombtn: UIButton!
    @IBOutlet weak var userNameLabel: UILabel!
    let defaults = UserDefaults(suiteName:"User")
    @IBOutlet weak var firstview: UIView!
    @IBOutlet weak var secondview: UIView!
    @IBOutlet var buttonOutlets: [UIButton]!
    let userID = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        self.dismissKey() 
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
        standardbtn.layer.cornerRadius = 8
        custombtn.layer.cornerRadius = 8
        super.viewDidLoad()
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
    @objc func tapOnImageAction() {
        self.tabBarController?.selectedIndex = 2
    }
    @IBAction func buttonspress(_ sender: UIButton) {
        self.buttonOutlets.forEach { (button) in
            if (button === sender && sender.tag == 1) {
                button.backgroundColor = (button === sender && sender.tag == 1) ? UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1) : UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
                button.setTitleColor((button === sender) ? .white : .black, for: .normal)
                firstview.alpha = 1
                secondview.alpha = 0
            }
            else if (button === sender && sender.tag == 2) {
                button.backgroundColor = (button === sender && sender.tag == 2) ? UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1) : UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
                button.setTitleColor((button === sender) ? .white : .black, for: .normal)
                firstview.alpha = 0
                secondview.alpha = 1
            }
            else {
                button.backgroundColor = (button === sender && sender.tag == 1) ? UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1) : UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
                button.setTitleColor((button === sender) ? .white : .black, for: .normal)
                firstview.alpha = 1
                secondview.alpha = 0
            }
        }
    }
    
    @IBAction func skipbutton(_ sender: Any) {
        //let requirments = Requirments()
        Requirments.shared().waterPVal = 0
        Requirments.shared().waterKVal = 0
        Requirments.shared().waterSVal = 0
        Requirments.shared().waterCaVal = 0
        Requirments.shared().waterClVal = 0
        Requirments.shared().waterMgVal = 0
        Requirments.shared().waterNaVal = 0
        Requirments.shared().waterCalculations()
        let vc = storyboard?.instantiateViewController(withIdentifier: "premixViewController") as? premixViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func backBtn(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
}
