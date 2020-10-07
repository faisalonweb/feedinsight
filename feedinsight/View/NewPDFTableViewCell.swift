//
//  NewPDFTableViewCell.swift
//  FeedInsight
//
//  Created by Mac 2014 on 06/10/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class NewPDFTableViewCell: UITableViewCell {

    @IBOutlet weak var nutrientName: UILabel!
    @IBOutlet weak var nutrientValue: UILabel!
    
    @IBOutlet weak var nutrientUnit: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
