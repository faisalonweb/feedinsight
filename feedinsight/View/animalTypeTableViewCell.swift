//
//  animalTypeTableViewCell.swift
//  FeedInsight
//
//  Created by Mac 2014 on 14/09/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class animalTypeTableViewCell: UITableViewCell {

    @IBOutlet weak var setimagebtn: UIButton!
    @IBOutlet weak var imageset: UIImageView!
    @IBOutlet weak var labelset: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
