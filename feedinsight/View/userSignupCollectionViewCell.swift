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
    
    override var isSelected: Bool{
        didSet{
            if self.isSelected {
                self.signuplabel.textColor = UIColor.white
            }
            else {
                self.signuplabel.textColor = UIColor.black
            }
            
        }
    }
}
