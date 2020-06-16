//
//  cellrTableViewCell.swift
//  FeedInsight
//
//  Created by Mac 2014 on 15/06/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class cellrTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
