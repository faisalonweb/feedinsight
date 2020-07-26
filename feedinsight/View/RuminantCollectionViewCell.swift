//
//  RuminantCollectionViewCell.swift
//  FeedInsight
//
//  Created by Mac on 23/04/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class RuminantCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var ruminantLabel: UILabel!
    
    var pickanimalData : pickAnimal? {

               didSet {

                
                ruminantLabel.text = pickanimalData?.pickAnimalStr
    //               txtView.text = pickpremixData?.titleStr
               }
           }
}
