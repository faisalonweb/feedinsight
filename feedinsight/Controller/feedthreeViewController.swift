//
//  feedthreeViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 21/07/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import iOSDropDown
import Firebase
import FirebaseUI
import FirebaseAuth
import FirebaseFirestore

class feedthreeViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource, feedthreeTableViewCellDelegate {
    func minusTapped(cellIndex: Int) {
        dropdownvalues.remove(at: cellIndex)
        tblView.reloadData()
    }
    
    @IBOutlet weak var addfeed: DropDown!
    
    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var addbtn: UIButton!
    @IBOutlet weak var tblView: UITableView!
     let userID = Auth.auth().currentUser?.uid
    
    @IBOutlet weak var editBtn: UIButton!
    
    @IBOutlet weak var plusbutton: UIButton!
    
    
    var dropdownvalues = [String]()
    var dropdownfloatValue = [String]()
    //    var dropdownvalues = ["one","tow","three"]
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()
        let storage = Storage.storage()
        let storageRef =  storage.reference()
        let ref = storageRef.child("uploadphotoone")
        profileimage.sd_setImage(with: ref)
        
        
        profileimage?.layer.cornerRadius = (profileimage?.frame.size.width ?? 0.0) / 2
        addbtn.layer.cornerRadius = 8
        editBtn.layer.cornerRadius = 8
        plusbutton.layer.cornerRadius = 28
        
        addfeed.optionArray = ["Cow","Deer","Camel"]
        addfeed.didSelect{(selectedText , index ,id) in
        }
        
        //        print(addfeed.text ?? "none")
        
    }
    
    @IBAction func backBtn(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    
    @IBAction func nextTap(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "waterViewController") as? wateroneViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        for i in 0..<dropdownvalues.count {
            let indexPath = IndexPath(row: 0, section: i)
            if let cell = tblView.cellForRow(at: indexPath) as? feedthreeTableViewCell {
                dropdownfloatValue.append(cell.productValue.text ?? "0")
            }
        }
        let db = Firestore.firestore()
        let alertController = UIAlertController(title: "Report Name", message: "", preferredStyle: .alert)
        let withdrawAction = UIAlertAction(title: "Save", style: .default) { (aciton) in
        let text = alertController.textFields!.first!.text!
            let dict : [String : Any] = ["ProductNameArray" : self.dropdownvalues , "ProductValueArray" : self.dropdownfloatValue , "ReportName" : text]
            
            db.collection("RationReports").document(self.userID!).collection("RationReports").addDocument(data: dict){ err in
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
    
    @IBAction func touchaddbtn(_ sender: Any) {
        
        if addfeed.text == "" {
            self.showError("Select dropdown value")
        }
        else {
            print(addfeed.text ?? "none")
            dropdownvalues.append(addfeed.text ?? "none")
            print("paki")
            print("array values is \(dropdownvalues)")
            tblView.reloadData()
        }
        
    }
    
    func showError(_ message:String) {
        
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! feedthreeTableViewCell
        cell.labeltxt?.text = dropdownvalues[indexPath.section]
        cell.delegate = self
        cell.cellIndex = indexPath.section
        return cell
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dropdownvalues.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    
    
    
    
}


