//
//  SupplyPDFTableViewCell.swift
//  FeedInsight
//
//  Created by Mac 2014 on 06/10/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class SupplyPDFTableViewCell: UITableViewCell {

    @IBOutlet weak var nutrientNames: UILabel!
    @IBOutlet weak var nutrientUnits: UILabel!
    @IBOutlet weak var nutrientFeed: UILabel!
    @IBOutlet weak var nutrientPremix: UILabel!
    @IBOutlet weak var nutrientWater: UILabel!
    @IBOutlet weak var nutrientTotal: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
