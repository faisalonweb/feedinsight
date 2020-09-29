
//
//  UnitConvertorViewController.swift
//  FeedInsight
//
//  Created by Hamza Iqbal on 29/09/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class UnitConvertorViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var proimage: UIImageView!
    @IBOutlet weak var value1: UITextField! {
        didSet { value1?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var value2: UITextField! {
        didSet { value2?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var result1: UITextField!
    @IBOutlet weak var result2: UITextField!
    let defaults = UserDefaults(suiteName:"User")
    var val1 : Double = 0.0
    var val2 : Double = 0.0
    var rsl1 : Double = 0.0
    var rsl2 : Double = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        value1.delegate = self
        value2.delegate = self
        value1.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        value2.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        proimage?.layer.cornerRadius = (proimage?.frame.size.width ?? 0.0) / 2
        proimage?.clipsToBounds = true
        proimage?.layer.borderWidth = 3.0
        proimage?.layer.borderColor = UIColor.white.cgColor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let userName = defaults!.value(forKey: "usernameStringKey"){
            self.userNameLabel.text = userName as? String
            print(userName)
        }
        DispatchQueue.main.async { [weak self] in
            let data = self?.defaults!.value(forKey: "imageData") as? Data
            if(data != nil) {
                self?.proimage.image = UIImage(data: data!)
            }
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if(textField == value1) {
            val1 = Double(textField.text!) ?? 0.0
        } else if(textField == value2) {
            val2 = Double(textField.text!) ?? 0.0
        }
        rsl1 = 2 * val1
        rsl2 = 4 * val2
        self.result1.text = String(rsl1)
        self.result2.text = String(rsl2)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true;
    }

    @IBAction func backBtnTapped(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
}
