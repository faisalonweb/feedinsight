//
//  EditPremixViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 28/08/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class EditPremixViewController: UIViewController {
    
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
    
    var screenName : String = ""
    var editList: [Person] = []
    var itemDictionary : [String : Any] = [:]
    var saveName : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        ProfileImage?.layer.cornerRadius = (ProfileImage?.frame.size.width ?? 0.0) / 2
        EditLabel.text! =  screenName
        if(screenName == "Edit Feed") {
            self.FeedName.text! = editList[0].FeedName
            saveName = editList[0].FeedName
            self.FeedType.text! = editList[0].Type1
            self.dryMatter.text! = String(format: "%f", editList[0].DryMatter)
            self.caTextField.text! = String(format: "%f", editList[0].Ca)
            self.caAbsTextField.text! = String(format: "%f", editList[0].CaAbs)
            self.pTextField.text! = String(format: "%f", editList[0].P)
            self.pAbsTextField.text! = String(format: "%f", editList[0].PAbs)
            self.mgTextField.text! = String(format: "%f", editList[0].Mg)
            self.mgAbsTextField.text! = String(format: "%f", editList[0].MgAbs)
            self.kTextField.text! = String(format: "%f", editList[0].K)
            self.sTextField.text! = String(format: "%f", editList[0].S)
            self.naTextField.text! = String(format: "%f", editList[0].Na)
            self.clTextField.text! = String(format: "%f", editList[0].Cl)
            self.feTextField.text! = String(format: "%f", editList[0].Fe)
            self.znTextField.text! = String(format: "%f", editList[0].Zn)
            self.cuTextField.text! = String(format: "%f", editList[0].Cu)
            self.mnTextField.text! = String(format: "%f", editList[0].Mn)
            self.seTextField.text! = String(format: "%f", editList[0].Se)
            self.coTextField.text! = editList[0].Co
            self.iTextField.text! = editList[0].I
            self.vitaminATextField.text! = editList[0].VitaminA
            self.vitaminETextField.text! = editList[0].VitaminE
            self.vitaminD3TextField.text! = editList[0].VitaminD3
            self.NiacinTextField.text! = editList[0].Niacin
            self.biotinTextField.text! = editList[0].Biotin
            self.referTextField.text! = editList[0].Reference
        }
        else {
            
        }
    }
    
    func changeValues() {
        editList[0].FeedName = FeedName.text!
        editList[0].Type1 = FeedType.text!
        let DryMatter = Double(self.dryMatter.text!)
        editList[0].DryMatter = DryMatter ?? 0.0
        let ca = Double(self.caTextField.text!)
        editList[0].Ca = ca ?? 0.0
        let caAbs = Double(self.caTextField.text!)
        editList[0].CaAbs = caAbs ?? 0.0
        let p = Double(self.pTextField.text!)
        editList[0].P = p ?? 0.0
        let pAbs = Double(self.pAbsTextField.text!)
        editList[0].PAbs = pAbs ?? 0.0
        let mg = Double(self.mgTextField.text!)
        editList[0].Mg = mg ?? 0.0
        let mgAbs = Double(self.mgAbsTextField.text!)
        editList[0].MgAbs = mgAbs ?? 0.0
        let k = Double(self.kTextField.text!)
        editList[0].K = k ?? 0.0
        let s = Double(self.sTextField.text!)
        editList[0].S = s ?? 0.0
        let na = Double(self.naTextField.text!)
        editList[0].Na = na ?? 0.0
        let cl = Double(self.clTextField.text!)
        editList[0].Cl = cl ?? 0.0
        let fe = Double(self.feTextField.text!)
        editList[0].Fe = fe ?? 0.0
        let zn = Double(self.znTextField.text!)
        editList[0].Zn = zn ?? 0.0
        let cu = Double(self.cuTextField.text!)
        editList[0].Cu = cu ?? 0.0
        let mn = Double(self.mnTextField.text!)
        editList[0].Mn = mn ?? 0.0
        let se = Double(self.seTextField.text!)
        editList[0].Se = se ?? 0.0
        editList[0].Co = self.coTextField.text!
        editList[0].I = self.iTextField.text!
        editList[0].VitaminA = self.vitaminATextField.text!
        editList[0].VitaminE = self.vitaminETextField.text!
        editList[0].VitaminD3 = self.vitaminD3TextField.text!
        editList[0].Niacin = self.NiacinTextField.text!
        editList[0].Biotin = self.biotinTextField.text!
        editList[0].Reference = self.referTextField.text!
        writeToFile(location: subUrl!)
    }
    
    func writeToFile(location: URL) {
        do{
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let JsonData = try encoder.encode(editList)
            try JsonData.write(to: location)
        }catch{}
    }
    
    @IBAction func backButton(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    @IBAction func saveFeedAction(_ sender: Any) {
//        changeValues()
    }
    
    
    
}
