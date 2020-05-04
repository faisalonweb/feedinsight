//
//  SignUpCollectionViewCell.swift
//  FeedInsight
//
//  Created by Mac on 22/04/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class SignUpCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var industryImage: UIImageView!
    @IBOutlet weak var industryLabel: UILabel!
   override var isSelected: Bool{
     didSet{
        if self.isSelected
        {
          
            self.backgroundColor =  UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1.0)
            self.industryLabel.textColor = UIColor.white
        }
        else
        {
            self.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
            self.industryLabel.textColor = UIColor.black
        }
        
     }
   }
}
