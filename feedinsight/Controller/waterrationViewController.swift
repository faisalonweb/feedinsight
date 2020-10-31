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

class waterrationViewController: UIViewController , UITableViewDataSource , UITableViewDelegate, UIGestureRecognizerDelegate{
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileimage: UIImageView!
    let defaults = UserDefaults(suiteName:"User")
    let db = Firestore.firestore()
    let userID = Auth.auth().currentUser?.uid
    var reportNameList = [String]()
    var reportDateList = [String]()
    var DocumentIdList = [String]()
    var reportProductList = [String]()
    var reportValueList = [String]()
    var CaList = [String]()
    var ClList = [String]()
    var MgList = [String]()
    var NaList = [String]()
    var KList = [String]()
    var PList = [String]()
    var SList = [String]()
    // premix controller data
    // Macro
    var productNameList = [String]()
    var productDoseList = [String]()
    var pMacroList = [String]()
    var caMacroList = [String]()
    var mgMacroList = [String]()
    var kMacroList = [String]()
    var naMacroList = [String]()
    var clMacroList = [String]()
    var sMacroList = [String]()
    // Micro
    var coMicroList = [String]()
    var cuMicroList = [String]()
    var iMicroList = [String]()
    var mnMicroList = [String]()
    var cuOrganicMicroList = [String]()
    var feMicroList = [String]()
    var seMicroList = [String]()
    var seOrganicMicroList = [String]()
    var znMicroList = [String]()
    var znOrganicMicroList = [String]()
    // Vitamins
    var aiuVitaminList = [String]()
    var diuVitaminList = [String]()
    var eiuVitaminList = [String]()
    var niacinVitaminList = [String]()
    var biotinVitaminList = [String]()
    var copyArray = [NSDictionary]()
    private var datastation = [String]()
    private var dataonestation = [String]()
    private var datatwostation = [String]()
    private var datathreestation = [String]()
    private var datafourstation = [String]()
    private var datafivestation = [String]()
    private var datasixstation = [String]()
    private var datasevenstation = [String]()
    private var dataeightstation = [String]()
    private var documentIdStation = [String]()
    
    // Premix controller data stations
    // Macro data station
    private var productNameStation = [String]()
    private var productDoseStation = [String]()
    private var pMacroStation = [String]()
    private var caMacroStation = [String]()
    private var mgMacroStation = [String]()
    private var kMacroStation = [String]()
    private var naMacroStation = [String]()
    private var clMacrostation = [String]()
    private var sMacroStation = [String]()
    // Micro data station
    private var coMicroStation = [String]()
    private var iMicroStation = [String]()
    private var mnMicroStation = [String]()
    private var cuMicroStation = [String]()
    private var cuOrganicMicroStation = [String]()
    private var feMicroStation = [String]()
    private var seMicroStation = [String]()
    private var seOrganicMicroStation = [String]()
    private var znMicroStation = [String]()
    private var znOrganicMicroStation = [String]()
    // Vitamins
    private var aiuVitaminStation = [String]()
    private var diuVitaminStation = [String]()
    private var eiuVitaminStation = [String]()
    private var niacinVitaminStation = [String]()
    private var biotinVitaminStation = [String]()
    
