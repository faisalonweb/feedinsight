//
//  userSignupCollectionViewCell.swift
//  FeedInsight
//
//  Created by Mac 2014 on 18/06/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class userSignupCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var signupimage: UIImageView!
    @IBOutlet weak var signuplabel: UILabel!
    var p : Int = -1
    let imageArr: [UIImage] = [
        UIImage(named: "research-unselected")!,
        UIImage(named: "farm-unselected")!,
        UIImage(named: "feedmanufacturing-unselected")!,
    ]
    override func awakeFromNib() {
        super.awakeFromNib()
        NotificationCenter.default.addObserver(self, selector: #selector(doThisWhenNotify), name: NSNotification.Name(rawValue: "myCellKey"), object: nil)
    }
    
    @objc func doThisWhenNotify(notification: NSNotification) {
        print(notification.userInfo ?? "")
        if let dict = notification.userInfo as NSDictionary? {
            p = (dict["P"] as? Int)!
        }
    }
    
    override var isSelected: Bool{
        didSet{
            if self.isSelected {
                self.backgroundColor =  UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1.0)
                self.signuplabel.textColor = UIColor.white
                if(p == 0) {
                    self.signupimage.image = UIImage(named: "research-unselected")!
                } else if (p == 1) {
                    
                } else if (p == 2) {
                    
                }
            }
            else {
                self.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
                self.signuplabel.textColor = UIColor.black
                if(p == 0) {
                    
                } else if (p == 1) {
                    
                } else if (p == 2) {
                    
                }
            }
            
        }
    }
}
