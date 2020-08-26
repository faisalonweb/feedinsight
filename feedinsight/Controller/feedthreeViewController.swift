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
    var dropdownvalues = [String]()
    var dropdownfloatValue = [String]()
    var getNameData = [String]()
    var getValueData = [String]()
    let userID = Auth.auth().currentUser?.uid
    @IBOutlet weak var addfeed: DropDown!
    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var addbtn: UIButton!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var plusbutton: UIButton!
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()
        profileimage?.layer.cornerRadius = (profileimage?.frame.size.width ?? 0.0) / 2
        addbtn.layer.cornerRadius = 8
        editBtn.layer.cornerRadius = 8
        plusbutton.layer.cornerRadius = 28
        addfeed.optionArray = ["Cow","Deer","Camel"]
        addfeed.didSelect{(selectedText , index ,id) in
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.main.async { [weak self] in
            let data = self?.defaults.value(forKey: "imageData") as? Data
            if(data != nil) {
                self?.profileimage.image = UIImage(data: data!)
            }
        }
    }
    func minusTapped(cellIndex: Int) {
        dropdownvalues.remove(at: cellIndex)
        dropdownfloatValue.remove(at: cellIndex)
        tblView.reloadData()
    }
    @IBAction func backBtn(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    @IBAction func onClickLoad(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "waterrationViewController") as? waterrationViewController
        vc?.screenNAME = "ration"
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func nextTap(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "waterViewController") as? wateroneViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func saveButtonPressed(_ sender: Any) {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        let datetimestamp = formatter.string(from: currentDateTime)
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
            let dict : [String : Any] = ["ProductNameArray" : self.dropdownvalues , "ProductValueArray" : self.dropdownfloatValue , "ReportName" : text ,"currenttimedate" : datetimestamp]
            db.collection("rationReports").document(self.userID!).collection("rationReports").addDocument(data: dict){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
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
        } else {
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
        if(dropdownfloatValue.count > 0) {
            cell.productValue?.text = dropdownfloatValue[indexPath.section]
        }
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


