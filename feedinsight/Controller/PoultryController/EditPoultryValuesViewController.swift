//
//  EditPoultryValuesViewController.swift
//  FeedInsight
//
//  Created by Hamza Iqbal on 18/12/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class EditPoultryValuesViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var tf2: UITextField!
    @IBOutlet weak var tf3: UITextField!
    @IBOutlet weak var tf4: UITextField!
    @IBOutlet weak var tf5: UITextField!
    @IBOutlet weak var tf6: UITextField!
    @IBOutlet weak var tf7: UITextField!
    @IBOutlet weak var tf9: UITextField!
    @IBOutlet weak var tf10: UITextField!
    @IBOutlet weak var tf11: UITextField!
    @IBOutlet weak var tf12: UITextField!
    @IBOutlet weak var tf13: UITextField!
    @IBOutlet weak var tf14: UITextField!
    @IBOutlet weak var tf15: UITextField!
    @IBOutlet weak var tf16: UITextField!
    @IBOutlet weak var tf17: UITextField!
    @IBOutlet weak var tf18: UITextField!
    @IBOutlet weak var tf19: UITextField!
    @IBOutlet weak var tf20: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tf1.text = Requirments.shared().poultryVitaminA ?? "0"
        self.tf2.text = Requirments.shared().poultryVitaminD3 ?? "0"
        self.tf3.text = Requirments.shared().poultryVitaminE ?? "0"
        self.tf4.text = Requirments.shared().poultryVitaminK ?? "0"
        self.tf5.text = Requirments.shared().poultryVitaminB1 ?? "0"
        self.tf6.text = Requirments.shared().poultryVitaminB2 ?? "0"
        self.tf7.text = Requirments.shared().poultryVitaminB3 ?? "0"
        self.tf9.text = Requirments.shared().poultryVitaminB5 ?? "0"
        self.tf10.text = Requirments.shared().poultryVitaminB6 ?? "0"
        self.tf11.text = Requirments.shared().poultryVitaminB7 ?? "0"
        self.tf12.text = Requirments.shared().poultryVitaminB9 ?? "0"
        self.tf13.text = Requirments.shared().poultryVitaminB12 ?? "0"
        self.tf14.text = Requirments.shared().poultryZInc ?? "0"
        self.tf15.text = Requirments.shared().poultryManganese ?? "0"
        self.tf16.text = Requirments.shared().poultryCopper ?? "0"
        self.tf17.text = Requirments.shared().poultryIodine ?? "0"
        self.tf18.text = Requirments.shared().poultrySelenium ?? "0"
        self.tf19.text = Requirments.shared().poultryCobalt ?? "0"
        self.tf20.text = Requirments.shared().poultryIron ?? "0"
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtn(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    @IBAction func clearAll(_ sender: Any) {
        self.tf1.text = ""
        self.tf2.text = ""
        self.tf3.text = ""
        self.tf4.text = ""
        self.tf5.text = ""
        self.tf6.text = ""
        self.tf7.text = ""
        self.tf9.text = ""
        self.tf10.text = ""
        self.tf11.text = ""
        self.tf12.text = ""
        self.tf13.text = ""
        self.tf14.text = ""
        self.tf15.text = ""
        self.tf16.text = ""
        self.tf17.text = ""
        self.tf18.text = ""
        self.tf19.text = ""
        self.tf20.text = ""
    }
    
    @IBAction func doneBtn(_ sender: Any) {
        Requirments.shared().poultryVitaminA = self.tf1.text ?? "0"
        Requirments.shared().poultryVitaminD3 = self.tf2.text ?? "0"
        Requirments.shared().poultryVitaminE = self.tf3.text ?? "0"
        Requirments.shared().poultryVitaminK = self.tf4.text ?? "0"
        Requirments.shared().poultryVitaminB1 = self.tf5.text ?? "0"
        Requirments.shared().poultryVitaminB2 = self.tf6.text ?? "0"
        Requirments.shared().poultryVitaminB3 = self.tf7.text ?? "0"
        Requirments.shared().poultryVitaminB5 = self.tf9.text ?? "0"
        Requirments.shared().poultryVitaminB6 = self.tf10.text ?? "0"
        Requirments.shared().poultryVitaminB7 = self.tf11.text ?? "0"
        Requirments.shared().poultryVitaminB9 = self.tf12.text ?? "0"
        Requirments.shared().poultryVitaminB12 = self.tf13.text ?? "0"
        Requirments.shared().poultryZInc = self.tf14.text ?? "0"
        Requirments.shared().poultryManganese = self.tf15.text ?? "0"
        Requirments.shared().poultryCopper = self.tf16.text ?? "0"
        Requirments.shared().poultryIodine = self.tf17.text ?? "0"
        Requirments.shared().poultrySelenium = self.tf18.text ?? "0"
        Requirments.shared().poultryCobalt = self.tf19.text ?? "0"
        Requirments.shared().poultryIron = self.tf20.text ?? "0"
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
