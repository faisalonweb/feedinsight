//
//  loadProfileAnimalsViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 07/07/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseAuth
import FirebaseFirestore

class loadProfileAnimalsViewController: UIViewController , UIGestureRecognizerDelegate{
    
    @IBOutlet weak var mainBtn: UIButton!
    var db = Firestore.firestore()
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    let defaults = UserDefaults(suiteName:"User")
    let userID = Auth.auth().currentUser?.uid
    var DocumentIdList = [String]()
    var animalList = [String]()
    var reportNameList = [String]()
    var docIdList = [String]()
    var dateList = [String]()
    var companynameList = [String]()
    var categoryList = [String]()
    var currentweightList = [String]()
    var targetweightList = [String]()
    var dayspregnantList = [String]()
    var daysmilkList = [String]()
    var daysachieveList = [String]()
    var milkproductionList = [String]()
    var psystateList = [String]()
    var dietstate = [Bool]()
    var disorderstate = [Bool]()
    var heatstate = [Bool]()
    var productionstate = [Bool]()
    private var documentIdStation = [String]()
    private var datastation = [String]()
    private var dataonestation = [String]()
    private var datathreestation = [String]()
    private var datafourstation = [String]()
    private var datafivestation = [String]()
    private var datasixstation = [String]()
    private var datasevenstation = [String]()
    private var dataeightstation = [String]()
    private var dataninestation = [String]()
    private var datatenstation = [String]()
    private var dataelevenstation = [String]()
    private var datatwelvestation = [Bool]()
    private var datathirteenstation = [Bool]()
    private var datafourteenstation = [Bool]()
    private var datafifteenstation = [Bool]()
    private var datasixteenstation = [String]()
    private var docIdStation = [String]()
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        let popGestureRecognizer = self.navigationController!.interactivePopGestureRecognizer!
        if let targets = popGestureRecognizer.value(forKey: "targets") as? NSMutableArray {
          let gestureRecognizer = UIPanGestureRecognizer()
          gestureRecognizer.setValue(targets, forKey: "targets")
          self.view.addGestureRecognizer(gestureRecognizer)
        }
        //profileimage?.layer.cornerRadius = (profileimage?.frame.size.width ?? 0.0) / 2
        profileimage?.layer.cornerRadius = (profileimage?.frame.size.width ?? 0.0) / 2
        profileimage?.clipsToBounds = true
        profileimage?.layer.borderWidth = 3.0
        profileimage?.layer.borderColor = UIColor.white.cgColor
        
        self.tblView.refreshControl = UIRefreshControl()
        self.tblView.refreshControl?.beginRefreshing()
        super.viewDidLoad()
        
