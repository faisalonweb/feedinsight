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

class ReportViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var tableView: UITableView!
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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.refreshControl = UIRefreshControl()
        self.tableView.refreshControl?.beginRefreshing()
        Firestore.firestore().collection("pdfReports").document(Auth.auth().currentUser?.uid ?? "").collection("pdfReports").getDocuments{(snapshot,error) in
            
            if error == nil && snapshot != nil {
                guard let snap = snapshot else {return}
                var i = 0
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
                    
                   // let userRef = self.myRootRef.childByAppend
                    
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
//                self.reportProductList.append(contentsOf: self.datatwostation)
//                self.reportValueList.append(contentsOf: self.datathreestation)
                self.tableView.reloadData()
//                print("report name is \(self.reportProductList)")
//                print("report Data is \(self.reportValueList)")
                self.tableView.refreshControl?.endRefreshing()
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcone = storyboard?.instantiateViewController(withIdentifier: "PDFViewController") as? PDFViewController;
        vcone?.premixArray = copyArray[indexPath.section]["PremixVal"] as! [Double]
        vcone?.waterArray = copyArray[indexPath.section]["WaterVal"] as! [Double]
        vcone?.requiredArray = copyArray[indexPath.section]["RequirmentsVal"] as! [Double]
        vcone?.rationArray = copyArray[indexPath.section]["RationVal"] as! [Double]
        vcone?.companystr1 = companyNameList[indexPath.section]
        vcone?.animalgroupstr2 = animalGroupList[indexPath.section]
        vcone?.datestr3 = pdfDateList[indexPath.section]
        vcone?.referncestr4 = pdfReference[indexPath.section]
        vcone?.ruminanttypestr5 = ruminantTypeList[indexPath.section]
        vcone?.preparedbystr6 = preparedBy[indexPath.section]
        vcone?.reporttypestr7 = reportType[indexPath.section]
        vcone?.pscistatestr8 = psychologicalList[indexPath.section]
        vcone?.fromDatabase = "yes"
        self.navigationController?.pushViewController(vcone!, animated: true)
    }
}
