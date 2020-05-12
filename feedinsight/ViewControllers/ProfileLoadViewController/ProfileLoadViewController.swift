//
//  ProfileLoadViewController.swift
//  FeedInsight
//
//  Created by Mac on 26/04/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

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
    
    
    var tableViewData = [cellData]()
    let cellSpacingHeight: CGFloat = 20
    
    @IBAction func backtapped(_ sender: UIButton) {
     //  self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.backgroundColor = UIColor.white
        tableview.register(UINib(nibName: "profileTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "titlecell")
        
        tableViewData = [cellData(opened: false, title: "Ruminants", sectionData: ["cell1", "cell2", "cell3"]),
                         cellData(opened: false, title: "Poultry", sectionData: ["cell1", "cell2", "cell3"]),
                         cellData(opened: false, title: "aqua", sectionData: ["cell1", "cell2", "cell3"]),
                         cellData(opened: false, title: "Goat", sectionData: ["cell1", "cell2", "cell3"])
            
        ]
        let devCousesImages = [UIImage(named: "ruminants"), UIImage(named: "aqua"), UIImage(named: "equines"), UIImage(named: "chicken")]
        
        
        userprofile?.layer.cornerRadius = (userprofile?.frame.size.width ?? 0.0) / 2
               userprofile?.clipsToBounds = true
               userprofile?.layer.borderWidth = 3.0
               userprofile?.layer.borderColor = UIColor.white.cgColor
               
               notification?.layer.cornerRadius = (notification?.frame.size.width ?? 0.0) / 2
               notification?.clipsToBounds = true
               notification?.layer.borderWidth = 3.0
               notification?.layer.borderColor = UIColor.white.cgColor
        
        
    }
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
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
                else { return ProfileloadTableViewCell()}
            // cell.textLabel?.text = tableViewData[indexPath.section].title
            cell.layer.borderColor = UIColor.white.cgColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 8
            cell.clipsToBounds = true
            
            
            
            
            return cell 
            
            
        } else
        {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "titlecell") else { return profileTitleTableViewCell()}
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
                tableViewData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }
            else
            {
                tableViewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)
            }
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
