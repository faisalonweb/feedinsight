//
//  EditPremixViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 28/08/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import SVProgressHUD

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
            self.dryMatter.text! = productList[currentIndex].DryMatter
            self.caTextField.text! = productList[currentIndex].Ca
            self.caAbsTextField.text! =  productList[currentIndex].CaAbs
            self.pTextField.text! =  productList[currentIndex].P
            self.pAbsTextField.text! =  productList[currentIndex].PAbs
            self.mgTextField.text! =  productList[currentIndex].Mg
            self.mgAbsTextField.text! =  productList[currentIndex].MgAbs
            self.kTextField.text! =  productList[currentIndex].K
            self.sTextField.text! =  productList[currentIndex].S
            self.naTextField.text! =  productList[currentIndex].Na
            self.clTextField.text! =  productList[currentIndex].Cl
            self.feTextField.text! =  productList[currentIndex].Fe
            self.znTextField.text! =  productList[currentIndex].Zn
            self.cuTextField.text! =  productList[currentIndex].Cu
            self.mnTextField.text! =  productList[currentIndex].Mn
            self.seTextField.text! =  productList[currentIndex].Se
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
            productList[currentIndex].DryMatter = self.dryMatter.text!
            productList[currentIndex].Ca = self.caTextField.text!
            productList[currentIndex].CaAbs = self.caTextField.text!
            productList[currentIndex].P = self.pTextField.text!
            productList[currentIndex].PAbs = self.pAbsTextField.text!
            productList[currentIndex].Mg = self.mgTextField.text!
            productList[currentIndex].MgAbs = self.mgAbsTextField.text!
            productList[currentIndex].K = self.kTextField.text!
            productList[currentIndex].S = self.sTextField.text!
            productList[currentIndex].Na = self.naTextField.text!
            productList[currentIndex].Cl = self.clTextField.text!
            productList[currentIndex].Fe = self.feTextField.text!
            productList[currentIndex].Zn = self.znTextField.text!
            productList[currentIndex].Cu = self.cuTextField.text!
            productList[currentIndex].Mn = self.mnTextField.text!
            productList[currentIndex].Se = self.seTextField.text!
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
            addedDataList[0].DryMatter = self.dryMatter.text!
            addedDataList[0].Ca = self.caTextField.text!
            addedDataList[0].CaAbs = self.caTextField.text!
            addedDataList[0].P = self.pTextField.text!
            addedDataList[0].PAbs = self.pAbsTextField.text!
            addedDataList[0].Mg = self.mgTextField.text!
            addedDataList[0].MgAbs = self.mgAbsTextField.text!
            addedDataList[0].K = self.kTextField.text!
            addedDataList[0].S = self.sTextField.text!
            addedDataList[0].Na = self.naTextField.text!
            addedDataList[0].Cl = self.clTextField.text!
            addedDataList[0].Fe = self.feTextField.text!
            addedDataList[0].Zn = self.znTextField.text!
            addedDataList[0].Cu = self.cuTextField.text!
            addedDataList[0].Mn = self.mnTextField.text!
            addedDataList[0].Se = self.seTextField.text!
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
        SVProgressHUD.show(withStatus: "it's working ...")
        writeToFile(location: subUrl!)
        print("this is the location\(String(describing: subUrl))")
    }
    
    func writeToFile(location: URL) {
        do{
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let JsonData = try encoder.encode(productList)
            try JsonData.write(to: location)
            SVProgressHUD.showSuccess(withStatus: "Sucess")
            print("this is the location\(location)")
            SVProgressHUD.dismiss()
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
