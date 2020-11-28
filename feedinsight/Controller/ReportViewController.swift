//
//  ReportViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 23/09/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseAuth
import FirebaseFirestore
import SwiftMessages

class ReportViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var hiddenView: UIView!
    var db = Firestore.firestore()
    let userID = Auth.auth().currentUser?.uid
    private var companyNameStation = [String]()
    private var ruminantTypeStation = [String]()
    private var animalGroupStation = [String]()
    private var psyStateStation = [String]()
    private var pdfDatestation = [String]()
    private var referenceStation = [String]()
    private var preparedStation = [String]()
    private var pdfReportTypeStation = [String]()
    private var documentIdStation = [String]()
    let defaults = UserDefaults(suiteName:"User")
    var companyNameList = [String]()
    var ruminantTypeList = [String]()
    var animalGroupList = [String]()
    var psychologicalList = [String]()
    var pdfDateList = [String]()
    var pdfReference = [String]()
    var preparedBy = [String]()
    var reportType = [String]()
    var DocumentIdList = [String]()
    var copyArray = [NSDictionary]()
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        if let userName = defaults!.value(forKey: "usernameStringKey"){
            self.userName.text = userName as? String
            print(userName)
        }
        DispatchQueue.global().async {
            DispatchQueue.main.async {
                let data = self.defaults!.value(forKey: "imageData") as? Data
                if(data != nil) {
                    self.profileImage.image = UIImage(data: data!)
                }
            }
        }
    }
    
    @objc func tapOnImageAction() {
        self.tabBarController?.selectedIndex = 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage?.layer.cornerRadius = (profileImage?.frame.size.width ?? 0.0) / 2
        profileImage?.clipsToBounds = true
        profileImage?.layer.borderWidth = 3.0
        profileImage?.layer.borderColor = UIColor.white.cgColor
        let tapOnImage = UITapGestureRecognizer.init(target: self, action: #selector(tapOnImageAction))
        self.profileImage.addGestureRecognizer(tapOnImage)
        self.profileImage.isUserInteractionEnabled = true
        self.tableView.refreshControl = UIRefreshControl()
        self.tableView.refreshControl?.beginRefreshing()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        Firestore.firestore().collection("pdfReports").document(Auth.auth().currentUser?.uid ?? "").collection("pdfReports").getDocuments{(snapshot,error) in
            
            if error == nil && snapshot != nil {
                guard let snap = snapshot else {return}
                var i = 0
                if snap.documents.count > 0 {
                    for document in snap.documents {
                        let documentData = document.data()
                        let compnayName = documentData["CompanyName"] as? String ?? "Anonymous"
                        let ruminantType = documentData["ruminantType"] as? String ?? "Anonymous"
                        let ruminantGroup = documentData["ruminantGroup"] as? String ?? "Anonymous"
                        let rumiState = documentData["ruminantState"] as? String ?? "Anonymous"
                        let pdfReference = documentData["ReportName"] as? String ?? "Anonymous"
                        let pdfprepared = documentData["preparedBy"] as? String ?? "Anonymous"
                        let pdfReportType = documentData["reportType"] as? String ?? "Anonymous"
                        let timestamp = documentData["currentdatetime"] as? String ?? "20/20/20"
                        let documentiddata = documentData["DocId"] as? String ?? "20/20/20"
                        self.companyNameStation.insert(compnayName, at: i)
                        self.ruminantTypeStation.insert(ruminantType, at: i)
                        self.animalGroupStation.insert(ruminantGroup, at: i)
                        self.psyStateStation.insert(rumiState, at: i)
                        self.referenceStation.insert(pdfReference, at: i)
                        self.preparedStation.insert(pdfprepared, at: i)
                        self.pdfReportTypeStation.insert(pdfReportType, at: i)
                        self.pdfDatestation.insert(timestamp, at: i)
                        self.documentIdStation.insert(documentiddata, at: i)
                        i = i + 1
                        self.copyArray.append(documentData as NSDictionary)
                    }
                    self.companyNameList.append(contentsOf: self.companyNameStation)
                    self.ruminantTypeList.append(contentsOf: self.ruminantTypeStation)
                    self.animalGroupList.append(contentsOf: self.animalGroupStation)
                    self.psychologicalList.append(contentsOf: self.psyStateStation)
                    self.pdfDateList.append(contentsOf: self.pdfDatestation)
                    self.pdfReference.append(contentsOf: self.referenceStation)
                    self.preparedBy.append(contentsOf: self.preparedStation)
                    self.reportType.append(contentsOf: self.pdfReportTypeStation)
                    self.DocumentIdList.append(contentsOf: self.documentIdStation)
                    self.tableView.reloadData()
                    self.tableView.refreshControl?.endRefreshing()
                }
                else {
                    self.tableView.alpha = 0
                    self.hiddenView.alpha = 1
                }
                
            } else {
                print("pakis")
                
            }
        }
    }

}
extension ReportViewController: UITableViewDelegate , UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return pdfReference.count
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PDFTableViewCell
        
        cell.animalLabel?.text = pdfReference[indexPath.section]
        cell.dateLabel?.text = pdfDateList[indexPath.section]
        cell.layer.cornerRadius = 10
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

