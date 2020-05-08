//
//  StateViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 22/04/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import iOSDropDown


class StateViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var proimage: UIImageView!
    
    @IBOutlet weak var notificationimage: UIImageView!
    @IBOutlet weak var dropDown: DropDown!
    @IBOutlet weak var PsychField: DropDown!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var animalField: UITextField!
    @IBOutlet weak var CurrentBodyWeightF: UITextField!{
        didSet { CurrentBodyWeightF?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var TargetBodyWeightF: UITextField!{
        didSet { TargetBodyWeightF?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var daystoAchiveF: UITextField!{
        didSet { daystoAchiveF?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var milkInProducitonF: UITextField!{
        didSet { milkInProducitonF?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var daysinMilkF: UITextField!{
        didSet { daysinMilkF?.addDoneCancelToolbar() }
    }
    @IBOutlet weak var daysPregnantF: UITextField! {
        didSet { daysPregnantF?.addDoneCancelToolbar() }
    }
    //let numberToolbar: UIToolbar = UIToolbar()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameField.delegate = self
        self.animalField.delegate = self
        
        notificationimage?.layer.cornerRadius = (notificationimage?.frame.size.width ?? 0.0) / 2
              notificationimage?.clipsToBounds = true
              notificationimage?.layer.borderWidth = 3.0
              notificationimage?.layer.borderColor = UIColor.white.cgColor
        
        proimage?.layer.cornerRadius = (proimage?.frame.size.width ?? 0.0) / 2
              proimage?.clipsToBounds = true
              proimage?.layer.borderWidth = 3.0
              proimage?.layer.borderColor = UIColor.white.cgColor
        
        dropDown.optionArray = ["Option 1", "Option 2", "Option 3"]
        //Its Id Values and its optional
        dropDown.optionIds = [1,23,54,22]
        dropDown.didSelect{(selectedText , index ,id) in
        }
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           self.view.endEditing(true)
           return false
       }
    
    
}

extension UITextField {
    func addDoneCancelToolbar(onDone: (target: Any, action: Selector)? = nil, onCancel: (target: Any, action: Selector)? = nil) {
        let onCancel = onCancel ?? (target: self, action: #selector(cancelButtonTapped))
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))

        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(title: "Cancel", style: .plain, target: onCancel.target, action: onCancel.action),
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: onDone.target, action: onDone.action)
        ]
        toolbar.sizeToFit()

        self.inputAccessoryView = toolbar
    }

    // Default actions:
    @objc func doneButtonTapped() { self.resignFirstResponder() }
    @objc func cancelButtonTapped() { self.resignFirstResponder() }
}
