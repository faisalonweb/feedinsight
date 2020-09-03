//
//  feedthreeViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 21/07/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import iOSDropDown
import Firebase
import FirebaseUI
import FirebaseAuth
import FirebaseFirestore

var subUrl: URL?
var fm = FileManager.default
var fresult: Bool = false
var mainUrl: URL? = Bundle.main.url(forResource: "Athletes", withExtension: "json")

class feedthreeViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource, feedthreeTableViewCellDelegate {
    var dropdownvalues = [String]()
    var dropdownfloatValue = [String]()
    @IBOutlet weak var userNameLabel: UILabel!
    var getNameData = [String]()
    var getValueData = [String]()
    let userID = Auth.auth().currentUser?.uid
    @IBOutlet weak var addfeed: DropDown!
    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var addbtn: UIButton!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var plusbutton: UIButton!
    let defaults = UserDefaults.standard
    
    var productList: [Person] = []
    var selectedProductList: [Person] = []
    
    func getData() {
        do {
            let documentDirectory = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            subUrl = documentDirectory.appendingPathComponent("Athletes.json")
            loadFile(mainPath: mainUrl!, subPath: subUrl!)
        } catch {
            print(error)
        }
    }
    
    func loadFile(mainPath: URL, subPath: URL){
        if fm.fileExists(atPath: subPath.path){
            decodeData(pathName: subPath)
            if addfeed.optionArray.isEmpty{
                decodeData(pathName: mainPath)
            }
        }else{
            decodeData(pathName: mainPath)
        }
    }
    
    func decodeData(pathName: URL){
        do{
            let jsonData = try Data(contentsOf: pathName)
            let decoder = JSONDecoder()
            productList = try decoder.decode([Person].self, from: jsonData)
            let count = productList.count
            for i in 0...count - 1 {
                let name = productList[i].FeedName
                addfeed.optionArray.append(name)
            }
        } catch {}
    }
    