//        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (rowAction, indexPath) in
//            //TODO: edit the row at indexPath here
//            let alertController = UIAlertController(title: "Edit Report Name", message: "", preferredStyle: .alert)
//            let withdrawAction = UIAlertAction(title: "Change", style: .default) { [self] (aciton) in
//
//                self.view.isUserInteractionEnabled = false
//                let text = alertController.textFields!.first!.text!
//                //let db = Firestore.firestore()
//                let newDocument = db.collection("pdfReports").document(userID!).collection("pdfReports").document(self.DocumentIdList[indexPath.section])
//                newDocument.setData(["ReportName" : text, "DocId" : newDocument.documentID],merge: true){ err in
//                    if let err = err {
//                        print("Error adding document: \(err)")
//                        let view = MessageView.viewFromNib(layout: .cardView)
//                        view.configureTheme(.error)
//                        view.configureDropShadow()
//                        view.configureContent(title: "Error", body: "Request Failed!")
//                        SwiftMessages.show(view: view)
//                        self.view.isUserInteractionEnabled = true
//                    } else {
//                        pdfReference[indexPath.section] = text
//                        self.tableView.reloadData()
//                        print("Document added")
//                        let view = MessageView.viewFromNib(layout: .cardView)
//                        view.configureTheme(.success)
//                        view.configureDropShadow()
//                        view.configureContent(title: "Success", body: "Report name change successfully")
//                        SwiftMessages.show(view: view)
//                        self.view.isUserInteractionEnabled = true
//
//                    }
//                }
//
//            }
//            let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
//            }
//            alertController.addTextField { (textField) in
//                textField.placeholder = "Report Name"
//            }
//            alertController.addAction(withdrawAction)
//            alertController.addAction(cancelAction)
//            alertController.textFields!.first!.text! = self.pdfReference[indexPath.section]
//            self.present(alertController, animated: true, completion: nil)
//        }
//        editAction.backgroundColor = UIColor(red: 81/255, green: 23/255.0, blue: 79/255.0, alpha: 1.0)

        let deleteAction = UITableViewRowAction(style: .normal, title: "Delete") { (rowAction, indexPath) in
            let alert = UIAlertController(title: "Delete Report", message: "Are you sure you want to delete this report?", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Yes", style: .destructive, handler: { action in
                self.db.collection("pdfReports").document(self.userID!).collection("pdfReports").whereField("DocId", isEqualTo: self.DocumentIdList[indexPath.section]).getDocuments { (querySnapshot, error) in
                    if error != nil {
                        print(error!)
                    } else {
                        for document in querySnapshot!.documents {
                            document.reference.delete()
                        }
                    }
                }
                self.companyNameList.remove(at: indexPath.section)
                self.ruminantTypeList.remove(at: indexPath.section)
                self.animalGroupList.remove(at: indexPath.section)
                self.psychologicalList.remove(at: indexPath.section)
                self.pdfDateList.remove(at: indexPath.section)
                self.pdfReference.remove(at: indexPath.section)
                self.preparedBy.remove(at: indexPath.section)
                self.reportType.remove(at: indexPath.section)
                self.DocumentIdList.remove(at: indexPath.section)
                if(self.companyNameList.count == 0) {
                    self.tableView.alpha = 0
                    self.hiddenView.alpha = 1
                } else {
                    tableView.reloadData()
                }
            })
            alert.addAction(ok)
            let cancel = UIAlertAction(title: "Cancel", style: .default, handler: { action in
                
            })
            alert.addAction(cancel)
            DispatchQueue.main.async(execute: {
                self.present(alert, animated: true)
            })
        }
        deleteAction.backgroundColor = .red
        
        let shareAction = UITableViewRowAction(style: .normal, title: "Share") { (rowAction, indexPath) in
            let vcone = self.storyboard?.instantiateViewController(withIdentifier: "SwitchPDFViewController") as? SwitchPDFViewController
            premixArray = self.copyArray[indexPath.section]["PremixVal"] as! [Double]
            waterArray = self.copyArray[indexPath.section]["WaterVal"] as! [Double]
            requiredArray = self.copyArray[indexPath.section]["RequirmentsVal"] as! [Double]
            rationArray = self.copyArray[indexPath.section]["RationVal"] as! [Double]
            vcone?.companystr1 = self.companyNameList[indexPath.section]
            vcone?.animalgroupstr2 = self.animalGroupList[indexPath.section]
            vcone?.datestr3 = self.pdfDateList[indexPath.section]
            vcone?.referncestr4 = self.pdfReference[indexPath.section]
            vcone?.ruminanttypestr5 = self.ruminantTypeList[indexPath.section]
            vcone?.preparedbystr6 = self.preparedBy[indexPath.section]
            vcone?.reporttypestr7 = self.reportType[indexPath.section]
            vcone?.pscistatestr8 = self.psychologicalList[indexPath.section]
            fromDatabase = "yes"
            vcone?.shareVariable = "yes"
            self.navigationController?.pushViewController(vcone!, animated: true)
        }
        shareAction.backgroundColor = UIColor(red: 169/255, green: 11/255.0, blue: 114/255.0, alpha: 1.0)

        return [shareAction,deleteAction]
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcone = storyboard?.instantiateViewController(withIdentifier: "SwitchPDFViewController") as? SwitchPDFViewController
        premixArray = copyArray[indexPath.section]["PremixVal"] as! [Double]
        waterArray = copyArray[indexPath.section]["WaterVal"] as! [Double]
        requiredArray = copyArray[indexPath.section]["RequirmentsVal"] as! [Double]
        rationArray = copyArray[indexPath.section]["RationVal"] as! [Double]
        vcone?.companystr1 = companyNameList[indexPath.section]
        vcone?.animalgroupstr2 = animalGroupList[indexPath.section]
        vcone?.datestr3 = pdfDateList[indexPath.section]
        vcone?.referncestr4 = pdfReference[indexPath.section]
        vcone?.ruminanttypestr5 = ruminantTypeList[indexPath.section]
        vcone?.preparedbystr6 = preparedBy[indexPath.section]
        vcone?.reporttypestr7 = reportType[indexPath.section]
        vcone?.pscistatestr8 = psychologicalList[indexPath.section]
        fromDatabase = "yes"
        self.navigationController?.pushViewController(vcone!, animated: true)
    }
}
