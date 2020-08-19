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
    var reportProductList = [String]()
    var reportValueList = [String]()
    var CaList = [String]()
    var ClList = [String]()
    var MgList = [String]()
    var NaList = [String]()
    var KList = [String]()
    var PList = [String]()
    var SList = [String]()
    private var datastation = [String]()
    private var dataonestation = [String]()
    private var datatwostation = [String]()
    private var datathreestation = [String]()
    private var datafourstation = [String]()
    private var datafivestation = [String]()
    private var datasixstation = [String]()
    private var datasevenstation = [String]()
    private var dataeightstation = [String]()
    
    @IBOutlet weak var changeableLabel: UILabel!
    var screenNAME : String = ""
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        self.tblView.refreshControl = UIRefreshControl()
        self.tblView.refreshControl?.beginRefreshing()
        if(self.screenNAME == "water") {
            changeableLabel.text = "Water Reports"
            Firestore.firestore().collection("WaterReports").document(Auth.auth().currentUser?.uid ?? "").collection("WaterReports").getDocuments{(snapshot,error) in
                
                if error == nil && snapshot != nil {
                    guard let snap = snapshot else {return}
                    for document in snap.documents {
                        let documentData = document.data()
                        //                    let animaltype = documentData[ProductNameArray] as? String ?? "Anonymous"
                        let ReportName = documentData["ReportName"] as? String ?? "Anonymous"
                        let timestamp = documentData["currentdatetime"] as? String ?? "20/20/20"
                        let PName = documentData["P"] as? String ?? "Anonymous"
                        let CaName = documentData["Ca"] as? String ?? "Anonymous"
                        let MgName = documentData["Mg"] as? String ?? "Anonymous"
                        let KName = documentData["K"] as? String ?? "Anonymous"
                        let NaName = documentData["Na"] as? String ?? "Anonymous"
                        let ClName = documentData["Cl"] as? String ?? "Anonymous"
                        let SName = documentData["S"] as? String ?? "Anonymous"
                        
                        self.datastation.insert(ReportName, at: 0)
                        self.dataonestation.insert(timestamp, at: 0)
                        self.datatwostation.insert(CaName, at: 0)
                        self.datathreestation.insert(ClName, at: 0)
                        self.datafourstation.insert(MgName, at: 0)
                        self.datafivestation.insert(NaName, at: 0)
                        self.datasixstation.insert(KName, at: 0)
                        self.datasevenstation.insert(PName, at: 0)
                        self.dataeightstation.insert(SName, at: 0)
                        
                    }
                    self.reportNameList.append(contentsOf: self.datastation)
                    self.reportDateList.append(contentsOf: self.dataonestation)
                    self.CaList.append(contentsOf: self.datatwostation)
                    self.ClList.append(contentsOf: self.datathreestation)
                    self.MgList.append(contentsOf: self.datafourstation)
                    self.NaList.append(contentsOf: self.datafivestation)
                    self.KList.append(contentsOf: self.datasixstation)
                    self.PList.append(contentsOf: self.datasevenstation)
                    self.SList.append(contentsOf: self.dataeightstation)
                    self.tblView.reloadData()
                    print("report name is \(self.CaList)")
                    print("report Data is \(self.CaList)")
                    
                    self.tblView.refreshControl?.endRefreshing()
                    
                    
                    
                    
                }
                else {
                    print("pakis")
                }
            }
        } else if (self.screenNAME == "ration") {
            changeableLabel.text = "Ration Reports"
            Firestore.firestore().collection("RationReports").document(Auth.auth().currentUser?.uid ?? "").collection("RationReports").getDocuments{(snapshot,error) in
                
                if error == nil && snapshot != nil {
                    guard let snap = snapshot else {return}
                    for document in snap.documents {
                        let documentData = document.data()
                        //                    let animaltype = documentData[ProductNameArray] as? String ?? "Anonymous"
                        let ReportName = documentData["ReportName"] as? String ?? "Anonymous"
                        let timestamp = documentData["currenttimedate"] as? String ?? "20/20/20"
                        var nameArray = [String]()
                        nameArray = documentData["ProductNameArray"] as! [String]
                        var valueArray = [String]()
                        valueArray = documentData["ProductValueArray"] as! [String]
                        self.datastation.insert(ReportName, at: 0)
                        self.dataonestation.insert(timestamp, at: 0)
                        self.datatwostation.insert(contentsOf: nameArray, at: 0) // Name array
                        self.datathreestation.insert(contentsOf: valueArray, at: 0) // Value array
                        
                    }
                    self.reportNameList.append(contentsOf: self.datastation)
                    self.reportDateList.append(contentsOf: self.dataonestation)
                    self.reportProductList.append(contentsOf: self.datatwostation)
                    self.reportValueList.append(contentsOf: self.datathreestation)
                    self.tblView.reloadData()
                    print("report name is \(self.reportProductList)")
                    print("report Data is \(self.reportValueList)")
                    
                    
                    self.tblView.refreshControl?.endRefreshing()
                    
                    
                    
                }
                else {
                    print("pakis")
                }
            }
        }
        profileimage?.layer.cornerRadius = (profileimage?.frame.size.width ?? 0.0) / 2
        
        
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    //    @IBAction func tableviewClick(_ sender: Any) {
    //        if tblView.isHidden {
    //            animate(toggle: true)
    //        } else {
    //            animate(toggle: false)
    //        }
    //
    //    }
    //    func animate (toggle: Bool) {
    //        if toggle {
    //            UIView.animate(withDuration: 0.3) {
    //                self.tblView.isHidden = false
    //            }
    //        } else {
    //            UIView.animate(withDuration: 0.3) {
    //                self.tblView.isHidden = true
    //            }
    //        }
    //    }
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (screenNAME == "ration") {
            let vcone = storyboard?.instantiateViewController(withIdentifier: "feedthreeViewController") as? feedthreeViewController;
            vcone?.dropdownvalues = reportProductList
            vcone?.dropdownfloatValue = reportValueList
            self.navigationController?.pushViewController(vcone!, animated: true)
        }
        else {
            var addressDict = [String:AnyObject]()
            addressDict["P"] = PList[indexPath.section] as AnyObject
            addressDict["Ca"] = CaList[indexPath.section] as AnyObject
            addressDict["Mg"] = MgList[indexPath.section] as AnyObject
            addressDict["K"] = KList[indexPath.section] as AnyObject
            addressDict["Na"] = NaList[indexPath.section] as AnyObject
            addressDict["Cl"] = ClList[indexPath.section] as AnyObject
            addressDict["S"] = SList[indexPath.section] as AnyObject
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "myNotificationKey"), object: nil, userInfo: addressDict)
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
        }
    }
    
    
}
