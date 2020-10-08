//
//  PDFTableViewCell.swift
//  FeedInsight
//
//  Created by Mac 2014 on 28/09/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class PDFTableViewCell: UITableViewCell {

   
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var animalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
