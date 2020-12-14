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
    let Mositure = ["65.22",
                    "7.77",
                    "33.62",
                    "77.24",
                    "70.49",
                    "70.93",
                    "81.01",
                    "8.03",
                    "9.2",
                    "7.55",
                    "3.36",
                    "88.08",
                    "12.56",
                    "8.32",
                    "82.42",
                    "9.04",
                    "12.28",
                    "5.55",
                    "69.1",
                    "42.87",
                    "12.89",
                    "11.6",
                    "8.92",
                    "15.1",
                    "7.79",
                    "9.04",
                    "10.79",
                    "70.17",
                    "47.99",
                    "10.19",
                    "6.46",
                    "4.84",
                    "7.9",
                    "50.35",
                    "8.86",
                    "9.41",
                    "9.61",
                    "29.1",
                    "11.89",
                    "7.1",
                    "12.98",
                    "6.86",
                    "11.68",
                    "8.4",
                    "10.43",
                    "9",
                    "5.27",
                    "8.71",
                    "6.9",
                    "6.58",
                    "1",
                    "74.13",
                    "9.65",
                    "83.29",
                    "10.44",
                    "11.23",
                    "10.35",
                    "12.38",
                    "9.44",
                    "17.77",
                    "10.82",
                    "7.81"]
    var CP = ["13.87",
              "14.03",
              "14.54",
              "7",
              "8.45",
              "22.43",
              "9.16",
              "6.12",
              "35.6",
              "26.3",
              "5.91",
              "10.92",
              "13.98",
              "12.16",
              "9.33",
              "58.9",
              "9.78",
              "15.69",
              "8.18",
              "43.94",
              "7.96",
              "25.3",
              "10.26",
              "6.64",
              "55.72",
              "35.01",
              "52.94",
              "7.79",
              "12.36",
              "10.46",
              "32.06",
              "37.45",
              "14.81",
              "8.29",
              "21.83",
              "15.27",
              "23.21",
              "12.64",
              "22.09",
              "27.14",
              "9.86",
              "17.21",
              "6.4",
              "37.95",
              "9.17",
              "16.56",
              "4.935",
              "11.03",
              "13.56",
              "59.75",
              "0",
              "13.31",
              "45.17",
              "12.64",
              "10.42",
              "19.1",
              "34.76",
              "14.48",
              "12.34",
              "4.51",
              "3.56",
              "42.49"]
    let Fat = [ "2.07",
                "1.33",
                "2.16",
                "4.26",
                "2.91",
                "2.98",
                "1.01",
                "7.08",
                "1.65",
                "2.45",
                "25.83",
                "4.55",
                "7.91",
                "1.3",
                "1.73",
                "2.73",
                "1.36",
                "13.76",
                "2.54",
                "0.44",
                "3.75",
                "5.88",
                "0.99",
                "1.5",
                "2.8",
                "5.1",
                "13.3",
                "2.16",
                "2.56",
                "6.18",
                "4.19",
                "9.46",
                "32.66",
                "1.23",
                "1.36",
                "0.91",
                "2.31",
                "3.77",
                "1.76",
                "8.46",
                "20.75",
                "6.01",
                "18.62",
                "2.16",
                "1.57",
                "8.31",
                "2.61",
                "0.89",
                "6.36",
                "6.83",
                "84.2",
                "4.07",
                "1.85",
                "2.43",
                "1.32",
                "5.08",
                "20.12",
                "2.77",
                "1.4",
                "0.72",
                "1.06",
                "1.24"]
    var Ash = ["13.73",
               "9.96",
               "16.66",
               "2.83",
               "5.88",
               "12.83",
               "3.43",
               "2.68",
               "6.56",
               "7.55",
               "7.39",
               "5.195",
               "2.07",
               "5.85",
               "13.32",
               "2.24",
               "0.28",
               "0.93",
               "5.7",
               "16",
               "1.31",
               "6.23",
               "9.18",
               "11.26",
               "12.13",
               "14.25",
               "20.4",
               "5.49",
               "12.05",
               "2.66",
               "7.96",
               "7.43",
               "9.2",
               "16.14",
               "4.18",
               "3.09",
               "3.31",
               "15.69",
               "8.16",
               "9.07",
               "4.73",
               "4.73",
               "2.57",
               "7.81",
               "9.21",
               "12.31",
               "15.07",
               "0.96",
               "10.71",
               "3.02",
               "15.58",
               "18.85",
               "6.03",
               "12.52",
               "5.02",
               "8.88",
               "4.54",
               "5.37",
               "2",
               "11.88",
               "6.84",
               "0"]
    let CF = ["33.38",
              "31.35",
              "28.89",
              "26.67",
              "17.3",
              "30.44",
              "19.51",
              "6.1",
              "12.57",
              "7.6",
              "5.38",
              "16.25",
              "9.2",
              "15.11",
              "30.96",
              "0",
              "1.93",
              "12.62",
              "23.42",
              "0.19",
              "2.71",
              "6.44",
              "35.53",
              "36.86",
              "1.47",
              "17.96",
              "3.97",
              "20.48",
              "32.77",
              "11.84",
              "15.69",
              "8.34",
              "11.95",
              "25.94",
              "25.85",
              "29.91",
              "17.53",
              "2.09",
              "17.34",
              "5.43",
              "1.01",
              "22.81",
              "3.83",
              "8.22",
              "33.52",
              "10.89",
              "36.25",
              "0.58",
              "13.17",
              "2.21",
              "0",
              "31.81",
              "4.82",
              "31.41",
              "36.65",
              "10.28",
              "4.88",
              "13.8",
              "3.87",
              "38.64",
              "48.17",
              "0"]
    var ADF = ["40.2",
               "36.75",
               "34.19",
               "35.22",
               "24.86",
               "37.24",
               "24.66",
               "1.51",
               "24.84",
               "7.75",
               "10.93",
               "19.6",
               "10.32",
               "14.39",
               "37.33",
               "0",
               "3.46",
               "14.48",
               "26.88",
               "0",
               "2.65",
               "11.13",
               "41.48",
               "39.25",
               "0",
               "25.71",
               "0",
               "24.16",
               "36.55",
               "13.24",
               "18.66",
               "14.28",
               "43.11",
               "31.4",
               "25.34",
               "33.53",
               "23.04",
               "2.95",
               "22.26",
               "5.46",
               "0.411",
               "36.01",
               "1.42",
               "0",
               "35.98",
               "18.26",
               "41.14",
               "3.14",
               "26.47",
               "7",
               "0",
               "38.05",
               "4.44",
               "37.58",
               "45.73",
               "16.38",
               "0",
               "10.32",
               "4.03",
               "37.58",
               "53.28",
               "0"]
    let NDF = ["47.31",
               "47.07",
               "43.63",
               "49.05",
               "47.22",
               "50.65",
               "43.89",
               "10.61",
               "47.85",
               "30.49",
               "18.47",
               "25.32",
               "34.93",
               "32.68",
               "61.56",
               "0",
               "12.9",
               "31.15",
               "45.7",
               "0",
               "17.36",
               "28.91",
               "72.6",
               "57.93",
               "0",
               "34.57",
               "0",
               "43.83",
               "62.64",
               "16.87",
               "28.03",
               "20.39",
               "65.4",
               "48.89",
               "31.95",
               "54.83",
               "26.59",
               "6.51",
               "28.16",
               "7.61",
               "5.34",
               "60.99",
               "8.35",
               "0",
               "61.79",
               "42.44",
               "53",
               "9.85",
               "39.13",
               "34.86",
               "0",
               "56.76",
               "8.19",
               "58.82",
               "64.65",
               "31.06",
               "0",
               "24.62",
               "18.73",
               "71.22",
               "68.64",
               "0"]
    var Starch = ["0",
                  "0",
                  "0",
                  "13.9",
                  "28.86",
                  "8.15",
                  "0",
                  "54.22",
                  "0",
                  "24.34",
                  "60.57",
                  "0",
                  "43.96",
                  "27.9",
                  "9.75",
                  "0",
                  "72.91",
                  "30.84",
                  "27.2",
                  "0",
                  "63.08",
                  "5.15",
                  "0",
                  "0",
                  "0",
                  "3.97",
                  "13.19",
                  "39.69",
                  "13.47",
                  "54.61",
                  "0",
                  "0",
                  "0",
                  "11.83",
                  "18.38",
                  "23.45",
                  "22.65",
                  "8.13",
                  "24.45",
                  "0",
                  "48.95",
                  "17.93",
                  "48.67",
                  "0",
                  "14.82",
                  "0",
                  "0",
                  "60.16",
                  "0",
                  "8.89",
                  "0",
                  "9.16",
                  "0",
                  "0",
                  "12.64",
                  "24.97",
                  "0",
                  "8.37",
                  "55.84",
                  "16.96",
                  "0",
                  "0"]
  
    var nameArrayCopy: [[String]] = []
    @IBOutlet weak var headerLbl: UILabel!
    
    var combinedArray: [[String]] = []
    
    var pdfType : String = ""
    
    fileprivate func transpose<T>(input: [[T]]) -> [[T]] {
        if input.isEmpty { return [[T]]() }
        let count = input[0].count
        var out = [[T]](repeating: [T](), count: count)
        for outer in input {
            for (index, inner) in outer.enumerated() {
                out[index].append(inner)
            }
        }
        return out

    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        if(pdfType == "pdf1") {
            if let pdf = Bundle.main.url(forResource: "pdf1", withExtension: "pdf", subdirectory: nil, localization: nil)  {
                let req = NSURLRequest(url: pdf)
                webView.load(req as URLRequest)
                samplepdfview.alpha = 0
                searchField.alpha = 0
                headerLbl.text = "Products"
            }
        } else if(pdfType == "pdf3") {
            if let pdf = Bundle.main.url(forResource: "terms", withExtension: "pdf", subdirectory: nil, localization: nil)  {
                let req = NSURLRequest(url: pdf)
                webView.load(req as URLRequest)
                samplepdfview.alpha = 0
                searchField.alpha = 0
                headerLbl.text = "Terms of Use"
            }
        } else if(pdfType == "pdf2") {
            webView.isHidden =  true
            headerLbl.text = "Products"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        let popGestureRecognizer = self.navigationController!.interactivePopGestureRecognizer!
        if let targets = popGestureRecognizer.value(forKey: "targets") as? NSMutableArray {
          let gestureRecognizer = UIPanGestureRecognizer()
          gestureRecognizer.setValue(targets, forKey: "targets")
          self.view.addGestureRecognizer(gestureRecognizer)
        }
        profileImage?.layer.cornerRadius = (profileImage?.frame.size.width ?? 0.0) / 2
        profileImage?.clipsToBounds = true
        profileImage?.layer.borderWidth = 3.0
        profileImage?.layer.borderColor = UIColor.white.cgColor
        combinedArray = transpose(input: [FeedStuff, Mositure, CP, Fat, Ash, CF, ADF, NDF, Starch])
        nameArrayCopy = combinedArray
        searchField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        if let userName = defaults!.value(forKey: "usernameStringKey"){
            self.userNameLabel.text = userName as? String
            print(userName)
        }
        DispatchQueue.global().async {
            DispatchQueue.main.async {
            let data = self.defaults!.value(forKey: "imageData") as? Data
            if(data != nil) {
                self.profileImage.image = UIImage(data: data!)
            }
            }
        }
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        if(textField.text == "") {
            nameArrayCopy = combinedArray
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
        nameArrayCopy = combinedArray
        samplepdfview.reloadData()
    }
    
    func filterContentForSearchText(searchText: String) {
        nameArrayCopy = combinedArray.filter { item in
            return item[0].lowercased().contains(searchText.lowercased())
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
        return self.nameArrayCopy.count + 1
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
            cell?.feedName.text = nameArrayCopy[indexPath.row - 1][0]
            cell?.moisture.text = nameArrayCopy[indexPath.row - 1][1]
            cell?.CP.text = nameArrayCopy[indexPath.row - 1][2]
            cell?.Fat.text = nameArrayCopy[indexPath.row - 1][3]
            cell?.Ash.text = nameArrayCopy[indexPath.row - 1][4]
            cell?.CF.text = nameArrayCopy[indexPath.row - 1][5]
            cell?.ADF.text = nameArrayCopy[indexPath.row - 1][6]
            cell?.NDF.text = nameArrayCopy[indexPath.row - 1][7]
            cell?.Search.text = nameArrayCopy[indexPath.row - 1][8]
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
