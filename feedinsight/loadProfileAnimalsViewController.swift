//
//  loadProfileAnimalsViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 07/07/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class loadProfileAnimalsViewController: UIViewController {
    
    @IBOutlet weak var mainBtn: UIButton!
     var db: Firestore!
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var profileimage: UIImageView!
    

     var animalList = [String]()
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
    override func viewDidLoad() {
        profileimage.layer.cornerRadius = 17
        tblView.isHidden = true
        super.viewDidLoad()
        mainBtn.layer.cornerRadius = 10
    }
    
    override func viewWillAppear(_ animated: Bool) {
         Firestore.firestore().collection("premixReport").getDocuments{(snapshot,error) in

                if error == nil && snapshot != nil {
                guard let snap = snapshot else {return}
                 for document in snap.documents {
                   let documentData = document.data()
                    let animaltype = documentData["animalGroup"] as? String ?? "Anonymous"
                    let timestamp = documentData["currentdate"] as? String ?? "20/20/20"
                    let companytype = documentData["companyName"] as? String ?? "Anonymous"
                    let categortype = documentData["categorySelected"] as? String ?? "Anonymous"
                    let currentweighttype = documentData["CurrentBodyWeight"] as? String ?? "Anonymous"
                    let targetweighttype = documentData["TargetBodyWeight"] as? String ?? "Anonymous"
                    let pregnanttype = documentData["daysPregnant"] as? String ?? "Anonymous"
                    let milktype = documentData["daysinMilk"] as? String ?? "Anonymous"
                    let daysachive = documentData["daystoAchive"] as? String ?? "Anonymous"
                    let milkproductiontype = documentData["milkInProduciton"] as? String ?? "Anonymous"
                    let psyostate = documentData["psychologicalState"] as? String ?? "Anonymous"
                    
                    self.datastation.insert(animaltype, at: 0)
                    self.dataonestation.insert(timestamp, at: 0)
                    self.datathreestation.insert(companytype, at: 0)
                    self.datafourstation.insert(categortype, at: 0)
                    self.datafivestation.insert(currentweighttype, at: 0)
                    self.datasixstation.insert(targetweighttype, at: 0)
                    self.datasevenstation.insert(pregnanttype, at: 0)
                    self.dataeightstation.insert(milktype, at: 0)
                    self.dataninestation.insert(daysachive, at: 0)
                    self.datatenstation.insert(milkproductiontype, at: 0)
                    self.dataelevenstation.insert(psyostate, at: 0)
                        }

                   self.animalList.append(contentsOf: self.datastation)
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
                   self.tblView.reloadData()
                    print(self.psystateList)

                           }
                    else {
                     print("pakis")
                    }
                       }
    }
    
    @IBAction func mainBtnAction(_ sender: Any) {
        
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
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! loadAnimalsTableViewCell
        
        cell.animaltypelabel?.text = animalList[indexPath.section]
        cell.datetypelabel?.text = dateList[indexPath.section]
        cell.layer.cornerRadius = 10
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 58
       }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           
           let vcone = storyboard?.instantiateViewController(withIdentifier: "StateView") as? StateViewController;
           vcone?.nameanimal = animalList[indexPath.section]
           vcone?.groupcompany =  companynameList[indexPath.section]
           vcone?.statepsychlogical =  psystateList[indexPath.section]
           vcone?.bodycurrentweigth =  currentweightList[indexPath.section]
           vcone?.bodytargetweight =  targetweightList[indexPath.section]
           vcone?.achievedays =  daysachieveList[indexPath.section]
           vcone?.milkindays =  daysmilkList[indexPath.section]
           vcone?.pregnantdays =  dayspregnantList[indexPath.section]
           vcone?.productionmilk =  milkproductionList[indexPath.section]
          
           
           
        
           self.navigationController?.pushViewController(vcone!, animated: true)
       }
    
    
}