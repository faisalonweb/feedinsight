//
//  profileTitleTableViewCell.swift
//  FeedInsight
//
//  Created by Mac on 26/04/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class profileTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: -30, left: -30, bottom: -30, right: -30))
//    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
