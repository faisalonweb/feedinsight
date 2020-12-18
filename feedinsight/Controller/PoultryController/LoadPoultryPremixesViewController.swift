//
//  LoadPoultryPremixesViewController.swift
//  FeedInsight
//
//  Created by Hamza Iqbal on 18/12/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class LoadPoultryPremixesViewController: UIViewController, UIGestureRecognizerDelegate, UITableViewDataSource , UITableViewDelegate {

    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var hiddenView: UIView!
    let defaults = UserDefaults(suiteName:"User")
    @IBOutlet weak var changeableLabel: UILabel!
    let totalVitAllArray = ["Totalvit Vitall Broiler", "Totalvit Vitall Layer", "Totalvit Vitall Breeder", "Totalvit Minerall Broiler", "Totalvit Minerall Layer", "Totalvit Minerall Breeder"]
    override func viewDidLoad() {
        super.viewDidLoad()
        profileimage?.layer.cornerRadius = (profileimage?.frame.size.width ?? 0.0) / 2
        profileimage?.clipsToBounds = true
        profileimage?.layer.borderWidth = 3.0
        profileimage?.layer.borderColor = UIColor.white.cgColor
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        if let userName = defaults!.value(forKey: "usernameStringKey"){
            self.userNameLabel.text = userName as? String
            print(userName)
        }
        let tapOnImage = UITapGestureRecognizer.init(target: self, action: #selector(tapOnImageAction))
        self.profileimage.addGestureRecognizer(tapOnImage)
        self.profileimage.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
    }
    
    @objc func tapOnImageAction() {
        self.tabBarController?.selectedIndex = 2
    }
    @IBAction func backBtn(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return totalVitAllArray.count
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! waterrationTableViewCell
        cell.backgroundColor = UIColor(red: 154/255, green: 9/255.0, blue: 87/255.0, alpha: 1.0)
        cell.label.textColor = UIColor.white
        cell.label?.text = totalVitAllArray[indexPath.section]
        cell.layer.cornerRadius = 10
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Requirments.shared().poultryType = totalVitAllArray[indexPath.section]
        Requirments.shared().poultryStrain = ".........."
        Requirments.shared().poultryPsychlogyState = ".........."
        Requirments.shared().poultryCompanyName = defaults!.value(forKey: "userbussinessStringKey") as? String
        Requirments.shared().poultryVitaminA = "100"
        Requirments.shared().poultryVitaminD3 = "100"
        Requirments.shared().poultryVitaminE = "100"
        Requirments.shared().poultryVitaminK = "100"
        Requirments.shared().poultryVitaminB1 = "100"
        Requirments.shared().poultryVitaminB2 = "100"
        Requirments.shared().poultryVitaminB3 = "100"
        Requirments.shared().poultryVitaminB5 = "100"
        Requirments.shared().poultryVitaminB6 = "100"
        Requirments.shared().poultryVitaminB7 = "100"
        Requirments.shared().poultryVitaminB9 = "100"
        Requirments.shared().poultryVitaminB12 = "100"
        Requirments.shared().poultryZInc = "100"
        Requirments.shared().poultryManganese = "100"
        Requirments.shared().poultryCopper = "100"
        Requirments.shared().poultryIodine = "100"
        Requirments.shared().poultrySelenium = "100"
        Requirments.shared().poultryCobalt = "100"
        Requirments.shared().poultryIron = "100"
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PoultryPDFViewController") as? PoultryPDFViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }

}
