//
//  ProfileLoadViewController.swift
//  FeedInsight
//
//  Created by Mac on 26/04/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [String]()
    
}


class ProfileLoadViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var userprofile: UIImageView!
    @IBOutlet weak var notification: UIImageView!
    
    var check = false
    var tableViewData = [cellData]()
    let cellSpacingHeight: CGFloat = 20
     var db: Firestore!
    var pickerData1: [String] = [String]()
    var workarray: [String] = [String]()
    let test = ["haha","hhabs"]
    @IBAction func backtapped(_ sender: UIButton) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // let db = Firestore.firestore()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
             self.navigationController?.navigationBar.shadowImage = UIImage()
               let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
                     navigationItem.leftBarButtonItem = backButton
        
        
        
        tableview.backgroundColor = UIColor.white
        tableview.register(UINib(nibName: "profileTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "titlecell")
        
        tableViewData = [cellData(opened: false, title: "Ruminants", sectionData: ["cell1", "cell2", "cell3"]),
                         cellData(opened: false, title: "Poultry", sectionData: ["cell1", "cell2", "cell3"]),
                         cellData(opened: false, title: "aqua", sectionData: ["cell1", "cell2", "cell3"]),
                         cellData(opened: false, title: "Goat", sectionData: ["cell1", "cell2", "cell3"])
            
        ]
        let devCousesImages = [UIImage(named: "ruminants"), UIImage(named: "aqua"), UIImage(named: "equines"), UIImage(named: "chicken")]
        //
        let db = Firestore.firestore()
//        db.collection("premixReport").whereField("userID", isEqualTo: Auth.auth().currentUser!.uid).getDocuments { (SnapshotMetadata, Error) in
//           if (Error != nil) {
//                 print(Error)
//                     }
//                 else
//                 {
//                   for document in (SnapshotMetadata?.documents)! {
//                    let name = (document.data()["category"]) as! String
//
////                    for item in self.workarray
////                                    {
////                                        self.pickerData1.append(item)
////                                    }
//                     }
//                }
//                      
//        }
print("its hhhah", pickerData1)
        //
        
        userprofile?.layer.cornerRadius = (userprofile?.frame.size.width ?? 0.0) / 2
               userprofile?.clipsToBounds = true
               userprofile?.layer.borderWidth = 3.0
               userprofile?.layer.borderColor = UIColor.white.cgColor
               
               notification?.layer.cornerRadius = (notification?.frame.size.width ?? 0.0) / 2
               notification?.clipsToBounds = true
               notification?.layer.borderWidth = 3.0
               notification?.layer.borderColor = UIColor.white.cgColor
        
        
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return
//    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1
        } else
        {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataIndex = indexPath.row - 1
        let selectedIndexPaths: IndexPath = IndexPath(row:0, section:0)
        if indexPath.row == 0 {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
//                else { return ProfileloadTableViewCell()}
              let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileloadTableViewCell
            cell.layer.borderColor = UIColor.white.cgColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 8
            cell.clipsToBounds = true
            //let index = test.indexOf()
           // cell.imageView?.image = devCousesImages[0]
            if(check == false)
            {
                cell.arrowView?.image = UIImage(named: "right-arrow")      // right-arrow
            }
            else{
                cell.arrowView?.image = UIImage(named: "downNew")
            }
            
            return cell 
            
            
        } else
        {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "titlecell") else { return profileTitleTableViewCell()}
//             cell.layer.borderColor = UIColor.clear.cgColor
//                       cell.layer.borderWidth = 4
                      
            // cell.textLabel?.text = tableViewData[indexPath.section].sectionData[dataIndex]
            
            return cell
            
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
            if tableViewData[indexPath.section].opened == true
            {
                  check = false
                tableViewData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
              
            }
            else
            {
                 check = true
                tableViewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
               
                
            }
        }
        else
        {
            if let stack = self.navigationController?.viewControllers {
              for vc in stack where vc.isKind(of: ProfileLoadViewController.self) {
                print("exists")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "StateView") as! StateViewController
                self.navigationController?.pushViewController(vc, animated: true)
              }
            }
            else
            {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "StateView") as! StateViewController
               self.present(vc, animated: true, completion: nil)
                print("does not exists")
            }
           
             let cellSpacingHeight: CGFloat = 20
        }
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
