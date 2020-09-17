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
            if self.isSelected {
                self.labelusr.textColor = UIColor.white
            } else {
                self.labelusr.textColor = UIColor.black
            }
        }
    }
}
