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

class wateroneViewController: UIViewController {
    
    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var standardbtn: UIButton!
    @IBOutlet weak var custombtn: UIButton!
    
    
    @IBOutlet weak var firstview: UIView!
    @IBOutlet weak var secondview: UIView!
    @IBOutlet var buttonOutlets: [UIButton]!
    let userID = Auth.auth().currentUser?.uid
    
    
    
    override func viewDidLoad() {
        
        self.navigationController?.isNavigationBarHidden = true
//        let storage = Storage.storage()
//        let storageRef =  storage.reference()
//        let ref = storageRef.child("uploadphotoone")
//        profileimage.sd_setImage(with: ref)
        
        profileimage?.layer.cornerRadius = (profileimage?.frame.size.width ?? 0.0) / 2
        
        
        standardbtn.layer.cornerRadius = 8
        custombtn.layer.cornerRadius = 8
        
        super.viewDidLoad()
        
        
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
    
    
    @IBAction func saveTap(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Report Name", message: "", preferredStyle: .alert)
        let withdrawAction = UIAlertAction(title: "Save", style: .default) { (aciton) in
            let text = alertController.textFields!.first!.text!
            print(text)
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
    @IBAction func loadTap(_ sender: UIButton) {
    }
    
    @IBAction func skipbutton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "premixViewController") as? premixViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func nextTap(_ sender: UIButton) {
        //          let vc = storyboard?.instantiateViewController(withIdentifier: "report") as? PreviewViewController
        //               self.navigationController?.pushViewController(vc!, animated: true)
        let vc = storyboard?.instantiateViewController(withIdentifier: "premixViewController") as? premixViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    
}
