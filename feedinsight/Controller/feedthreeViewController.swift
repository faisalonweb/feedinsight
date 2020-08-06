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

class feedthreeViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource {
    @IBOutlet weak var addfeed: DropDown!
    
    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var addbtn: UIButton!
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var editBtn: UIButton!
    
    @IBOutlet weak var plusbutton: UIButton!
    
    
    var dropdownvalues = [String]()
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


