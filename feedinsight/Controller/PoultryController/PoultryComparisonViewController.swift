//
//  PoultryComparisonViewController.swift
//  FeedInsight
//
//  Created by Hamza Iqbal on 21/12/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import SwiftMessages

class PoultryComparisonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UIGestureRecognizerDelegate {
    @IBOutlet weak var databaseTableView: UITableView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    var selectedArray: [String] = []
    var nameArray: [String] = ["Totalvit Vitall/Minerall Broiler",
                               "Totalvit Vitall/Minerall Layer",
                               "Totalvit Vitall/Minerall Breeder",
                               //"Totalvit Minerall Broiler",
                               //"Totalvit Minerall Layer",
                               //"Totalvit Minerall Breeder",
                               
                               "Ross Broiler Starter", "Ross Broiler Grower", "Ross Broiler Finisher",
                               "Cobb Broiler Starter", "Cobb Broiler Grower", "Cobb Broiler Finisher",
                               "Hubbard Broiler Starter", "Hubbard Broiler Grower", "Hubbard Broiler Finisher",
                               //"Broiler Other Starter", "Broiler Other Grower", "Broiler Other Finisher",
                               
                               "Ross Broiler Breeder Starter/Grower", "Ross Broiler Breeder Production",
                               "Cobb Broiler Breeder Starter/Grower", "Cobb Broiler Breeder Production",
                               "Hubbard Broiler Breeder Starter/Grower", "Hubbard Broiler Breeder Production",
                               //"Broiler Breeder Other Starter/Grower", "Broiler Breeder Other Production",
                               
                               "Bovan Layer Starter/Grower", "Bovan Layer Production",
                               "NickChick Layer Starter/Grower", "NickChick Layer Production",
                               "LSL Layer Starter/Grower", "LSL Layer Production",
                               "Hyline Layer Starter/Grower", "Hyline Layer Production",
                               "Novogen Layer Starter/Grower", "Novogen Layer Production",
                               //"Layer Other Starter/Grower", "Layer Other Production",
                               
                               "Bovan Layer Breeder Starter/Grower", "Bovan Layer Breeder Production",
                               "NickChick Layer Breeder Starter/Grower", "NickChick Layer Breeder Production",
                               "LSL Layer Breeder Starter/Grower", "LSL Layer Breeder Production",
                               "Hyline Layer Breeder Starter/Grower", "Hyline Layer Breeder Production",
                               "Novogen Layer Breeder Starter/Grower", "Novogen Layer Breeder Production",
                               //"Layer Breeder Other Starter/Grower", "Layer Breeder Other Production"
    ]
    var nameArrayCopy: [String] = ["Totalvit Vitall/Minerall Broiler",
                                   "Totalvit Vitall/Minerall Layer",
                                   "Totalvit Vitall/Minerall Breeder",
                                   //"Totalvit Minerall Broiler",
                                   //"Totalvit Minerall Layer",
                                   //"Totalvit Minerall Breeder",
                                   
                                   "Ross Broiler Starter", "Ross Broiler Grower", "Ross Broiler Finisher",
                                   "Cobb Broiler Starter", "Cobb Broiler Grower", "Cobb Broiler Finisher",
                                   "Hubbard Broiler Starter", "Hubbard Broiler Grower", "Hubbard Broiler Finisher",
                                   //"Broiler Other Starter", "Broiler Other Grower", "Broiler Other Finisher",
                                   
                                   "Ross Broiler Breeder Starter/Grower", "Ross Broiler Breeder Production",
                                   "Cobb Broiler Breeder Starter/Grower", "Cobb Broiler Breeder Production",
                                   "Hubbard Broiler Breeder Starter/Grower", "Hubbard Broiler Breeder Production",
                                   //"Broiler Breeder Other Starter/Grower", "Broiler Breeder Other Production",
                                   
                                   "Bovan Layer Starter/Grower", "Bovan Layer Production",
                                   "NickChick Layer Starter/Grower", "NickChick Layer Production",
                                   "LSL Layer Starter/Grower", "LSL Layer Production",
                                   "Hyline Layer Starter/Grower", "Hyline Layer Production",
                                   "Novogen Layer Starter/Grower", "Novogen Layer Production",
                                   //"Layer Other Starter/Grower", "Layer Other Production",
                                   
                                   "Bovan Layer Breeder Starter/Grower", "Bovan Layer Breeder Production",
                                   "NickChick Layer Breeder Starter/Grower", "NickChick Layer Breeder Production",
                                   "LSL Layer Breeder Starter/Grower", "LSL Layer Breeder Production",
                                   "Hyline Layer Breeder Starter/Grower", "Hyline Layer Breeder Production",
                                   "Novogen Layer Breeder Starter/Grower", "Novogen Layer Breeder Production",
                                   //"Layer Breeder Other Starter/Grower", "Layer Breeder Other Production"
        ]
    
    let defaults = UserDefaults(suiteName:"User")
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        searchTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        userImage?.layer.cornerRadius = (userImage?.frame.size.width ?? 0.0) / 2
        userImage?.clipsToBounds = true
        userImage?.layer.borderWidth = 3.0
        userImage?.layer.borderColor = UIColor.white.cgColor
        let tapOnImage = UITapGestureRecognizer.init(target: self, action: #selector(tapOnImageAction))
        self.userImage.addGestureRecognizer(tapOnImage)
        self.userImage.isUserInteractionEnabled = true
        Requirments.shared().selectedPoultryArrayValues.removeAll()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let userName = defaults!.value(forKey: "usernameStringKey"){
            self.userName.text = userName as? String
            print(userName)
        }
        DispatchQueue.global().async {
            DispatchQueue.main.async {
                let data = self.defaults!.value(forKey: "imageData") as? Data
                if(data != nil) {
                    self.userImage.image = UIImage(data: data!)
                }
            }
        }
        
    }
    
