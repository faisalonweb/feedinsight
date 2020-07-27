//
//  feedanalysis3ViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 29/06/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit
import iOSDropDown

class feedanalysis3ViewController: UIViewController {
    
    
    @IBOutlet weak var feedstuff: DropDown!
    @IBOutlet weak var kgstuff: DropDown!
    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var plusbutton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       self.navigationController?.isNavigationBarHidden = true
        profileimage.layer.cornerRadius = 17
        plusbutton.layer.cornerRadius = 10
        feedstuff.optionArray = ["Cow","Deer","Camel"]
        feedstuff.didSelect{(selectedText , index ,id) in
            
            
        }
        kgstuff.optionArray = ["1","2","3"]
        kgstuff.didSelect{(selectedText , index ,id) in
    }
    

   

}
    @IBAction func NextTap(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "waterViewController") as? wateroneViewController
                      self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func loadTap(_ sender: UIButton) {
    }
    @IBAction func saveTap(_ sender: UIButton) {
    }
    
    @IBAction func backBtn(_ sender: Any) {
        if let navController = self.navigationController {
        navController.popViewController(animated: true)
                                               }
    }
}
