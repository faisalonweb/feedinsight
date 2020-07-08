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
     
    
    private var datastation = [String]()
    private var dataonestation = [String]()
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
                    self.datastation.insert(animaltype, at: 0)
                    self.dataonestation.insert(timestamp, at: 0)
                        }

                   self.animalList.append(contentsOf: self.datastation)
                   self.dateList.append(contentsOf: self.dataonestation)
                    self.tblView.reloadData()
                    print(self.animalList)

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
    
    
}
