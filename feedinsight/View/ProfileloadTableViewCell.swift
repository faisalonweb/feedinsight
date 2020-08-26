//
//  ProfileloadTableViewCell.swift
//  FeedInsight
//
//  Created by Mac on 26/04/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class ProfileloadTableViewCell: UITableViewCell {
    
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var arrowView: UIImageView!
    @IBOutlet weak var textlabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

