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
    @IBOutlet weak var backBtn: UIButton!
    var check = false
    var tableViewData = [cellData]()
    let cellSpacingHeight: CGFloat = 20
    var db: Firestore!
    var pickerData1: [String] = [String]()
    var workarray: [String] = [String]()
    let test = ["haha","hhabs"]
    private var documents: [DocumentSnapshot] = []
    public var tasks: [Task] = []
    private var listener : ListenerRegistration!
    
    fileprivate func baseQuery() -> Query {
        return Firestore.firestore().collection("premixReport").limit(to: 50)
    }
    
    fileprivate var query: Query? {
        didSet {
            if let listener = listener {
                listener.remove()
            }
        }
    }
    @IBAction func backtapped(_ sender: UIButton) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.listener =  query?.addSnapshotListener { (documents, error) in
            guard documents != nil else {
                print("Error fetching documents results: \(error!)")
                return
            }
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.listener.remove()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.query = baseQuery()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        let backButton = UIBarButtonItem(title: "", style: .plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        
        userprofile?.layer.cornerRadius = (userprofile?.frame.size.width ?? 0.0) / 2
        userprofile?.clipsToBounds = true
        userprofile?.layer.borderWidth = 3.0
        userprofile?.layer.borderColor = UIColor.white.cgColor
        
        notification?.layer.cornerRadius = (notification?.frame.size.width ?? 0.0) / 2
        notification?.clipsToBounds = true
        notification?.layer.borderWidth = 3.0
        notification?.layer.borderColor = UIColor.white.cgColor
        
        tableview.backgroundColor = UIColor.white
        tableview.register(UINib(nibName: "profileTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "titlecell")
        // lactating 10
        tableViewData = [cellData(opened: false, title: "Lactaing", sectionData: ["cell1", "cell2", "cell3"]),
                         cellData(opened: false, title: "Growing", sectionData: ["cell1", "cell2", "cell3"]),
                         cellData(opened: false, title: "Dry-Gestating", sectionData: ["cell1", "cell2", "cell3"])]
        let db = Firestore.firestore()
        db.collection("premixReport").whereField("userID", isEqualTo: Auth.auth().currentUser!.uid).getDocuments { (querySnapshot, Error) in
            if (Error != nil) {
                print(Error!)
            } else {
                for document in querySnapshot!.documents{
                    print(document.data())
                }
            }
        }
        print("its hhhah", pickerData1)
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
        _ = indexPath.row - 1
        let _: IndexPath = IndexPath(row:0, section:0)
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProfileloadTableViewCell
            cell.layer.borderColor = UIColor.white.cgColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 8
            cell.clipsToBounds = true
            if(check == false)
            {
                cell.arrowView?.image = UIImage(named: "right-arrow")      // right-arrow
            }
            else{
                cell.arrowView?.image = UIImage(named: "downNew")
            }
            cell.textlabel?.text = tableViewData[indexPath.section].title
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "titlecell") else { return profileTitleTableViewCell()}
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
            print("does not exists")
            if let navController = self.navigationController {
                navController.popViewController(animated: true)
            }
            let _: CGFloat = 20
        }
        
    }
}
