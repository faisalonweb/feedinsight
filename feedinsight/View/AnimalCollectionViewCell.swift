//
//  AnimalCollectionViewCell.swift
//  FeedInsight
//
//  Created by Mac on 23/04/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class AnimalCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var animalImage: UIImageView!
       @IBOutlet weak var animalLabel: UILabel!
    
    var animalData : AnimalCollectionCell? {

           didSet {

            animalImage.image = animalData?.animalImg
            animalLabel.text = animalData?.animalStr
//               txtView.text = premixData?.titleStr
           }
       }
}