    @IBOutlet weak var changeableLabel: UILabel!
    var screenNAME : String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.global().async {
            DispatchQueue.main.async {
            let data = self.defaults!.value(forKey: "imageData") as? Data
            if(data != nil) {
                self.profileimage.image = UIImage(data: data!)
            }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
//        let popGestureRecognizer = self.navigationController!.interactivePopGestureRecognizer!
//        if let targets = popGestureRecognizer.value(forKey: "targets") as? NSMutableArray {
//          let gestureRecognizer = UIPanGestureRecognizer()
//          gestureRecognizer.setValue(targets, forKey: "targets")
//          self.view.addGestureRecognizer(gestureRecognizer)
//        }
       
        if let userName = defaults!.value(forKey: "usernameStringKey"){
            self.userNameLabel.text = userName as? String
            print(userName)
        }
        self.tblView.refreshControl = UIRefreshControl()
        self.tblView.refreshControl?.beginRefreshing()
        if(self.screenNAME == "water") {
            changeableLabel.text = "Water Reports"
            
            let script =  ApiCalling()
            script.WaterData() { (result) -> () in
                
                if result.count > 0{
                   
                    for documentData in result {
                        
                        //                    let animaltype = documentData[ProductNameArray] as? String ?? "Anonymous"
                        let ReportName = documentData["ReportName"] as? String ?? "Anonymous"
                        let timestamp = documentData["currentdatetime"] as? String ?? "20/20/20"
                        let docID = documentData["DocId"] as? String ?? "20/20/20"
                        let PName = documentData["P"] as? String ?? "Anonymous"
                        let CaName = documentData["Ca"] as? String ?? "Anonymous"
                        let MgName = documentData["Mg"] as? String ?? "Anonymous"
                        let KName = documentData["K"] as? String ?? "Anonymous"
                        let NaName = documentData["Na"] as? String ?? "Anonymous"
                        let ClName = documentData["Cl"] as? String ?? "Anonymous"
                        let SName = documentData["S"] as? String ?? "Anonymous"
                        
                        self.datastation.insert(ReportName, at: 0)
                        self.dataonestation.insert(timestamp, at: 0)
                        self.documentIdStation.insert(docID, at: 0)
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
                    self.DocumentIdList.append(contentsOf: self.documentIdStation)
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
                    self.tblView.refreshControl?.endRefreshing()
                    print("pakis")
                }
            }
        } else if (self.screenNAME == "ration") {
            changeableLabel.text = "Ration Reports"
            let script =  ApiCalling()
            script.RationData() { (result) -> () in
                
                if result.count > 0 {
                  
                    var i = 0
                    for documentData in result {
                       
                        let ReportName = documentData["ReportName"] as? String ?? "Anonymous"
                        let timestamp = documentData["currenttimedate"] as? String ?? "20/20/20"
                        let documentiddata = documentData["DocId"] as? String ?? "20/20/20"
                        self.datastation.insert(ReportName, at: i)
                        self.dataonestation.insert(timestamp, at: i)
                        self.documentIdStation.insert(documentiddata, at: i)
                        i = i + 1
                        self.copyArray.append(documentData as NSDictionary)
                        
                       // let userRef = self.myRootRef.childByAppend
                        
                    }
                    self.reportNameList.append(contentsOf: self.datastation)
                    self.reportDateList.append(contentsOf: self.dataonestation)
                    self.DocumentIdList.append(contentsOf: self.documentIdStation)
                    self.reportProductList.append(contentsOf: self.datatwostation)
                    self.reportValueList.append(contentsOf: self.datathreestation)
                    self.tblView.reloadData()
                    print("report name is \(self.reportProductList)")
                    print("report Data is \(self.reportValueList)")
                    self.tblView.refreshControl?.endRefreshing()
                } else {
                    self.tblView.refreshControl?.endRefreshing()
                    print("pakis")
                }
            }
        }
        else if (self.screenNAME == "premix") {
            changeableLabel.text = "Premix Reports"
            let script =  ApiCalling()
            script.PremixData() { (result) -> () in
                if result.count > 0{
                    
                    for documentData in result {
                       
                        //                    let animaltype = documentData[ProductNameArray] as? String ?? "Anonymous"
                        let ReportName = documentData["ReportName"] as? String ?? "Anonymous"
                        let timestamp = documentData["currentdatetime"] as? String ?? "20/20/20"
                        let documentID = documentData["DocId"] as? String ?? "20/20/20"
                        let productName = documentData["productName"] as? String ?? "Anonymous"
                        let doseQuan = documentData["productDose"] as? String ?? "Anonymous"
                        let pMacro = documentData["pMacroMineral"] as? String ?? "Anonymous"
                        let caMacro = documentData["caMacroMineral"] as? String ?? "Anonymous"
                        let mgMacro = documentData["mgMacroMineral"] as? String ?? "Anonymous"
                        let kMacro = documentData["kMacroMineral"] as? String ?? "Anonymous"
                        let naMacro = documentData["naMacroMineral"] as? String ?? "Anonymous"
                        let clMacro = documentData["clMacroMineral"] as? String ?? "Anonymous"
                        let sMacro = documentData["sMacroMineral"] as? String ?? "Anonymous"
                        
                        // Micro
                        let coMicro = documentData["coMicroMineral"] as? String ?? "Anonymous"
                        let iMicro = documentData["iMicroMineral"] as? String ?? "Anonymous"
                        let feMicro = documentData["feMicroMineral"] as? String ?? "Anonymous"
                        let mnMicro = documentData["mnMicroMineral"] as? String ?? "Anonymous"
                        let cuMicro = documentData["cu(inorganic)MicroMineral"] as? String ?? "Anonymous"
                        let cuorganicMicro = documentData["cu(organic)MicroMineral"] as? String ?? "Anonymous"
                        let seMicro = documentData["se(inorganic)MicroMineral"] as? String ?? "Anonymous"
                        let seOrganicMicro = documentData["se(organic)MicroMineral"] as? String ?? "Anonymous"
                        let znMicro = documentData["zn(inorganic)MicroMineral"] as? String ?? "Anonymous"
                        let znOrganicMicro = documentData["zn(organic)MicroMineral"] as? String ?? "Anonymous"
                        // Vitamins
                        
                        let aiuVitamin = documentData["aiuVitamin"] as? String ?? "Anonymous"
                        let diuVitamin = documentData["diuVitamin"] as? String ?? "Anonymous"
                        let eiuVitamin = documentData["eiuVitamin"] as? String ?? "Anonymous"
                        let niacinVitamin = documentData["niacinVitamin"] as? String ?? "Anonymous"
                        let biotinVitamin = documentData["biotinVitamin"] as? String ?? "Anonymous"
                        
                        
                        self.datastation.insert(ReportName, at: 0)
                        self.dataonestation.insert(timestamp, at: 0)
                        self.documentIdStation.insert(documentID, at: 0)
                        
                        // Macro
                        self.productNameStation.insert(productName, at: 0)
                        self.productDoseStation.insert(doseQuan, at: 0)
                        self.pMacroStation.insert(pMacro, at: 0)
                        self.caMacroStation.insert(caMacro, at: 0)
                        self.mgMacroStation.insert(mgMacro, at: 0)
                        self.kMacroStation.insert(kMacro, at: 0)
                        self.naMacroStation.insert(naMacro, at: 0)
                        self.clMacrostation.insert(clMacro, at: 0)
                        self.sMacroStation.insert(sMacro, at: 0)
                        // Micro
                        self.coMicroStation.insert(coMicro, at: 0)
                        self.iMicroStation.insert(iMicro, at: 0)
                        self.mnMicroStation.insert(mnMicro, at: 0)
                        self.cuMicroStation.insert(cuMicro, at: 0)
                        self.feMicroStation.insert(feMicro, at: 0)
                        self.cuOrganicMicroStation.insert(cuorganicMicro, at: 0)
                        self.seMicroStation.insert(seMicro, at: 0)
                        self.seOrganicMicroStation.insert(seOrganicMicro, at: 0)
                        self.znMicroStation.insert(znMicro, at: 0)
                        self.znOrganicMicroStation.insert(znOrganicMicro, at: 0)
                        
                        // Vitamin
                        self.aiuVitaminStation.insert(aiuVitamin, at: 0)
                        self.diuVitaminStation.insert(diuVitamin, at: 0)
                        self.eiuVitaminStation.insert(eiuVitamin, at: 0)
                        self.niacinVitaminStation.insert(niacinVitamin, at: 0)
                        self.biotinVitaminStation.insert(biotinVitamin, at: 0)
                        
                        
                    }
                    self.reportNameList.append(contentsOf: self.datastation)
                    self.reportDateList.append(contentsOf: self.dataonestation)
                    self.DocumentIdList.append(contentsOf: self.documentIdStation)
                    
                    // Macro
                    self.productNameList.append(contentsOf: self.productNameStation)
                    self.productDoseList.append(contentsOf: self.productDoseStation)
                    self.pMacroList.append(contentsOf: self.pMacroStation)
                    self.caMacroList.append(contentsOf: self.caMacroStation)
                    self.mgMacroList.append(contentsOf: self.mgMacroStation)
                    self.kMacroList.append(contentsOf: self.kMacroStation)
                    self.naMacroList.append(contentsOf: self.naMacroStation)
                    self.clMacroList.append(contentsOf: self.clMacrostation)
                    self.sMacroList.append(contentsOf: self.sMacroStation)
                    // Micro
                    self.coMicroList.append(contentsOf: self.coMicroStation)
                    self.iMicroList.append(contentsOf: self.iMicroStation)
                    self.mnMicroList.append(contentsOf: self.mnMicroStation)
                    self.cuMicroList.append(contentsOf: self.cuMicroStation)
                    self.feMicroList.append(contentsOf: self.feMicroStation)
                    self.cuOrganicMicroList.append(contentsOf: self.cuOrganicMicroStation)
                    self.znMicroList.append(contentsOf: self.znMicroStation)
                    self.znOrganicMicroList.append(contentsOf: self.znOrganicMicroStation)
                    self.seMicroList.append(contentsOf: self.seMicroStation)
                    self.seOrganicMicroList.append(contentsOf: self.seOrganicMicroStation)
                    
                    
                    // Vitamin
                    self.aiuVitaminList.append(contentsOf: self.aiuVitaminStation)
                    self.diuVitaminList.append(contentsOf: self.diuVitaminStation)
                    self.eiuVitaminList.append(contentsOf: self.eiuVitaminStation)
                    self.niacinVitaminList.append(contentsOf: self.niacinVitaminStation)
                    self.biotinVitaminList.append(contentsOf: self.biotinVitaminStation)
                    self.tblView.reloadData()
                    print("product name is \(self.productNameList)")
                    print("zn inorganic  Data is \(self.znOrganicMicroList)")
                    
                    self.tblView.refreshControl?.endRefreshing()
                }
                else {
                    self.tblView.refreshControl?.endRefreshing()
                    print("pakis")
                }
            }
        }
        //profileimage?.layer.cornerRadius = (profileimage?.frame.size.width ?? 0.0) / 2
        profileimage?.layer.cornerRadius = (profileimage?.frame.size.width ?? 0.0) / 2
        profileimage?.clipsToBounds = true
        profileimage?.layer.borderWidth = 3.0
        profileimage?.layer.borderColor = UIColor.white.cgColor
        
        
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
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
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if(screenNAME == "ration") {
                db.collection("rationReports").document(self.userID!).collection("rationReports").whereField("DocId", isEqualTo: DocumentIdList[indexPath.section]).getDocuments { (querySnapshot, error) in
                    if error != nil {
                        print(error!)
                    } else {
                        for document in querySnapshot!.documents {
                            document.reference.delete()
                        }
                    }
                }
                
                reportNameList.remove(at: indexPath.section)
                reportDateList.remove(at: indexPath.section)
                copyArray.remove(at: indexPath.section)
                //reportValueList.remove(at: indexPath.section)
                DocumentIdList.remove(at: indexPath.section)
                tblView.reloadData()
                
                
              
            }
            else if (screenNAME == "water") {
                db.collection("waterReports").document(self.userID!).collection("waterReports").whereField("DocId", isEqualTo: DocumentIdList[indexPath.section]).getDocuments { (querySnapshot, error) in
                    if error != nil {
                        print(error!)
                    } else {
                        for document in querySnapshot!.documents {
                            document.reference.delete()
                        }
                    }
                }
                PList.remove(at: indexPath.section)
                CaList.remove(at: indexPath.section)
                MgList.remove(at: indexPath.section)
                KList.remove(at: indexPath.section)
                NaList.remove(at: indexPath.section)
                ClList.remove(at: indexPath.section)
                SList.remove(at: indexPath.section)
                reportNameList.remove(at: indexPath.section)
                reportDateList.remove(at: indexPath.section)
                DocumentIdList.remove(at: indexPath.section)
                tblView.reloadData()
            }
             
            else if (screenNAME == "premix") {
                db.collection("premixReports").document(self.userID!).collection("premixReports").whereField("DocId", isEqualTo: DocumentIdList[indexPath.section]).getDocuments { (querySnapshot, error) in
                    if error != nil {
                        print(error!)
                    } else {
                        for document in querySnapshot!.documents {
                            document.reference.delete()
                        }
                    }
                }
                productNameList.remove(at: indexPath.section)
                reportDateList.remove(at: indexPath.section)
                productDoseList.remove(at: indexPath.section)
                DocumentIdList.remove(at: indexPath.section)
                reportNameList.remove(at: indexPath.section)
                pMacroList.remove(at: indexPath.section)
                caMacroList.remove(at: indexPath.section)
                mgMacroList.remove(at: indexPath.section)
                kMacroList.remove(at: indexPath.section)
                naMacroList.remove(at: indexPath.section)
                clMacroList.remove(at: indexPath.section)
                sMacroList.remove(at: indexPath.section)
                coMicroList.remove(at: indexPath.section)
                iMicroList.remove(at: indexPath.section)
                mnMicroList.remove(at: indexPath.section)
                cuMicroList.remove(at: indexPath.section)
                feMicroList.remove(at: indexPath.section)
                cuOrganicMicroList.remove(at: indexPath.section)
                seMicroList.remove(at: indexPath.section)
                seOrganicMicroList.remove(at: indexPath.section)
                znMicroList.remove(at: indexPath.section)
                znOrganicMicroList.remove(at: indexPath.section)
                aiuVitaminList.remove(at: indexPath.section)
                diuVitaminList.remove(at: indexPath.section)
                eiuVitaminList.remove(at: indexPath.section)
                niacinVitaminList.remove(at: indexPath.section)
                biotinVitaminList.remove(at: indexPath.section)
                tblView.reloadData()
            }
           
            
        }
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (screenNAME == "ration") {
            let vcone = storyboard?.instantiateViewController(withIdentifier: "feedthreeViewController") as? feedthreeViewController;
            dropdownvalues = copyArray[indexPath.section]["ProductNameArray"] as! [String]
            dropdownfloatValue = copyArray[indexPath.section]["ProductValueArray"] as! [String]
            vcone?.documentID = DocumentIdList[indexPath.section]
            vcone?.ReportName = reportNameList[indexPath.section]
            vcone?.checkStatus = true
            self.navigationController?.pushViewController(vcone!, animated: true)
        }
        else if (screenNAME == "water") {
            var addressDict = [String:AnyObject]()
            addressDict["waterStatus"] = true as AnyObject
            addressDict["P"] = PList[indexPath.section] as AnyObject
            addressDict["Ca"] = CaList[indexPath.section] as AnyObject
            addressDict["Mg"] = MgList[indexPath.section] as AnyObject
            addressDict["K"] = KList[indexPath.section] as AnyObject
            addressDict["Na"] = NaList[indexPath.section] as AnyObject
            addressDict["Cl"] = ClList[indexPath.section] as AnyObject
            addressDict["S"] = SList[indexPath.section] as AnyObject
            addressDict["ReportName"] = reportNameList[indexPath.section] as AnyObject
            addressDict["DocId"] = DocumentIdList[indexPath.section] as AnyObject
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "myNotificationKey"), object: nil, userInfo: addressDict)
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
        }
        else {
            let vcone = storyboard?.instantiateViewController(withIdentifier: "premixViewController") as? premixViewController;
            // Macro
            vcone?.premixStatus = true
            vcone?.productNameData = productNameList[indexPath.section]
            vcone?.productDoseData = productDoseList[indexPath.section]
            vcone?.DocumentId = DocumentIdList[indexPath.section]
            vcone?.ReportName = reportNameList[indexPath.section]
            vcone?.pMacroMineralData = pMacroList[indexPath.section]
            vcone?.caMacroMinerlData = caMacroList[indexPath.section]
            vcone?.mgMacroMineralData = mgMacroList[indexPath.section]
            vcone?.kMacroMineralData = kMacroList[indexPath.section]
            vcone?.naMacroMineralData = naMacroList[indexPath.section]
            vcone?.clMacroMineralData = clMacroList[indexPath.section]
            vcone?.sMacroMineralData = sMacroList[indexPath.section]
            // Micro
            vcone?.coMicroMineralData = coMicroList[indexPath.section]
            vcone?.iMicroMineralData = iMicroList[indexPath.section]
            vcone?.mnMicroMineralData = mnMicroList[indexPath.section]
            vcone?.cuMicroMineralData = cuMicroList[indexPath.section]
            vcone?.feMicroMineralData = feMicroList[indexPath.section]
            vcone?.cuOrganicMicroMineralData = cuOrganicMicroList[indexPath.section]
            vcone?.seMicroMineralData = seMicroList[indexPath.section]
            vcone?.seOrganicMicroMineralData = seOrganicMicroList[indexPath.section]
            vcone?.znMicroMineralData = znMicroList[indexPath.section]
            vcone?.znOrganicMicroMineralData = znOrganicMicroList[indexPath.section]
            
            // Vitamin
            vcone?.aiuVitaminData = aiuVitaminList[indexPath.section]
            vcone?.diuVitaminData = diuVitaminList[indexPath.section]
            vcone?.eiuVitaminData = eiuVitaminList[indexPath.section]
            vcone?.niacinVitaminData = niacinVitaminList[indexPath.section]
            vcone?.biotinVitaminData = biotinVitaminList[indexPath.section]
            
            self.navigationController?.pushViewController(vcone!, animated: true)
        }
    }
    
    
}
