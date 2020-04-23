//
//  LoginViewController.swift
//  FeedInsight
//
//  Created by Mac on 21/04/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    
    @IBAction func LoginBtntap(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        print("vale is", emailField)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "One"
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
