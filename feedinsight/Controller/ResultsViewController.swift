//
//  ResultsViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 03/09/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import WebKit
class ResultsViewController: UIViewController, UIGestureRecognizerDelegate,UITextFieldDelegate {
    let defaults = UserDefaults(suiteName:"User")
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var samplepdfview: UITableView!
    @IBOutlet weak var searchfieldholder: UIView!
    
    @IBOutlet weak var tblviewholder: UIView!
   
    @IBOutlet weak var searchField: UITextField!
    var FeedStuff = ["Alfalfa (Fresh)","Alfalfa (Hay)","Alfalfa (Haylage)","Apple Pulp","Maize Silage (Baled)","Berseem (Fresh)","Beet Pulp (Fresh)","Cookies Waste","Canola Meal","Corn Gluten Feed","Potato Chips Waste","Citrus Pulp & Peels","Maize Bran","Maize Cobs","Maize Fodder (45 days)","Maize Gluten Meal","Maize Grit","Maize Oil Cake","Maize Silage (Bunker)","Maize Steep Liquor","Maize Grain","DDGS Wheat","Grass Dried","Hay (Mixed Grasses)","Feather Meal","Fennel Seed Meal","Fish Meal","Maize Fresh ( 65 Days)","Rye Grass (Fresh)","Black Grams Husk","Guar Meal","Canola Cake","Coconout Cake","Cow Manure","Black Lentils (Waste)","Red Lentils Husk (Masoor)","Red Lentils (Waste)","Molasses Cane","Green Lentils (Waste)","Moringa Leaves","Noodles Waste","Palm Kernal Meal","Potatoes Dried","Rapeseed Meal","Rhodes Grass Hay","Rice Bran","Rice Husk","Rice Broken","Rice Polish","Rice Protien","Calcium Soap of Palm Fatty A","Rye Grass","Soybean Meal","Sorghum Fresh","Soy Hulls","Soy Pellets","Soybeans Full Fat","Wheat Bran","Wheat Grains","Wheat Hulls","Wheat Straw","Yeast"]
    let Mositure = ["3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00","3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00","3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00","20.00"]
    var CP = ["3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00","3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00","3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00"]
    let Fat = ["3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00","3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00","3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00"]
    var Ash = ["3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00","3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00","3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00"]
    let CF = ["3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00","3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00","3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00"]
    var ADF = ["3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00","3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00","3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00"]
    let NDF = ["3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00","3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00","3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00"]
    var Starch = ["3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00","3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00","3.00","4.00","5.00","6.00","7.00","8.00","9.00","10.00","11.00","12.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00","13.00","14.00","15.00","16.00","17.00","18.00","19.00","19.00"]
  
    var nameArrayCopy: [String] = []
    
    var pdfType : String = ""
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        profileImage?.layer.cornerRadius = (profileImage?.frame.size.width ?? 0.0) / 2
        profileImage?.clipsToBounds = true
        profileImage?.layer.borderWidth = 3.0
        profileImage?.layer.borderColor = UIColor.white.cgColor
        nameArrayCopy = FeedStuff
        searchField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        if let userName = defaults!.value(forKey: "usernameStringKey"){
            self.userNameLabel.text = userName as? String
            print(userName)
        }
        DispatchQueue.main.async { [weak self] in
            let data = self?.defaults!.value(forKey: "imageData") as? Data
            if(data != nil) {
                self?.profileImage.image = UIImage(data: data!)
            }
        }
        if(pdfType == "pdf1") {
            if let pdf = Bundle.main.url(forResource: "pdf1", withExtension: "pdf", subdirectory: nil, localization: nil)  {
                let req = NSURLRequest(url: pdf)
                webView.load(req as URLRequest)
                samplepdfview.alpha = 0
                searchField.alpha = 0
            }
        } else if(pdfType == "pdf2") {
            webView.isHidden =  true
        }
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        if(textField.text == "") {
            nameArrayCopy = FeedStuff
            samplepdfview.reloadData()
        } else {
            filterContentForSearchText(searchText: textField.text!)
            samplepdfview.reloadData()
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchField.superview?.endEditing(true)
        return false
    }
    func  textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
        nameArrayCopy = FeedStuff
        samplepdfview.reloadData()
    }
    
    func filterContentForSearchText(searchText: String) {
        nameArrayCopy = FeedStuff.filter { item in
            return item.lowercased().contains(searchText.lowercased())
        }
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    
}
extension ResultsViewController: UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 32
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.nameArrayCopy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "pdfsamplecell") as? SamplePdfTableViewCell;
        if (indexPath.row == 0) {
            cell?.layer.cornerRadius = 10
            cell?.backgroundColor = UIColor(red: 81/255, green: 23/255.0, blue: 79/255.0, alpha: 1.0)
            cell?.feedName.textColor = UIColor.white
            cell?.moisture.textColor = UIColor.white
            cell?.CP.textColor = UIColor.white
            cell?.Fat.textColor = UIColor.white
            cell?.Ash.textColor = UIColor.white
            cell?.CF.textColor = UIColor.white
            cell?.ADF.textColor = UIColor.white
            cell?.NDF.textColor = UIColor.white
            cell?.Search.textColor = UIColor.white
            
            cell?.feedName.text = "Feed Stuff"
            cell?.moisture.text = "Moisture%"
            cell?.CP.text = "CP%"
            cell?.Fat.text = "Fat%"
            cell?.Ash.text = "Ash%"
            cell?.CF.text = "CF%"
            cell?.ADF.text = "ADF%"
            cell?.NDF.text = "NDF%"
            cell?.Search.text = "Starch%"
        } else {
            cell?.feedName.text = nameArrayCopy[indexPath.row]
            cell?.moisture.text = Mositure[indexPath.row]
            cell?.CP.text = CP[indexPath.row]
            cell?.Fat.text = Fat[indexPath.row]
            cell?.Ash.text = Ash[indexPath.row]
            cell?.CF.text = CF[indexPath.row]
            cell?.ADF.text = ADF[indexPath.row]
            cell?.NDF.text = NDF[indexPath.row]
            cell?.Search.text = Starch[indexPath.row]
            cell?.layer.cornerRadius = 10
            cell?.backgroundColor = UIColor.white
            cell?.feedName.textColor = UIColor.black
            cell?.moisture.textColor = UIColor.black
            cell?.CP.textColor = UIColor.black
            cell?.Fat.textColor = UIColor.black
            cell?.Ash.textColor = UIColor.black
            cell?.CF.textColor = UIColor.black
            cell?.ADF.textColor = UIColor.black
            cell?.NDF.textColor = UIColor.black
            cell?.Search.textColor = UIColor.black
        }
        
        
        
        return cell!
    
}
}
