//
//  userCollectionViewCell.swift
//  FeedInsight
//
//  Created by Mac 2014 on 10/06/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class userCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageusr: UIImageView!
    
    @IBOutlet weak var labelusr: UILabel!
    
    override var isSelected: Bool{
        didSet{
           if self.isSelected
           {
             
               self.backgroundColor =  UIColor(red: 154/255, green: 9/255, blue: 87/255, alpha: 1.0)
               self.labelusr.textColor = UIColor.white
           }
           else
           {
               self.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
               self.labelusr.textColor = UIColor.black
           }
           
        }
      }
    
}
