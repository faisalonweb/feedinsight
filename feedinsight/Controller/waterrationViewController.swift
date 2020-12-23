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
import SwiftMessages

class waterrationViewController: UIViewController , UITableViewDataSource , UITableViewDelegate, UIGestureRecognizerDelegate{
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileimage: UIImageView!
    
    @IBOutlet weak var hiddenView: UIView!
    let defaults = UserDefaults(suiteName:"User")
    let db = Firestore.firestore()
    let userID = Auth.auth().currentUser?.uid
    var reportNameList = [String]()
    var reportDateList = [String]()
    var DocumentIdList = [String]()
    var docIdArray = [String]()
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
    
    @objc func refresh(_ sender: AnyObject) {
        self.tblView.refreshControl?.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.docIdArray.removeAll()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        if let userName = defaults!.value(forKey: "usernameStringKey"){
            self.userNameLabel.text = userName as? String
            print(userName)
        }
        let tapOnImage = UITapGestureRecognizer.init(target: self, action: #selector(tapOnImageAction))
        self.profileimage.addGestureRecognizer(tapOnImage)
        self.profileimage.isUserInteractionEnabled = true
        self.tblView.refreshControl = UIRefreshControl()
        self.tblView.refreshControl?.beginRefreshing()
        self.tblView.refreshControl?.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        if(self.screenNAME == "water") {
            changeableLabel.text = "Water Reports"
            
            let script =  ApiCalling()
            script.WaterData() { (result) -> () in
                
                if result.count > 0{
                    self.tblView.alpha = 1
                    self.hiddenView.alpha = 0
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
                    self.tblView.alpha = 0
                    self.hiddenView.alpha = 1
                    print("pakis")
                }
            }
        } else if (self.screenNAME == "ration") {
            changeableLabel.text = "Ration Reports"
            let script =  ApiCalling()
            script.RationData() { (result) -> () in
                
                if result.count > 0 {
                    self.tblView.alpha = 1
                    self.hiddenView.alpha = 0
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
                    self.tblView.alpha = 0
                    self.hiddenView.alpha = 1
                    print("pakis")
                }
            }
        }
        else if (self.screenNAME == "premix") {
            changeableLabel.text = "Premix Reports"
            let script =  ApiCalling()
            script.PremixData() { (result) -> () in
                if result.count > 0{
                    self.tblView.alpha = 1
                    self.hiddenView.alpha = 0
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
                    let productNameArray = ["TotalVit Max", "TotalVit Pro", "TotalVit Super", "TotalVit Plus", "TotalVit Grow", "TotalVit DCAD*"]
                    let productDateArray = ["Standard TotalVit Premix", "Standard TotalVit Premix", "Standard TotalVit Premix", "Standard TotalVit Premix", "Standard TotalVit Premix", "Standard TotalVit Premix"]
                    self.docIdArray = ["0", "1", "2", "3", "4", "5"]
                    
                    self.reportNameList.append(contentsOf: productNameArray)
                    self.reportDateList.append(contentsOf: productDateArray)
                    self.DocumentIdList.append(contentsOf: self.docIdArray)
                    
                    
                    self.reportNameList.append(contentsOf: self.datastation)
                    self.reportDateList.append(contentsOf: self.dataonestation)
                    self.DocumentIdList.append(contentsOf: self.documentIdStation)
                    
                    let productDoseArray = ["100", "100", "100", "100", "100", "350"]
                    let vitAArray = ["1000000", "1250000", "1250000", "750000", "500000", "357000"]
                    let vitDArray = ["250000", "250000", "250000", "200000", "150000", "71400"]
                    let vitEArray = ["8000", "10000", "10000", "5000", "5000", "4285"]
                    let niacinArray = ["20000", "20000", "20000", "0", "0", "5715"]
                    let biotinArray = ["100", "100", "100", "0", "80", "28.5"]
                    let coArray = ["100","100","100","100","60","28.57"]
                    let cuArray = ["3000","1500","1500","2000","1000","857"]
                    let cuOrganicArray = ["0","1500","1500","0","500","0"]
                    let seArray = ["60","0","0","60","20","17"]
                    let seOrganicArray = ["0","60","60","0","20","11.5"]
                    let znArray = ["10000","5000","5000","6000","2000","2850"]
                    let znOrganicArray = ["0","5000","5000","0","1000","0"]
                    let mnArray = ["10000","5000","5000","6000","2000","2850"]
                    let mnOrganicArray = ["0","5000","5000","0","1000","0"]
                    let iArray = ["200","200","200","200","80","0"]
                    let pArray = ["60","60","60","0","30","17"]
                    let clArray = ["100","100","100","100","100","140"]
                    let mgArray = ["10","10","10","20","10","10"]
                    let naArray = ["75","75","75","65","65","15"]
                    let sArray = ["6","6","6","0","0","108"]
                    let kArray = ["0","0","0","0","0","0"]
                    let caArray = ["190","170","170","260","250","185"]
                    
                    self.productNameList.append(contentsOf: productNameArray)
                    self.productDoseList.append(contentsOf: productDoseArray)
                    self.pMacroList.append(contentsOf: pArray)
                    self.caMacroList.append(contentsOf: caArray)
                    self.mgMacroList.append(contentsOf: mgArray)
                    self.kMacroList.append(contentsOf: kArray)
                    self.naMacroList.append(contentsOf: naArray)
                    self.clMacroList.append(contentsOf: clArray)
                    self.sMacroList.append(contentsOf: sArray)
                    self.coMicroList.append(contentsOf: coArray)
                    self.iMicroList.append(contentsOf: iArray)
                    self.mnMicroList.append(contentsOf: mnArray)
                    self.cuMicroList.append(contentsOf: cuArray)
                    self.feMicroList.append(contentsOf: mnOrganicArray)
                    self.cuOrganicMicroList.append(contentsOf: cuOrganicArray)
                    self.znMicroList.append(contentsOf: znArray)
                    self.znOrganicMicroList.append(contentsOf: znOrganicArray)
                    self.seMicroList.append(contentsOf: seArray)
                    self.seOrganicMicroList.append(contentsOf: seOrganicArray)
                    self.aiuVitaminList.append(contentsOf: vitAArray)
                    self.diuVitaminList.append(contentsOf: vitDArray)
                    self.eiuVitaminList.append(contentsOf: vitEArray)
                    self.niacinVitaminList.append(contentsOf: niacinArray)
                    self.biotinVitaminList.append(contentsOf: biotinArray)
                    
                    self.productNameList.append(contentsOf: self.productNameStation)
                    self.productDoseList.append(contentsOf: self.productDoseStation)
                    self.pMacroList.append(contentsOf: self.pMacroStation)
                    self.caMacroList.append(contentsOf: self.caMacroStation)
                    self.mgMacroList.append(contentsOf: self.mgMacroStation)
                    self.kMacroList.append(contentsOf: self.kMacroStation)
                    self.naMacroList.append(contentsOf: self.naMacroStation)
                    self.clMacroList.append(contentsOf: self.clMacrostation)
                    self.sMacroList.append(contentsOf: self.sMacroStation)
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
                    self.aiuVitaminList.append(contentsOf: self.aiuVitaminStation)
                    self.diuVitaminList.append(contentsOf: self.diuVitaminStation)
                    self.eiuVitaminList.append(contentsOf: self.eiuVitaminStation)
                    self.niacinVitaminList.append(contentsOf: self.niacinVitaminStation)
                    self.biotinVitaminList.append(contentsOf: self.biotinVitaminStation)
                    
                    
                    self.tblView.reloadData()
                    print("product name is \(self.productNameList)")
                    print("zn inorganic  Data is \(self.znOrganicMicroList)")
                    
                    self.tblView.refreshControl?.endRefreshing()
                } else {
                    let productNameArray = ["TotalVit Max", "TotalVit Pro", "TotalVit Super", "TotalVit Plus", "TotalVit Grow", "TotalVit DCAD*"]
                    let productDateArray = ["Standard TotalVit Premix", "Standard TotalVit Premix", "Standard TotalVit Premix", "Standard TotalVit Premix", "Standard TotalVit Premix", "Standard TotalVit Premix"]
                    self.docIdArray = ["0", "1", "2", "3", "4", "5"]
                    
                    self.reportNameList.append(contentsOf: productNameArray)
                    self.reportDateList.append(contentsOf: productDateArray)
                    self.DocumentIdList.append(contentsOf: self.docIdArray)
                    let productDoseArray = ["100", "100", "100", "100", "100", "350"]
                    let vitAArray = ["1000000", "1250000", "1250000", "750000", "500000", "357000"]
                    let vitDArray = ["250000", "250000", "250000", "200000", "150000", "71400"]
                    let vitEArray = ["8000", "10000", "10000", "5000", "5000", "4285"]
                    let niacinArray = ["20000", "20000", "20000", "0", "0", "5715"]
                    let biotinArray = ["100", "100", "100", "0", "80", "28.5"]
                    let coArray = ["100","100","100","100","60","28.57"]
                    let cuArray = ["3000","1500","1500","2000","1000","857"]
                    let cuOrganicArray = ["0","1500","1500","0","500","0"]
                    let seArray = ["60","0","0","60","20","17"]
                    let seOrganicArray = ["0","60","60","0","20","11.5"]
                    let znArray = ["10000","5000","5000","6000","2000","2850"]
                    let znOrganicArray = ["0","5000","5000","0","1000","0"]
                    let mnArray = ["10000","5000","5000","6000","2000","2850"]
                    let mnOrganicArray = ["0","5000","5000","0","1000","0"]
                    let iArray = ["200","200","200","200","80","0"]
                    let pArray = ["60","60","60","0","30","17"]
                    let clArray = ["100","100","100","100","100","140"]
                    let mgArray = ["10","10","10","20","10","10"]
                    let naArray = ["75","75","75","65","65","15"]
                    let sArray = ["6","6","6","0","0","108"]
                    let kArray = ["0","0","0","0","0","0"]
                    let caArray = ["190","170","170","260","250","185"]
                    
                    self.productNameList.append(contentsOf: productNameArray)
                    self.productDoseList.append(contentsOf: productDoseArray)
                    self.pMacroList.append(contentsOf: pArray)
                    self.caMacroList.append(contentsOf: caArray)
                    self.mgMacroList.append(contentsOf: mgArray)
                    self.kMacroList.append(contentsOf: kArray)
                    self.naMacroList.append(contentsOf: naArray)
                    self.clMacroList.append(contentsOf: clArray)
                    self.sMacroList.append(contentsOf: sArray)
                    self.coMicroList.append(contentsOf: coArray)
                    self.iMicroList.append(contentsOf: iArray)
                    self.mnMicroList.append(contentsOf: mnArray)
                    self.cuMicroList.append(contentsOf: cuArray)
                    self.feMicroList.append(contentsOf: mnOrganicArray)
                    self.cuOrganicMicroList.append(contentsOf: cuOrganicArray)
                    self.znMicroList.append(contentsOf: znArray)
                    self.znOrganicMicroList.append(contentsOf: znOrganicArray)
                    self.seMicroList.append(contentsOf: seArray)
                    self.seOrganicMicroList.append(contentsOf: seOrganicArray)
                    self.aiuVitaminList.append(contentsOf: vitAArray)
                    self.diuVitaminList.append(contentsOf: vitDArray)
                    self.eiuVitaminList.append(contentsOf: vitEArray)
                    self.niacinVitaminList.append(contentsOf: niacinArray)
                    self.biotinVitaminList.append(contentsOf: biotinArray)
                    
                    self.tblView.refreshControl?.endRefreshing()
                    self.tblView.reloadData()
                    print("pakis")
                    //self.tblView.alpha = 0
                    //self.hiddenView.alpha = 1
                }
            }
        }
        //profileimage?.layer.cornerRadius = (profileimage?.frame.size.width ?? 0.0) / 2
        profileimage?.layer.cornerRadius = (profileimage?.frame.size.width ?? 0.0) / 2
        profileimage?.clipsToBounds = true
        profileimage?.layer.borderWidth = 3.0
        profileimage?.layer.borderColor = UIColor.white.cgColor
        
        
    }
    
    @objc func tapOnImageAction() {
        self.tabBarController?.selectedIndex = 2
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
        if(self.docIdArray.count > 0) {
            if (indexPath.section < 6){
                //cell.backgroundColor = UIColor(red: 81/255, green: 23/255.0, blue: 79/255.0, alpha: 1.0)
                cell.backgroundColor = UIColor(red: 154/255, green: 9/255.0, blue: 87/255.0, alpha: 1.0)
                cell.label.textColor = UIColor.white
                cell.date.textColor = UIColor.white
                cell.date.isHidden = true
            } else {
                cell.backgroundColor = UIColor(red: 237/255, green: 237/255.0, blue: 237/255.0, alpha: 1.0)
                cell.label.textColor = UIColor.black
                cell.date.textColor = UIColor.black
                cell.date.isHidden = false
            }
        } else {
            cell.backgroundColor = UIColor(red: 237/255, green: 237/255.0, blue: 237/255.0, alpha: 1.0)
            cell.label.textColor = UIColor.black
            cell.date.textColor = UIColor.black
            cell.date.isHidden = false
        }
        cell.label?.text = reportNameList[indexPath.section]
        cell.date?.text = reportDateList[indexPath.section]
        
        cell.layer.cornerRadius = 10
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if(self.docIdArray.count > 0) {
            if (indexPath.section < 6){
                return false
            } else {
                return true
            }
        } else {
            return true
        }
        
    }
 
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (rowAction, indexPath) in
            //TODO: edit the row at indexPath here
            if(self.screenNAME == "ration") {
                let alertController = UIAlertController(title: "Edit Report Name", message: "", preferredStyle: .alert)
                let withdrawAction = UIAlertAction(title: "Change", style: .default) { [self] (aciton) in
                   
                    self.view.isUserInteractionEnabled = false
                    let text = alertController.textFields!.first!.text!
                    //let db = Firestore.firestore()
                    let newDocument = db.collection("rationReports").document(userID!).collection("rationReports").document(self.DocumentIdList[indexPath.section])
                    newDocument.setData(["ReportName" : text, "DocId" : newDocument.documentID],merge: true){ err in
                        if let err = err {
                            print("Error adding document: \(err)")
                            let view = MessageView.viewFromNib(layout: .cardView)
                            view.configureTheme(.error)
                            view.configureDropShadow()
                            view.configureContent(title: "Error", body: "Request Failed!")
                            SwiftMessages.show(view: view)
                            self.view.isUserInteractionEnabled = true
                        } else {
                            reportNameList[indexPath.section] = text
                            self.tblView.reloadData()
                            print("Document added")
                            let view = MessageView.viewFromNib(layout: .cardView)
                            view.configureTheme(.success)
                            view.configureDropShadow()
                            view.configureContent(title: "Success", body: "Report name change successfully")
                            SwiftMessages.show(view: view)
                            self.view.isUserInteractionEnabled = true
                            
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
                alertController.textFields!.first!.text! = self.reportNameList[indexPath.section]
                self.present(alertController, animated: true, completion: nil)
            }
            else if (self.screenNAME == "water") {
                let alertController = UIAlertController(title: "Edit Report Name", message: "", preferredStyle: .alert)
                let withdrawAction = UIAlertAction(title: "Change", style: .default) { [self] (aciton) in
                   
                    self.view.isUserInteractionEnabled = false
                    let text = alertController.textFields!.first!.text!
                    //let db = Firestore.firestore()
                    let newDocument = db.collection("waterReports").document(userID!).collection("waterReports").document(self.DocumentIdList[indexPath.section])
                    newDocument.setData(["ReportName" : text, "DocId" : newDocument.documentID],merge: true){ err in
                        if let err = err {
                            print("Error adding document: \(err)")
                            let view = MessageView.viewFromNib(layout: .cardView)
                            view.configureTheme(.error)
                            view.configureDropShadow()
                            view.configureContent(title: "Error", body: "Request Failed!")
                            SwiftMessages.show(view: view)
                            self.view.isUserInteractionEnabled = true
                        } else {
                            reportNameList[indexPath.section] = text
                            self.tblView.reloadData()
                            print("Document added")
                            let view = MessageView.viewFromNib(layout: .cardView)
                            view.configureTheme(.success)
                            view.configureDropShadow()
                            view.configureContent(title: "Success", body: "Report name change successfully")
                            SwiftMessages.show(view: view)
                            self.view.isUserInteractionEnabled = true
                            
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
                alertController.textFields!.first!.text! = self.reportNameList[indexPath.section]
                self.present(alertController, animated: true, completion: nil)
            }
            else if (self.screenNAME == "premix") {
                let alertController = UIAlertController(title: "Edit Report Name", message: "", preferredStyle: .alert)
                let withdrawAction = UIAlertAction(title: "Change", style: .default) { [self] (aciton) in
                   
                    self.view.isUserInteractionEnabled = false
                    let text = alertController.textFields!.first!.text!
                    //let db = Firestore.firestore()
                    let newDocument = db.collection("premixReports").document(userID!).collection("premixReports").document(self.DocumentIdList[indexPath.section])
                    newDocument.setData(["ReportName" : text, "DocId" : newDocument.documentID],merge: true){ err in
                        if let err = err {
                            print("Error adding document: \(err)")
                            let view = MessageView.viewFromNib(layout: .cardView)
                            view.configureTheme(.error)
                            view.configureDropShadow()
                            view.configureContent(title: "Error", body: "Request Failed!")
                            SwiftMessages.show(view: view)
                            self.view.isUserInteractionEnabled = true
                        } else {
                            reportNameList[indexPath.section] = text
                            self.tblView.reloadData()
                            print("Document added")
                            let view = MessageView.viewFromNib(layout: .cardView)
                            view.configureTheme(.success)
                            view.configureDropShadow()
                            view.configureContent(title: "Success", body: "Report name change successfully")
                            SwiftMessages.show(view: view)
                            self.view.isUserInteractionEnabled = true
                            
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
                alertController.textFields!.first!.text! = self.reportNameList[indexPath.section]
                self.present(alertController, animated: true, completion: nil)
            }
          
        }
        editAction.backgroundColor = UIColor(red: 81/255, green: 23/255.0, blue: 79/255.0, alpha: 1.0)


        let deleteAction = UITableViewRowAction(style: .normal, title: "Delete") { (rowAction, indexPath) in
            if(self.screenNAME == "ration") {
                let alert = UIAlertController(title: "Delete Ration Data", message: "Are you sure you want to delete this ration data?", preferredStyle: .alert)
                
                let ok = UIAlertAction(title: "Yes", style: .destructive, handler: { action in
                    self.db.collection("rationReports").document(self.userID!).collection("rationReports").whereField("DocId", isEqualTo: self.DocumentIdList[indexPath.section]).getDocuments { (querySnapshot, error) in
                        if error != nil {
                            print(error!)
                        } else {
                            for document in querySnapshot!.documents {
                                document.reference.delete()
                            }
                        }
                    }
                    
                    self.reportNameList.remove(at: indexPath.section)
                    self.reportDateList.remove(at: indexPath.section)
                    self.copyArray.remove(at: indexPath.section)
                    //reportValueList.remove(at: indexPath.section)
                    self.DocumentIdList.remove(at: indexPath.section)
                    if(self.reportNameList.count == 0) {
                        self.tblView.refreshControl?.endRefreshing()
                        self.tblView.alpha = 0
                        self.hiddenView.alpha = 1
                    } else {
                        self.tblView.reloadData()
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
            else if (self.screenNAME == "water") {
                let alert = UIAlertController(title: "Delete Water Data", message: "Are you sure you want to delete this water data?", preferredStyle: .alert)
                
                let ok = UIAlertAction(title: "Yes", style: .destructive, handler: { action in
                    self.db.collection("waterReports").document(self.userID!).collection("waterReports").whereField("DocId", isEqualTo: self.DocumentIdList[indexPath.section]).getDocuments { (querySnapshot, error) in
                        if error != nil {
                            print(error!)
                        } else {
                            for document in querySnapshot!.documents {
                                document.reference.delete()
                            }
                        }
                    }
                    self.PList.remove(at: indexPath.section)
                    self.CaList.remove(at: indexPath.section)
                    self.MgList.remove(at: indexPath.section)
                    self.KList.remove(at: indexPath.section)
                    self.NaList.remove(at: indexPath.section)
                    self.ClList.remove(at: indexPath.section)
                    self.SList.remove(at: indexPath.section)
                    self.reportNameList.remove(at: indexPath.section)
                    self.reportDateList.remove(at: indexPath.section)
                    self.DocumentIdList.remove(at: indexPath.section)
                    if(self.reportNameList.count == 0) {
                        self.tblView.refreshControl?.endRefreshing()
                        self.tblView.alpha = 0
                        self.hiddenView.alpha = 1
                    } else {
                        self.tblView.reloadData()
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
             
            else if (self.screenNAME == "premix") {
                let alert = UIAlertController(title: "Delete Premix Data", message: "Are you sure you want to delete this premix data?", preferredStyle: .alert)
                
                let ok = UIAlertAction(title: "Yes", style: .destructive, handler: { action in
                    self.db.collection("premixReports").document(self.userID!).collection("premixReports").whereField("DocId", isEqualTo: self.DocumentIdList[indexPath.section]).getDocuments { (querySnapshot, error) in
                        if error != nil {
                            print(error!)
                        } else {
                            for document in querySnapshot!.documents {
                                document.reference.delete()
                            }
                        }
                    }
                    self.productNameList.remove(at: indexPath.section)
                    self.reportDateList.remove(at: indexPath.section)
                    self.productDoseList.remove(at: indexPath.section)
                    self.DocumentIdList.remove(at: indexPath.section)
                    self.reportNameList.remove(at: indexPath.section)
                    self.pMacroList.remove(at: indexPath.section)
                    self.caMacroList.remove(at: indexPath.section)
                    self.mgMacroList.remove(at: indexPath.section)
                    self.kMacroList.remove(at: indexPath.section)
                    self.naMacroList.remove(at: indexPath.section)
                    self.clMacroList.remove(at: indexPath.section)
                    self.sMacroList.remove(at: indexPath.section)
                    self.coMicroList.remove(at: indexPath.section)
                    self.iMicroList.remove(at: indexPath.section)
                    self.mnMicroList.remove(at: indexPath.section)
                    self.cuMicroList.remove(at: indexPath.section)
                    self.feMicroList.remove(at: indexPath.section)
                    self.cuOrganicMicroList.remove(at: indexPath.section)
                    self.seMicroList.remove(at: indexPath.section)
                    self.seOrganicMicroList.remove(at: indexPath.section)
                    self.znMicroList.remove(at: indexPath.section)
                    self.znOrganicMicroList.remove(at: indexPath.section)
                    self.aiuVitaminList.remove(at: indexPath.section)
                    self.diuVitaminList.remove(at: indexPath.section)
                    self.eiuVitaminList.remove(at: indexPath.section)
                    self.niacinVitaminList.remove(at: indexPath.section)
                    self.biotinVitaminList.remove(at: indexPath.section)
                    if(self.productNameList.count == 0) {
                        self.tblView.refreshControl?.endRefreshing()
                        self.tblView.alpha = 0
                        self.hiddenView.alpha = 1
                    } else {
                        self.tblView.reloadData()
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
           
        }
        deleteAction.backgroundColor = .red

        return [editAction,deleteAction]
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (screenNAME == "ration") {
            let vcone = storyboard?.instantiateViewController(withIdentifier: "feedthreeViewController") as? feedthreeViewController;
            dropdownvalues = copyArray[indexPath.section]["ProductNameArray"] as! [String]
            dropdownfloatValue = copyArray[indexPath.section]["ProductValueArray"] as! [String]
            vcone?.documentID = DocumentIdList[indexPath.section]
            vcone?.ReportName = reportNameList[indexPath.section]
            vcone?.checkStatus = true
            vcone?.tableDataServer = true
            vcone?.valueArrayCount = dropdownfloatValue.count
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
