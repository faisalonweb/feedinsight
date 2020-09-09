//
//  EditPremixViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 28/08/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class EditPremixViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var ProfileImage: UIImageView!
    @IBOutlet weak var EditLabel: UILabel!
    @IBOutlet weak var FeedName: UITextField!
    @IBOutlet weak var FeedType: UITextField!
    @IBOutlet weak var dryMatter: UITextField!
    @IBOutlet weak var caTextField: UITextField!
    @IBOutlet weak var caAbsTextField: UITextField!
    @IBOutlet weak var pTextField: UITextField!
    @IBOutlet weak var pAbsTextField: UITextField!
    @IBOutlet weak var mgTextField: UITextField!
    @IBOutlet weak var mgAbsTextField: UITextField!
    @IBOutlet weak var kTextField: UITextField!
    @IBOutlet weak var sTextField: UITextField!
    @IBOutlet weak var naTextField: UITextField!
    @IBOutlet weak var clTextField: UITextField!
    @IBOutlet weak var feTextField: UITextField!
    @IBOutlet weak var znTextField: UITextField!
    @IBOutlet weak var cuTextField: UITextField!
    @IBOutlet weak var mnTextField: UITextField!
    @IBOutlet weak var seTextField: UITextField!
    @IBOutlet weak var coTextField: UITextField!
    @IBOutlet weak var iTextField: UITextField!
    @IBOutlet weak var vitaminATextField: UITextField!
    @IBOutlet weak var vitaminD3TextField: UITextField!
    @IBOutlet weak var vitaminETextField: UITextField!
    @IBOutlet weak var NiacinTextField: UITextField!
    @IBOutlet weak var biotinTextField: UITextField!
    @IBOutlet weak var referTextField: UITextField!
    let defaults = UserDefaults.standard
    var screenName : String = ""
    var addedDataList : [Person] = []
    var itemDictionary : [String : Any] = [:]
    var saveName : String = ""
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async { [weak self] in
            let data = self?.defaults.value(forKey: "imageData") as? Data
            if(data != nil) {
                self?.ProfileImage.image = UIImage(data: data!)
            }
        }
        if let userName = defaults.value(forKey: "usernameStringKey"){
            self.userNameLabel.text = userName as? String
            print(userName)
        }
        super.viewWillAppear(animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProfileImage?.layer.cornerRadius = (ProfileImage?.frame.size.width ?? 0.0) / 2
        EditLabel.text! =  screenName
        if(screenName == "Edit Feed") {
            self.FeedName.text! = productList[currentIndex].FeedName
            saveName = productList[currentIndex].FeedName
            self.FeedType.text! = productList[currentIndex].Type1
            self.dryMatter.text! = String(format: "%f", productList[currentIndex].DryMatter)
            self.caTextField.text! = String(format: "%f", productList[currentIndex].Ca)
            self.caAbsTextField.text! = String(format: "%f", productList[currentIndex].CaAbs)
            self.pTextField.text! = String(format: "%f", productList[currentIndex].P)
            self.pAbsTextField.text! = String(format: "%f", productList[currentIndex].PAbs)
            self.mgTextField.text! = String(format: "%f", productList[currentIndex].Mg)
            self.mgAbsTextField.text! = String(format: "%f", productList[currentIndex].MgAbs)
            self.kTextField.text! = String(format: "%f", productList[currentIndex].K)
            self.sTextField.text! = String(format: "%f", productList[currentIndex].S)
            self.naTextField.text! = String(format: "%f", productList[currentIndex].Na)
            self.clTextField.text! = String(format: "%f", productList[currentIndex].Cl)
            self.feTextField.text! = String(format: "%f", productList[currentIndex].Fe)
            self.znTextField.text! = String(format: "%f", productList[currentIndex].Zn)
            self.cuTextField.text! = String(format: "%f", productList[currentIndex].Cu)
            self.mnTextField.text! = String(format: "%f", productList[currentIndex].Mn)
            self.seTextField.text! = String(format: "%f", productList[currentIndex].Se)
            self.coTextField.text! = productList[currentIndex].Co
            self.iTextField.text! = productList[currentIndex].I
            self.vitaminATextField.text! = productList[currentIndex].VitaminA
            self.vitaminETextField.text! = productList[currentIndex].VitaminE
            self.vitaminD3TextField.text! = productList[currentIndex].VitaminD3
            self.NiacinTextField.text! = productList[currentIndex].Niacin
            self.biotinTextField.text! = productList[currentIndex].Biotin
            self.referTextField.text! = productList[currentIndex].Reference
        }
        else {
            
        }
    }
    
    func changeValues() {
        if(screenName == "Edit Feed") {
            productList[currentIndex].FeedName = FeedName.text!
            productList[currentIndex].Type1 = FeedType.text!
            let DryMatter = Double(self.dryMatter.text!)
            productList[currentIndex].DryMatter = DryMatter ?? 0.0
            let ca = Double(self.caTextField.text!)
            productList[currentIndex].Ca = ca ?? 0.0
            let caAbs = Double(self.caTextField.text!)
            productList[currentIndex].CaAbs = caAbs ?? 0.0
            let p = Double(self.pTextField.text!)
            productList[currentIndex].P = p ?? 0.0
            let pAbs = Double(self.pAbsTextField.text!)
            productList[currentIndex].PAbs = pAbs ?? 0.0
            let mg = Double(self.mgTextField.text!)
            productList[currentIndex].Mg = mg ?? 0.0
            let mgAbs = Double(self.mgAbsTextField.text!)
            productList[currentIndex].MgAbs = mgAbs ?? 0.0
            let k = Double(self.kTextField.text!)
            productList[currentIndex].K = k ?? 0.0
            let s = Double(self.sTextField.text!)
            productList[currentIndex].S = s ?? 0.0
            let na = Double(self.naTextField.text!)
            productList[currentIndex].Na = na ?? 0.0
            let cl = Double(self.clTextField.text!)
            productList[currentIndex].Cl = cl ?? 0.0
            let fe = Double(self.feTextField.text!)
            productList[currentIndex].Fe = fe ?? 0.0
            let zn = Double(self.znTextField.text!)
            productList[currentIndex].Zn = zn ?? 0.0
            let cu = Double(self.cuTextField.text!)
            productList[currentIndex].Cu = cu ?? 0.0
            let mn = Double(self.mnTextField.text!)
            productList[currentIndex].Mn = mn ?? 0.0
            let se = Double(self.seTextField.text!)
            productList[currentIndex].Se = se ?? 0.0
            productList[currentIndex].Co = self.coTextField.text!
            productList[currentIndex].I = self.iTextField.text!
            productList[currentIndex].VitaminA = self.vitaminATextField.text!
            productList[currentIndex].VitaminE = self.vitaminETextField.text!
            productList[currentIndex].VitaminD3 = self.vitaminD3TextField.text!
            productList[currentIndex].Niacin = self.NiacinTextField.text!
            productList[currentIndex].Biotin = self.biotinTextField.text!
            productList[currentIndex].Reference = self.referTextField.text!
        } else {
            addedDataList.append(productList[0])
            addedDataList[0].FeedName = FeedName.text!
            addedDataList[0].Type1 = FeedType.text!
            let DryMatter = Double(self.dryMatter.text!)
            addedDataList[0].DryMatter = DryMatter ?? 0.0
            let ca = Double(self.caTextField.text!)
            addedDataList[0].Ca = ca ?? 0.0
            let caAbs = Double(self.caTextField.text!)
            addedDataList[0].CaAbs = caAbs ?? 0.0
            let p = Double(self.pTextField.text!)
            addedDataList[0].P = p ?? 0.0
            let pAbs = Double(self.pAbsTextField.text!)
            addedDataList[0].PAbs = pAbs ?? 0.0
            let mg = Double(self.mgTextField.text!)
            addedDataList[0].Mg = mg ?? 0.0
            let mgAbs = Double(self.mgAbsTextField.text!)
            addedDataList[0].MgAbs = mgAbs ?? 0.0
            let k = Double(self.kTextField.text!)
            addedDataList[0].K = k ?? 0.0
            let s = Double(self.sTextField.text!)
            addedDataList[0].S = s ?? 0.0
            let na = Double(self.naTextField.text!)
            addedDataList[0].Na = na ?? 0.0
            let cl = Double(self.clTextField.text!)
            addedDataList[0].Cl = cl ?? 0.0
            let fe = Double(self.feTextField.text!)
            addedDataList[0].Fe = fe ?? 0.0
            let zn = Double(self.znTextField.text!)
            addedDataList[0].Zn = zn ?? 0.0
            let cu = Double(self.cuTextField.text!)
            addedDataList[0].Cu = cu ?? 0.0
            let mn = Double(self.mnTextField.text!)
            addedDataList[0].Mn = mn ?? 0.0
            let se = Double(self.seTextField.text!)
            addedDataList[0].Se = se ?? 0.0
            addedDataList[0].Co = self.coTextField.text!
            addedDataList[0].I = self.iTextField.text!
            addedDataList[0].VitaminA = self.vitaminATextField.text!
            addedDataList[0].VitaminE = self.vitaminETextField.text!
            addedDataList[0].VitaminD3 = self.vitaminD3TextField.text!
            addedDataList[0].Niacin = self.NiacinTextField.text!
            addedDataList[0].Biotin = self.biotinTextField.text!
            addedDataList[0].Reference = self.referTextField.text!
        }
        productList.append(contentsOf: addedDataList)
        writeToFile(location: subUrl!)
        print("this is the location\(String(describing: subUrl))")
    }
    
    func writeToFile(location: URL) {
        do{
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let JsonData = try encoder.encode(productList)
            try JsonData.write(to: location)
            print("this is the location\(location)")
        }catch{}
    }
    
    @IBAction func backButton(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    @IBAction func saveFeedAction(_ sender: Any) {
        changeValues()
    }
    
    
    
}