        let script =  ApiCalling()
        script.LoadProfile() { (result) -> ()  in
            if result.count > 0 {
                for documentData in result {
                    let animaltype = documentData["animalGroup"] as? String ?? "Anonymous"
                    let reportName = documentData["reportName"] as? String ?? "Anonymous"
                    let timestamp = documentData["currentdate"] as? String ?? "20/20/20"
                    let docID = documentData["DocId"] as? String ?? "20/20/20"
                    let companytype = documentData["companyName"] as? String ?? "Anonymous"
                    let categortype = documentData["categorySelected"] as? String ?? "Anonymous"
                    let currentweighttype = documentData["CurrentBodyWeight"] as? String ?? "Anonymous"
                    let targetweighttype = documentData["TargetBodyWeight"] as? String ?? "Anonymous"
                    let pregnanttype = documentData["daysPregnant"] as? String ?? "Anonymous"
                    let milktype = documentData["daysinMilk"] as? String ?? "Anonymous"
                    let daysachive = documentData["daystoAchive"] as? String ?? "Anonymous"
                    let milkproductiontype = documentData["milkInProduciton"] as? String ?? "Anonymous"
                    let psyostate = documentData["psychologicalState"] as? String ?? "Anonymous"
                    let dietbolestate = documentData["dietbole"] as? Bool ?? false
                    let disorderbolestate = documentData["disorderbole"] as? Bool ?? false
                    let heatbolestate = documentData["heatbole"] as? Bool ?? false
                    let productionbolestate = documentData["productionbole"] as? Bool ?? false
                    
                    self.datastation.insert(reportName, at: 0)
                    self.dataonestation.insert(timestamp, at: 0)
                    self.docIdStation.insert(docID, at: 0)
                    self.datathreestation.insert(companytype, at: 0)
                    self.datafourstation.insert(categortype, at: 0)
                    self.datafivestation.insert(currentweighttype, at: 0)
                    self.datasixstation.insert(targetweighttype, at: 0)
                    self.datasevenstation.insert(pregnanttype, at: 0)
                    self.dataeightstation.insert(milktype, at: 0)
                    self.dataninestation.insert(daysachive, at: 0)
                    self.datatenstation.insert(milkproductiontype, at: 0)
                    self.dataelevenstation.insert(psyostate, at: 0)
                    self.datatwelvestation.insert(dietbolestate, at: 0)
                    self.datathirteenstation.insert(disorderbolestate, at: 0)
                    self.datafourteenstation.insert(heatbolestate, at: 0)
                    self.datafifteenstation.insert(productionbolestate, at: 0)
                    self.datasixteenstation.insert(animaltype, at: 0)
                }
                self.reportNameList.append(contentsOf: self.datastation)
                self.animalList.append(contentsOf: self.datasixteenstation)
                self.docIdList.append(contentsOf: self.docIdStation)
                self.dateList.append(contentsOf: self.dataonestation)
                self.companynameList.append(contentsOf: self.datathreestation)
                self.categoryList.append(contentsOf: self.datafourstation)
                self.currentweightList.append(contentsOf: self.datafivestation)
                self.targetweightList.append(contentsOf: self.datasixstation)
                self.dayspregnantList.append(contentsOf: self.datasevenstation)
                self.daysmilkList.append(contentsOf: self.dataeightstation)
                self.daysachieveList.append(contentsOf: self.dataninestation)
                self.milkproductionList.append(contentsOf: self.datatenstation)
                self.psystateList.append(contentsOf: self.dataelevenstation)
                self.dietstate.append(contentsOf: self.datatwelvestation)
                self.disorderstate.append(contentsOf: self.datathirteenstation)
                self.heatstate.append(contentsOf: self.datafourteenstation)
                self.productionstate.append(contentsOf: self.datafifteenstation)
                self.tblView.reloadData()
                print(self.productionstate)
                
                self.tblView.refreshControl?.endRefreshing()
            }
            else {
                print("pakis")
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        if let userName = defaults!.value(forKey: "usernameStringKey"){
            self.userNameLabel.text = userName as? String
            print(userName)
        }
        DispatchQueue.main.async { [weak self] in
            let data = self?.defaults!.value(forKey: "imageData") as? Data
            if(data != nil) {
                self?.profileimage.image = UIImage(data: data!)
            }
        }
    }
    //    @IBAction func mainBtnAction(_ sender: Any) {
    //
    //        if tblView.isHidden {
    //            animate(toggle: true)
    //        } else {
    //            animate(toggle: false)
    //        }
    //    }
    @IBAction func backBtn(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
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
}
extension loadProfileAnimalsViewController: UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.animalList.count
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
 
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            db.collection("animalState").document(self.userID!).collection("animalState").whereField("DocId", isEqualTo: docIdList[indexPath.section]).getDocuments { (querySnapshot, error) in
                if error != nil {
                    print(error!)
                } else {
                    for document in querySnapshot!.documents {
                        document.reference.delete()
                    }
                }
            }
            animalList.remove(at: indexPath.section)
            reportNameList.remove(at: indexPath.section)
            docIdList.remove(at: indexPath.section)
            companynameList.remove(at: indexPath.section)
            psystateList.remove(at: indexPath.section)
            currentweightList.remove(at: indexPath.section)
            targetweightList.remove(at: indexPath.section)
            daysachieveList.remove(at: indexPath.section)
            daysmilkList.remove(at: indexPath.section)
            dayspregnantList.remove(at: indexPath.section)
            milkproductionList.remove(at: indexPath.section)
            dietstate.remove(at: indexPath.section)
            disorderstate.remove(at: indexPath.section)
            heatstate.remove(at: indexPath.section)
            productionstate.remove(at: indexPath.section)
            categoryList.remove(at: indexPath.section)
            tblView.reloadData()
            
        }
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! loadAnimalsTableViewCell
        
        cell.animaltypelabel?.text = reportNameList[indexPath.section]
        cell.datetypelabel?.text = dateList[indexPath.section]
        cell.layer.cornerRadius = 10
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcone = storyboard?.instantiateViewController(withIdentifier: "StateView") as? StateViewController;
        vcone?.stateStatus = true
        vcone?.nameanimal = animalList[indexPath.section]
        vcone?.ReportName = reportNameList[indexPath.section]
        vcone?.documentId = docIdList[indexPath.section]
        vcone?.groupcompany =  companynameList[indexPath.section]
        vcone?.statepsychlogical =  psystateList[indexPath.section]
        vcone?.bodycurrentweigth =  currentweightList[indexPath.section]
        vcone?.bodytargetweight =  targetweightList[indexPath.section]
        vcone?.achievedays =  daysachieveList[indexPath.section]
        vcone?.milkindays =  daysmilkList[indexPath.section]
        vcone?.pregnantdays =  dayspregnantList[indexPath.section]
        vcone?.productionmilk =  milkproductionList[indexPath.section]
        vcone?.dietbole =  dietstate[indexPath.section]
        vcone?.disorderbole =  disorderstate[indexPath.section]
        vcone?.heatbole =  heatstate[indexPath.section]
        vcone?.productionbole =  productionstate[indexPath.section]
        vcone?.hdLabel = categoryList[indexPath.section]
        self.navigationController?.pushViewController(vcone!, animated: true)
    }
}
