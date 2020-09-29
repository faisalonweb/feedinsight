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
import SVProgressHUD
import SearchTextField

var subUrl: URL?
var fm = FileManager.default
var fresult: Bool = false
var mainUrl: URL? = Bundle.main.url(forResource: "Athletes", withExtension: "json")
var productList: [Person] = []
var currentIndex = 0


class feedthreeViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource, feedthreeTableViewCellDelegate, UIGestureRecognizerDelegate, UITextFieldDelegate {
    var dropdownvalues = [String]()
    var dropdownfloatValue = [String]()
    var documentID : String = ""
    var ReportName : String = ""
    @IBOutlet weak var userNameLabel: UILabel!
    var getNameData = [String]()
    var getValueData = [String]()
    let userID = Auth.auth().currentUser?.uid
    @IBOutlet weak var addfeed: SearchTextField!
    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var addbtn: UIButton!
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var plusbutton: UIButton!
    let defaults = UserDefaults(suiteName:"User")
    var checkStatus : Bool = false
    var currentTappedTextField : UITextField?
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    
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
            if addfeed.text == ""{
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
            var nameArray: [String] = []
            for i in 0...count - 1 {
                let name = productList[i].FeedName
                nameArray.append(name)
            }
            addfeed.filterStrings(nameArray)
        } catch {}
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        if(currentTappedTextField != addfeed){
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                if self.view.frame.origin.y == 0 {
                    self.view.frame.origin.y -= keyboardSize.height
                   
                }
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        currentTappedTextField = nil
//    }
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        addfeed.superview?.endEditing(true)
//        return false
//    }
//    func  textFieldDidBeginEditing(_ textField: UITextField) {
//        textField.text = ""
//        addfeed.dataArray = addfeed.optionArray
//        addfeed.touchAction()
//        currentTappedTextField = textField
//    }
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        return addfeed.isSearchEnable
//    }
//
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if string != "" {
//            addfeed.searchText = addfeed.text! + string
//        }else{
//            let subText = addfeed.text?.dropLast()
//            addfeed.searchText = String(subText!)
//        }
//        if !addfeed.isSelected {
//            addfeed.showList()
//        }
//        return true;
//    }

    override func viewDidLoad() {
        self.dismissKey()
        addfeed.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        super.viewDidLoad()
        //profileimage?.layer.cornerRadius = (profileimage?.frame.size.width ?? 0.0) / 2
        profileimage?.layer.cornerRadius = (profileimage?.frame.size.width ?? 0.0) / 2
        profileimage?.clipsToBounds = true
        profileimage?.layer.borderWidth = 3.0
        profileimage?.layer.borderColor = UIColor.white.cgColor
        addbtn.layer.cornerRadius = 8
        editBtn.layer.cornerRadius = 8
        plusbutton.layer.cornerRadius = 28
        addfeed.maxNumberOfResults = 5
          addfeed.theme.font = UIFont.systemFont(ofSize: 14)
        addfeed.theme.bgColor = UIColor (red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        addfeed.theme.borderColor = UIColor (red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        addfeed.theme.separatorColor = UIColor (red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        addfeed.theme.cellHeight = 40
        //addfeed.comparisonOptions = .anchored
        addfeed.minCharactersNumberToStartFiltering = 1
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getData()
//        addfeed.didSelect{(selectedText , index ,id) in
//            currentIndex = index
//        }
//        addfeed.selectedRowColor = UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1.0)
        
//        addfeed.itemSelectionHandler = { filteredResults, itemPosition in
//            let item = filteredResults[itemPosition]
//            self.addfeed.text = item.title
//        }
//        addfeed.minCharactersNumberToStartFiltering = 2
    
        for i in 0..<dropdownvalues.count {
            for item in productList {
                let name = item.FeedName
                if(dropdownvalues[i] == name) {
                    selectedProductList.append(item)
                }
            }
        }
        if(self.dropdownvalues.count < 3) {
            self.viewHeight.constant = 150
        } else {
            self.viewHeight.constant = CGFloat(self.dropdownvalues.count * 70)
        }

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
       // checkStatus = true
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
                        productDM = Double(dropdownfloatValue[i])! * Double(selectedProductList[i].DryMatter)!
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
                Requirments.shared().DMI = dmi
                Requirments.shared().finalProductList = selectedProductList
                Requirments.shared().finalDropdownfloatValue = dropdownfloatValue
                Requirments.shared().calculateRationData()
                Requirments.shared().calculateRequirmentsData()
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
        if (checkStatus == true){
            // Create Alert
            let dialogMessage = UIAlertController(title: "Ration Profile", message: "", preferredStyle: .alert)
            
            // Create OK button with action handler
            let new = UIAlertAction(title: "Save as New", style: .default, handler: { (action) -> Void in
               
                let currentDateTime = Date()
                let formatter = DateFormatter()
                formatter.timeStyle = .medium
                formatter.dateStyle = .long
                self.calculateFloatArray()
                if(self.dropdownvalues.count == self.dropdownfloatValue.count && self.dropdownvalues.count > 0 ) {
                    let datetimestamp = formatter.string(from: currentDateTime)
                    let db = Firestore.firestore()
                    let alertController = UIAlertController(title: "Ration Profile", message: "", preferredStyle: .alert)
                    let withdrawAction = UIAlertAction(title: "Save", style: .default) { (aciton) in
                         SVProgressHUD.show(withStatus: "it's working ...")
                        let text = alertController.textFields!.first!.text!
                        //                        let dict : [String : Any] = ["ProductNameArray" : self.dropdownvalues , "ProductValueArray" : self.dropdownfloatValue , "ReportName" : text ,"currenttimedate" : datetimestamp]
                        let newDocument =  db.collection("rationReports").document(self.userID!).collection("rationReports").document()
                        newDocument.setData(["ProductNameArray" : self.dropdownvalues , "ProductValueArray" : self.dropdownfloatValue , "ReportName" : text ,"currenttimedate" : datetimestamp,"DocId":newDocument.documentID]){ err in
                            if let err = err {
                                SVProgressHUD.showError(withStatus: "Error")
                                                       
                                                       print("Error adding document: \(err)")
                                                       SVProgressHUD.dismiss()
                                
                            } else {
                                SVProgressHUD.showSuccess(withStatus: "Success")
                                
                                print("Document added")
                                SVProgressHUD.dismiss()
                            }
                        }
                    }
                    
                    let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
                    }
                    alertController.addTextField { (textField) in
                        textField.placeholder = "Ration Profile"
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
                
            })
            // Create Cancel button with action handlder
            let previous = UIAlertAction(title: "Save as Previous", style: .default) { (action) -> Void in
                SVProgressHUD.show(withStatus: "it's working ...")
                let currentDateTime = Date()
                let formatter = DateFormatter()
                formatter.timeStyle = .medium
                formatter.dateStyle = .long
                self.calculateFloatArray()
                if(self.dropdownvalues.count == self.dropdownfloatValue.count && self.dropdownvalues.count > 0 ) {
                    let datetimestamp = formatter.string(from: currentDateTime)
                    let db = Firestore.firestore()
                    
                    let newDocument = db.collection("rationReports").document(self.userID!).collection("rationReports").document(self.documentID)
                    newDocument.setData(["ReportName" : self.ReportName, "ProductNameArray" : self.dropdownvalues , "ProductValueArray" : self.dropdownfloatValue  ,"currenttimedate" : datetimestamp ,"DocId":newDocument.documentID]){ err in
                        if let err = err {
                           SVProgressHUD.showError(withStatus: "Error")
                            
                            print("Error adding document: \(err)")
                            SVProgressHUD.dismiss()
                        } else {
                            SVProgressHUD.showSuccess(withStatus: "Success")
                                                           
                                                           print("Document added")
                                                           SVProgressHUD.dismiss()
                        }
                    }
                    
                }
                
            }
           let destructive = UIAlertAction(title: "Cancel", style: .destructive) { (action) -> Void in
            }
            //Add OK and Cancel button to an Alert object
            dialogMessage.addAction(new)
            dialogMessage.addAction(previous)
            dialogMessage.addAction(destructive)
                       
            
            
            // Present alert message to user
            self.present(dialogMessage, animated: true, completion: nil)
        }
        else {
            let currentDateTime = Date()
            let formatter = DateFormatter()
            formatter.timeStyle = .medium
            formatter.dateStyle = .long
            calculateFloatArray()
            if(dropdownvalues.count == dropdownfloatValue.count && dropdownvalues.count > 0 ) {
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
                    let datetimestamp = formatter.string(from: currentDateTime)
                    let db = Firestore.firestore()
                    let alertController = UIAlertController(title: "Ration Profile", message: "", preferredStyle: .alert)
                    let withdrawAction = UIAlertAction(title: "Save", style: .default) { (aciton) in
                        SVProgressHUD.show(withStatus: "it's working ...")
                        let text = alertController.textFields!.first!.text!
                        //                    let _ : [String : Any] = ["ProductNameArray" : self.dropdownvalues , "ProductValueArray" : self.dropdownfloatValue , "ReportName" : text ,"currenttimedate" : datetimestamp]
                        let newDocument = db.collection("rationReports").document(self.userID!).collection("rationReports").document()
                        newDocument.setData(["ProductNameArray" : self.dropdownvalues , "ProductValueArray" : self.dropdownfloatValue , "ReportName" : text ,"currenttimedate" : datetimestamp ,"DocId":newDocument.documentID]){ err in
                            if let err = err {
                                SVProgressHUD.showError(withStatus: "Error")
                                
                                print("Error adding document: \(err)")
                                SVProgressHUD.dismiss()
                            } else {
                                 SVProgressHUD.showSuccess(withStatus: "Success")
                                                               
                                                               print("Document added")
                                                               SVProgressHUD.dismiss()
                            }
                        }
                    }
                    let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { (action) in
                    }
                    alertController.addTextField { (textField) in
                        textField.placeholder = "Ration Profile"
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
            } else {
                let alertController = UIAlertController(title: "Error", message: "Fill all fields.", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
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
                    vc?.screenName = "Edit Feed"
                    self.navigationController?.pushViewController(vc!, animated: true)
                
                }
            }
        }
    }
    @IBAction func addFeedButton(_ sender: Any) {
        if addfeed.text == "" {
            let vc = storyboard?.instantiateViewController(withIdentifier: "EditPremixViewController") as?  EditPremixViewController
            vc?.screenName = "Add Feed"
            self.navigationController?.pushViewController(vc!, animated: true)
        } else {
            for item in productList {
                let name = item.FeedName
                if(addfeed.text == name) {
                    let vc = storyboard?.instantiateViewController(withIdentifier: "EditPremixViewController") as?  EditPremixViewController
                    vc?.screenName = "Add Feed"
                    vc?.screenType = "addNewFeed"
                    self.navigationController?.pushViewController(vc!, animated: true)
                
                }
            }
        }
        
    }
    @IBAction func touchaddbtn(_ sender: Any) {
        if addfeed.text == "" {
            self.showError("Select dropdown value")
        } else {
            if dropdownvalues.contains(addfeed.text!) {
                self.showError("Already added.")
            } else {
                var validProduct : Bool = false
                for item in productList {
                    let name = item.FeedName
                    if(addfeed.text == name) {
                        validProduct = true
                        break
                    }
                }
                if(validProduct == true) {
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
                    if(self.dropdownvalues.count > 2) {
                        self.viewHeight.constant = CGFloat(self.dropdownvalues.count * 70)
                    }
                    tblView.reloadData()
                } else {
                    self.showError("Invalid product name.")
                }
                
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
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
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


