//
//  DatabaseViewController.swift
//  FeedInsight
//
//  Created by Hamza Iqbal on 12/10/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class DatabaseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    

    @IBOutlet weak var databaseTableView: UITableView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    var nameArray: [String] = []
    var nameArrayCopy: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        let count = productList.count
        for i in 0...count - 1 {
            let name = productList[i].FeedName
            self.nameArray.append(name)
        }
        nameArrayCopy = nameArray
        searchTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        filterContentForSearchText(searchText: textField.text!)
        databaseTableView.reloadData()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.superview?.endEditing(true)
        return false
    }
    func  textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
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
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
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
//        if cell.checkImage.image!.isEqual(UIImage(named: "animaluncheck")) {
//
//        } else {
//
//        }
        
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
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
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
