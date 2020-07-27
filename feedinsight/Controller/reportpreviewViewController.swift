//
//  reportpreviewViewController.swift
//  FeedInsight
//
//  Created by Mac 2014 on 15/06/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class reportpreviewViewController: UIViewController {

    @IBOutlet weak var prelabel: UILabel!
    @IBOutlet weak var preimage: UIImageView!
    
    var previmage = UIImage()
    var prevlabel = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prelabel.text = prevlabel
        preimage.image = previmage
       
    }
    

    @IBAction func onClick(_ sender: Any) {
    }
    

}
