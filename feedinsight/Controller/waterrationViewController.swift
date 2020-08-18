//
//  waterrationViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 17/08/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseAuth
import FirebaseFirestore

class waterrationViewController: UIViewController , UITableViewDataSource , UITableViewDelegate{
    
    
    @IBOutlet weak var tblView: UITableView!
    //var reportDateList =  ["one","two","three","three","three","three", "three"]
    @IBOutlet weak var profileimage: UIImageView!
    
    var reportNameList = [String]()
    var reportDateList = [String]()
    var reportValueList = [String]()
    private var datastation = [String]()
    private var dataonestation = [String]()
    private var datatwostation = [String]()
  
    override func viewDidLoad() {
        tblView.isHidden = true
        super.viewDidLoad()
        profileimage?.layer.cornerRadius = (profileimage?.frame.size.width ?? 0.0) / 2
        Firestore.firestore().collection("RationReports").document(Auth.auth().currentUser?.uid ?? "").collection("RationReports").getDocuments{(snapshot,error) in
            
            if error == nil && snapshot != nil {
                guard let snap = snapshot else {return}
                for document in snap.documents {
                    let documentData = document.data()
//                    let animaltype = documentData[ProductNameArray] as? String ?? "Anonymous"
                    let ReportName = documentData["ReportName"] as? String ?? "Anonymous"
                    let timestamp = documentData["currenttimedate"] as? String ?? "20/20/20"
                    
                    
                    
                    self.datastation.insert(ReportName, at: 0)
                    self.dataonestation.insert(timestamp, at: 0)
                    
                }
                
                self.reportNameList.append(contentsOf: self.datastation)
                self.reportDateList.append(contentsOf: self.dataonestation)
                
                self.tblView.reloadData()
                print("report nsme is \(self.reportDateList)")
                
            }
            else {
                print("pakis")
            }
        }
        
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    @IBAction func tableviewClick(_ sender: Any) {
        if tblView.isHidden {
            animate(toggle: true)
        } else {
            animate(toggle: false)
        }
        
    }
    func animate (toggle: Bool) {
        if toggle {
            UIView.animate(withDuration: 0.3) {
                self.tblView.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.tblView.isHidden = true
            }
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return reportDateList.count
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
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! waterrationTableViewCell
        
        cell.label?.text = reportNameList[indexPath.section]
        cell.date?.text = reportDateList[indexPath.section]
        cell.layer.cornerRadius = 10
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    //     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //
    //         let vcone = storyboard?.instantiateViewController(withIdentifier: "StateView") as? StateViewController;
    //         vcone?.nameanimal = animalList[indexPath.section]
    //
    //
    //         self.navigationController?.pushViewController(vcone!, animated: true)
    //     }
    
    
}
