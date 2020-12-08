//
//  DatabaseViewController.swift
//  FeedInsight
//
//  Created by Hamza Iqbal on 12/10/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import SwiftMessages
class DatabaseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    

    @IBOutlet weak var databaseTableView: UITableView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    var nameArray: [String] = []
    var nameArrayCopy: [String] = []
    var productListOne: [Person] = []
    let defaults = UserDefaults(suiteName:"User")
    
    func getData(fileInput : String) {
        do {
            let documentDirectory = try fm.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            subUrl = documentDirectory.appendingPathComponent(fileInput)
            if(fileInput == "Athletes.json") {
                loadFile(mainPath: mainUrl!, subPath: subUrl!)
            } else {
                loadFile(mainPath: mainUrl1!, subPath: subUrl!)
            }
            subUrl = documentDirectory.appendingPathComponent("Athletes.json")
        } catch {
            print(error)
        }
    }
    
    func loadFile(mainPath: URL, subPath: URL){
        if fm.fileExists(atPath: subPath.path){
            decodeData(pathName: subPath)
            if nameArray.count == 0{
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
            productList.removeAll()
            productList = try decoder.decode([Person].self, from: jsonData)
            let count = productList.count
            nameArray.removeAll()
            if(count != 0) {
                for i in 0...count - 1 {
                    let name = productList[i].FeedName
                    nameArray.append(name)
                }
            }
        } catch {}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
//        let popGestureRecognizer = self.navigationController!.interactivePopGestureRecognizer!
//        if let targets = popGestureRecognizer.value(forKey: "targets") as? NSMutableArray {
//          let gestureRecognizer = UIPanGestureRecognizer()
//          gestureRecognizer.setValue(targets, forKey: "targets")
//          self.view.addGestureRecognizer(gestureRecognizer)
//        }
        searchTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        userImage?.layer.cornerRadius = (userImage?.frame.size.width ?? 0.0) / 2
        userImage?.clipsToBounds = true
        userImage?.layer.borderWidth = 3.0
        userImage?.layer.borderColor = UIColor.white.cgColor
        let tapOnImage = UITapGestureRecognizer.init(target: self, action: #selector(tapOnImageAction))
        self.userImage.addGestureRecognizer(tapOnImage)
        self.userImage.isUserInteractionEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData(fileInput: "Athletes.json")
        nameArray = nameArray.sorted(by: <)
        nameArrayCopy = nameArray
        databaseTableView.reloadData()
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
    
    @IBAction func restoreDatabase(_ sender: Any) {
        getData(fileInput: "Athletes1.json")
        nameArray = nameArray.sorted(by: <)
        nameArrayCopy = nameArray
        databaseTableView.reloadData()
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(.success)
        view.configureDropShadow()
        view.configureContent(title: "Default Database", body: "you have successfully restored your database.")
        SwiftMessages.show(view: view)
        writeToFile(location: subUrl!)
    }
    
    func writeToFile(location: URL) {
        do{
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let JsonData = try encoder.encode(productList)
            try JsonData.write(to: location)
        }catch{}
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
        if dropdownvalues.contains(where: { ($0) == cell.productName?.text }) {
            cell.checkImage.image = UIImage(named: "animalcheck")
        } else {
            cell.checkImage.image = UIImage(named: "animaluncheck")
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
        
        if dropdownvalues.contains(cell.productName.text!) {
            cell.checkImage.image = UIImage(named: "animaluncheck")
            if(dropdownvalues.count != 0) {
                for i in 0 ..< dropdownvalues.count {
                    if(dropdownvalues[i] == cell.productName.text) {
                        dropdownvalues.remove(at: i)
                        dropdownfloatValue.remove(at: i)
                        break
                    }
                }
            }
        } else {
            cell.checkImage.image = UIImage(named: "animalcheck")
            dropdownvalues.append(cell.productName.text ?? "none")
            dropdownfloatValue.append("none")
            for item in productList {
                let name = item.FeedName
                if(cell.productName.text == name) {
                    selectedProductList.append(item)
                    break
                }
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
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let cell = tableView.cellForRow(at: indexPath) as! loadDatabaseTableViewCell
            let complete = UITableViewRowAction(style: .default, title: "Edit") { (action, indexPath) in
                if cell.productName.text == "" {
                    self.showError("Select Feed value")
                } else {
                    let count = productList.count
                    for i in 0...count - 1 {
                        let name = productList[i].FeedName
                        if(cell.productName.text == name) {
                            currentIndex = i
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "EditPremixViewController") as?  EditPremixViewController
                            vc?.screenName = "Edit Feed"
                            self.navigationController?.pushViewController(vc!, animated: true)
                        
                        }
                    }
                }
            }
            complete.backgroundColor = UIColor(red: 81/255, green: 23/255.0, blue: 79/255.0, alpha: 1.0)

            return [complete]
        }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    @IBAction func doneBtnTapped(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
}