    @objc func tapOnImageAction() {
        self.tabBarController?.selectedIndex = 2
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if(textField.text == "") {
            nameArrayCopy = nameArray
            databaseTableView.reloadData()
        } else {
            filterContentForSearchText(searchText: textField.text!)
            databaseTableView.reloadData()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.superview?.endEditing(true)
        return false
    }
    func  textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
        nameArrayCopy = nameArray
        databaseTableView.reloadData()
    }
    
    func filterContentForSearchText(searchText: String) {
        nameArrayCopy = nameArray.filter { item in
            return item.lowercased().contains(searchText.lowercased())
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! loadDatabaseTableViewCell
        
        cell.productName?.text = nameArrayCopy[indexPath.section]
        if selectedArray.contains(where: { ($0) == cell.productName?.text }) {
            cell.checkImage.image = UIImage(named: "animalcheck")
//            if(indexPath.section < 3) {
//                let indexPath = IndexPath(row: 0, section: indexPath.section + 3)
//                let cell1 = tableView.cellForRow(at: indexPath)  as! loadDatabaseTableViewCell
//                cell1.checkImage.image = UIImage(named: "animalcheck")
//            } else if(indexPath.section > 2 && indexPath.section < 6) {
//                let indexPath = IndexPath(row: 0, section: indexPath.section - 3)
//                let cell1 = tableView.cellForRow(at: indexPath)  as! loadDatabaseTableViewCell
//                cell1.checkImage.image = UIImage(named: "animalcheck")
//            }
        } else {
            cell.checkImage.image = UIImage(named: "animaluncheck")
//            if(indexPath.section < 3) {
//                let indexPath = IndexPath(row: 0, section: indexPath.section + 3)
//                let cell1 = tableView.cellForRow(at: indexPath)  as! loadDatabaseTableViewCell
//                cell1.checkImage.image = UIImage(named: "animaluncheck")
//            } else if(indexPath.section > 2 && indexPath.section < 6) {
//                let indexPath = IndexPath(row: 0, section: indexPath.section - 3)
//                let cell1 = tableView.cellForRow(at: indexPath)  as! loadDatabaseTableViewCell
//                cell1.checkImage.image = UIImage(named: "animaluncheck")
//            }
        }
        return cell
    }
    
    func showError(_ message:String) {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(.error)
        view.configureDropShadow()
        view.configureContent(title: "Error", body: message)
        SwiftMessages.show(view: view)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! loadDatabaseTableViewCell
        if selectedArray.contains(cell.productName.text!) {
            cell.checkImage.image = UIImage(named: "animaluncheck")
//            if(indexPath.section < 3) {
//                let indexPath = IndexPath(row: 0, section: indexPath.section + 3)
//                let cell1 = tableView.cellForRow(at: indexPath)  as! loadDatabaseTableViewCell
//                cell1.checkImage.image = UIImage(named: "animaluncheck")
//            } else if(indexPath.section > 2 && indexPath.section < 6) {
//                let indexPath = IndexPath(row: 0, section: indexPath.section - 3)
//                let cell1 = tableView.cellForRow(at: indexPath)  as! loadDatabaseTableViewCell
//                cell1.checkImage.image = UIImage(named: "animaluncheck")
//            }
            for i in 0 ..< selectedArray.count {
                if(selectedArray[i] == cell.productName.text) {
                    selectedArray.remove(at: i)
                    Requirments.shared().selectedPoultryArrayValues.remove(at: i)
                    break
                }
            }
        } else {
            if(selectedArray.count < 4) {
                cell.checkImage.image = UIImage(named: "animalcheck")
//                if(indexPath.section < 3) {
//                    let indexPath = IndexPath(row: 0, section: indexPath.section + 3)
//                    let cell1 = tableView.cellForRow(at: indexPath)  as! loadDatabaseTableViewCell
//                    cell1.checkImage.image = UIImage(named: "animalcheck")
//                } else if(indexPath.section > 2 && indexPath.section < 6) {
//                    let indexPath = IndexPath(row: 0, section: indexPath.section - 3)
//                    let cell1 = tableView.cellForRow(at: indexPath)  as! loadDatabaseTableViewCell
//                    cell1.checkImage.image = UIImage(named: "animalcheck")
//                }
                selectedArray.append(cell.productName.text ?? "none")
                Requirments.shared().selectedPoultryArrayValues.append(Requirments.shared().totalPoultryValuesArray[indexPath.section])
            }else {
                showError("You can just compare 4 premixes at one time.")
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.nameArrayCopy.count
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
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    @IBAction func doneBtnTapped(_ sender: Any) {
        if(selectedArray.count > 1) {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "PoultryPDFViewController") as? PoultryPDFViewController
            vc?.checkPoultryStatus = "comparisonScreen"
            let busines = defaults!.value(forKey: "userbussinessStringKey")
            Requirments.shared().poultryCompanyName = busines as? String
            Requirments.shared().poultryType = "Standard"
            Requirments.shared().poultryStrain = "Standard"
            Requirments.shared().poultryPsychlogyState = "Standard"
            Requirments.shared().selectedPoultryArray = selectedArray
            self.navigationController?.pushViewController(vc!, animated: true)
        }else {
            showError("Please select atleast 2 premixes to compare.")
        }
        
    }
    
    @IBAction func deselectAll(_ sender: Any) {
        Requirments.shared().selectedPoultryArrayValues.removeAll()
        self.selectedArray.removeAll()
        self.databaseTableView.reloadData()
    }
}