    override func viewDidLoad() {
        getData()
        self.navigationController?.isNavigationBarHidden = true
        super.viewDidLoad()
        profileimage?.layer.cornerRadius = (profileimage?.frame.size.width ?? 0.0) / 2
        addbtn.layer.cornerRadius = 8
        editBtn.layer.cornerRadius = 8
        plusbutton.layer.cornerRadius = 28
        addfeed.didSelect{(selectedText , index ,id) in
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let userName = defaults.value(forKey: "usernameStringKey"){
            self.userNameLabel.text = userName as? String
            print(userName)
        }
        DispatchQueue.main.async { [weak self] in
            let data = self?.defaults.value(forKey: "imageData") as? Data
            if(data != nil) {
                self?.profileimage.image = UIImage(data: data!)
            }
        }
    }
    func calculateFloatArray () {
        dropdownfloatValue.removeAll()
        for i in 0..<dropdownvalues.count {
            let indexPath = IndexPath(row: 0, section: i)
            if let cell = tblView.cellForRow(at: indexPath) as? feedthreeTableViewCell {
                if(cell.productValue.text != "") {
                    dropdownfloatValue.append(cell.productValue.text ?? "0")
                } else {
                    dropdownfloatValue.append("none")
                }
            } else {
                dropdownfloatValue.append("none")
            }
        }
    }
    func minusTapped(cellIndex: Int) {
        calculateFloatArray()
        dropdownvalues.remove(at: cellIndex)
        dropdownfloatValue.remove(at: cellIndex)
        tblView.reloadData()
    }
    @IBAction func backBtn(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    @IBAction func onClickLoad(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "waterrationViewController") as? waterrationViewController
        vc?.screenNAME = "ration"
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @IBAction func nextTap(_ sender: Any) {
        calculateFloatArray()
        if(dropdownvalues.count == dropdownfloatValue.count && dropdownvalues.count > 0 ) {
            var dmi : Double = 0
            var boolValue : Bool = false
            for i in 0..<dropdownvalues.count {
                if(dropdownfloatValue[i] == "none") {
                    boolValue = true
                    let alertController = UIAlertController(title: "Error", message: "Fill all fields.", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                    break
                }
            }
            if(boolValue == false) {
                for i in 0..<dropdownvalues.count {
                    var productDM : Double = 0
                    if(dropdownfloatValue[i] != "none") {
                        productDM = Double(dropdownfloatValue[i])! * selectedProductList[i].DryMatter
                        dmi = dmi + productDM
                        print(dmi)
                    } else {
                        let alertController = UIAlertController(title: "Error", message: "Fill all fields.", preferredStyle: .alert)
                        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        alertController.addAction(defaultAction)
                        self.present(alertController, animated: true, completion: nil)
                    }
                    
                }
                dmi = dmi / 100.0
                //let requirments = Requirments()
                requirments.DMI = dmi
                requirments.finalProductList = selectedProductList
                requirments.finalDropdownfloatValue = dropdownfloatValue
                requirments.calculateRationData()
                requirments.calculateRequirmentsData()
                let vc = storyboard?.instantiateViewController(withIdentifier: "waterViewController") as? wateroneViewController
                self.navigationController?.pushViewController(vc!, animated: true)
            }
        } else {
            let alertController = UIAlertController(title: "Error", message: "Fill all fields.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    @IBAction func saveButtonPressed(_ sender: Any) {
        let currentDateTime = Date()
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .long
        calculateFloatArray()
        if(dropdownvalues.count == dropdownfloatValue.count && dropdownvalues.count > 0 ) {
            let datetimestamp = formatter.string(from: currentDateTime)
            let db = Firestore.firestore()
            let alertController = UIAlertController(title: "Report Name", message: "", preferredStyle: .alert)
            let withdrawAction = UIAlertAction(title: "Save", style: .default) { (aciton) in
                let text = alertController.textFields!.first!.text!
                let dict : [String : Any] = ["ProductNameArray" : self.dropdownvalues , "ProductValueArray" : self.dropdownfloatValue , "ReportName" : text ,"currenttimedate" : datetimestamp]
                db.collection("rationReports").document(self.userID!).collection("rationReports").addDocument(data: dict){ err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added")
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
            self.present(alertController, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "Error", message: "Fill all fields.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
        
    }
    
    
    @IBAction func editFeed(_ sender: Any) {
        if addfeed.text == "" {
            self.showError("Select Feed value")
        } else {
            for item in productList {
                let name = item.FeedName
                if(addfeed.text == name) {
                    let vc = storyboard?.instantiateViewController(withIdentifier: "EditPremixViewController") as?  EditPremixViewController
                    vc?.editList = [item]
                    vc?.screenName = "Edit Feed"
                    self.navigationController?.pushViewController(vc!, animated: true)
                    
                }
            }
        }
        
    }
    
    @IBAction func addFeedButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "EditPremixViewController") as?  EditPremixViewController
        vc?.screenName = "Add Feed"
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    @IBAction func touchaddbtn(_ sender: Any) {
        if addfeed.text == "" {
            self.showError("Select dropdown value")
        } else {
            if dropdownvalues.contains(addfeed.text!) {
                self.showError("Already added.")
            } else {
                print(addfeed.text ?? "none")
                dropdownvalues.append(addfeed.text ?? "none")
                for item in productList {
                    let name = item.FeedName
                    if(addfeed.text == name) {
                        selectedProductList.append(item)
                        break
                    }
                }
                calculateFloatArray()
                print("paki")
                print("array values is \(dropdownvalues)")
                tblView.reloadData()
            }
            
        }
    }
    func showError(_ message:String) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! feedthreeTableViewCell
        cell.labeltxt?.text = dropdownvalues[indexPath.section]
        let stringValue = dropdownfloatValue[indexPath.section]
        if( stringValue == "none") {
            cell.productValue?.text = ""
        } else {
            cell.productValue?.text = stringValue
        }
        cell.delegate = self
        cell.cellIndex = indexPath.section
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.dropdownvalues.count
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
}


