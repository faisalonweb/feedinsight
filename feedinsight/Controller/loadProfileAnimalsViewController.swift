//
//  loadProfileAnimalsViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 07/07/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseAuth
import FirebaseFirestore
import SwiftMessages

class loadProfileAnimalsViewController: UIViewController , UIGestureRecognizerDelegate{
    
    @IBOutlet weak var mainBtn: UIButton!
    var db = Firestore.firestore()
   // @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var requirmentscreen: UIView!
    
    @IBOutlet weak var emptyscreen: UIView!
    
    let defaults = UserDefaults(suiteName:"User")
    let userID = Auth.auth().currentUser?.uid
    var DocumentIdList = [String]()
    var animalList = [String]()
    var reportNameList = [String]()
    var docIdList = [String]()
    var dateList = [String]()
    var companynameList = [String]()
    var categoryList = [String]()
    var currentweightList = [String]()
    var targetweightList = [String]()
    var dayspregnantList = [String]()
    var daysmilkList = [String]()
    var daysachieveList = [String]()
    var milkproductionList = [String]()
    var psystateList = [String]()
    var dietstate = [Bool]()
    var disorderstate = [Bool]()
    var heatstate = [Bool]()
    var productionstate = [Bool]()
    private var documentIdStation = [String]()
    private var datastation = [String]()
    private var dataonestation = [String]()
    private var datathreestation = [String]()
    private var datafourstation = [String]()
    private var datafivestation = [String]()
    private var datasixstation = [String]()
    private var datasevenstation = [String]()
    private var dataeightstation = [String]()
    private var dataninestation = [String]()
    private var datatenstation = [String]()
    private var dataelevenstation = [String]()
    private var datatwelvestation = [Bool]()
    private var datathirteenstation = [Bool]()
    private var datafourteenstation = [Bool]()
    private var datafifteenstation = [Bool]()
    private var datasixteenstation = [String]()
    private var docIdStation = [String]()
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        let tapOnImage = UITapGestureRecognizer.init(target: self, action: #selector(tapOnImageAction))
        self.profileimage.addGestureRecognizer(tapOnImage)
        self.profileimage.isUserInteractionEnabled = true
        profileimage?.layer.cornerRadius = (profileimage?.frame.size.width ?? 0.0) / 2
        profileimage?.clipsToBounds = true
        profileimage?.layer.borderWidth = 3.0
        profileimage?.layer.borderColor = UIColor.white.cgColor
        super.viewDidLoad()
        
        let script =  ApiCalling()
        script.LoadProfile() { (result) -> ()  in
            if result.count > 0 {
                self.requirmentscreen.alpha = 0
                self.emptyscreen.alpha = 1
            } else {
                self.requirmentscreen.alpha = 1
                self.emptyscreen.alpha = 0
            }
        }
    }
    @objc func tapOnImageAction() {
        self.tabBarController?.selectedIndex = 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let userName = defaults!.value(forKey: "usernameStringKey"){
            self.userNameLabel.text = userName as? String
            print(userName)
        }
        DispatchQueue.global().async {
            DispatchQueue.main.async {
            let data = self.defaults!.value(forKey: "imageData") as? Data
                if(data != nil) {
                    self.profileimage.image = UIImage(data: data!)
                }
            }
        }
    }
    
    @IBAction func backBtn(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
  
}

