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
    var itemDetailArray = [String]()
    var saveName : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        ProfileImage?.layer.cornerRadius = (ProfileImage?.frame.size.width ?? 0.0) / 2
        EditLabel.text! =  screenName
        if(screenName == "Edit Feed") {
        FeedName.text! = itemDetailArray[0]
        saveName = itemDetailArray[0]
        FeedType.text! = itemDetailArray[1]
        self.dryMatter.text! = itemDetailArray[2]
        self.caTextField.text! = itemDetailArray[3]
        self.caAbsTextField.text! = itemDetailArray[4]
        self.pTextField.text! = itemDetailArray[5]
        self.pAbsTextField.text! = itemDetailArray[6]
        self.mgTextField.text! = itemDetailArray[7]
        self.mgAbsTextField.text! = itemDetailArray[8]
        self.kTextField.text! = itemDetailArray[9]
        self.sTextField.text! = itemDetailArray[10]
        self.naTextField.text! = itemDetailArray[11]
        self.clTextField.text! = itemDetailArray[12]
        self.feTextField.text! = itemDetailArray[13]
        self.znTextField.text! = itemDetailArray[14]
        self.cuTextField.text! = itemDetailArray[15]
        self.mnTextField.text! = itemDetailArray[16]
        self.seTextField.text! = itemDetailArray[17]
        self.coTextField.text! = itemDetailArray[18]
        self.iTextField.text! = itemDetailArray[19]
        self.vitaminATextField.text! = itemDetailArray[20]
        self.vitaminETextField.text! = itemDetailArray[21]
        self.vitaminD3TextField.text! = itemDetailArray[22]
        self.NiacinTextField.text! = itemDetailArray[23]
        self.biotinTextField.text! = itemDetailArray[24]
        self.referTextField.text! = itemDetailArray[25]
        }
        else {
            
        }
    }
    
    func changeValues() {
        let url = Bundle.main.url(forResource: "csvjson", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let json = try! JSONSerialization.jsonObject(with: data) as! [[String : Any]]
        for item in json {
            let name = item["Feed Name"] as! String
            if(saveName == name) {
                print(name)
                itemDetailArray[0] = FeedName.text!
                itemDetailArray[1] = FeedType.text!
                itemDetailArray[2] = self.dryMatter.text!
                itemDetailArray[3] = self.caTextField.text!
                itemDetailArray[4] = self.caAbsTextField.text!
                itemDetailArray[5] = self.pTextField.text!
                itemDetailArray[6] = self.pAbsTextField.text!
                itemDetailArray[7] = self.mgTextField.text!
                itemDetailArray[8] = self.mgAbsTextField.text!
                itemDetailArray[9] = self.kTextField.text!
                itemDetailArray[10] = self.sTextField.text!
                itemDetailArray[11] = self.naTextField.text!
                itemDetailArray[12] = self.clTextField.text!
                itemDetailArray[13] = self.feTextField.text!
                itemDetailArray[14] = self.znTextField.text!
                itemDetailArray[15] = self.cuTextField.text!
                itemDetailArray[16] = self.mnTextField.text!
                itemDetailArray[17] = self.seTextField.text!
                itemDetailArray[18] = self.coTextField.text!
                itemDetailArray[19] = self.iTextField.text!
                itemDetailArray[20] = self.vitaminATextField.text!
                itemDetailArray[21] = self.vitaminETextField.text!
                itemDetailArray[22] = self.vitaminD3TextField.text!
                itemDetailArray[23] = self.NiacinTextField.text!
                itemDetailArray[24] = self.biotinTextField.text!
                itemDetailArray[25] = self.referTextField.text!
                let encoder = JSONEncoder()
                encoder.outputFormatting = .prettyPrinted
                let JSONData = try! encoder.encode(itemDetailArray)
                try! JSONData.write(to: url)
            }
        }
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
