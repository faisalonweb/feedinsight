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
              if self.isSelected
              {
                
                  self.backgroundColor =  UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1.0)
                  self.signuplabel.textColor = UIColor.white
              }
              else
              {
                  self.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
                  self.signuplabel.textColor = UIColor.black
              }
              
           }
         }
    
}
