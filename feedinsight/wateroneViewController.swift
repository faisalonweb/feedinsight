//
//  wateroneViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 30/06/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class wateroneViewController: UIViewController {

    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var standardbtn: UIButton!
    @IBOutlet weak var custombtn: UIButton!
    @IBOutlet weak var palabel: UILabel!
    @IBOutlet weak var calabel: UILabel!
    @IBOutlet weak var mglabel: UILabel!
    @IBOutlet weak var klabel: UILabel!
    @IBOutlet weak var nalabel: UILabel!
    @IBOutlet weak var cllabel: UILabel!
    @IBOutlet weak var slabel: UILabel!
    
    
    override func viewDidLoad() {
        
        profileimage.layer.cornerRadius = 17
        standardbtn.layer.cornerRadius = 8
        custombtn.layer.cornerRadius = 8
        palabel.layer.cornerRadius = 15
        calabel.layer.cornerRadius = 15
        mglabel.layer.cornerRadius = 15
        klabel.layer.cornerRadius = 15
        nalabel.layer.cornerRadius = 15
        calabel.layer.cornerRadius = 15
        slabel.layer.cornerRadius = 15
        super.viewDidLoad()

       
    }
    
    @IBAction func saveTap(_ sender: UIButton) {
    }
    @IBAction func loadTap(_ sender: UIButton) {
    }
    
    @IBAction func nextTap(_ sender: UIButton) {
          let vc = storyboard?.instantiateViewController(withIdentifier: "report") as? PreviewViewController
               self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}
