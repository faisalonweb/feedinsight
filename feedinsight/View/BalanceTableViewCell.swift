//
//  BalanceTableViewCell.swift
//  FeedInsight
//
//  Created by Mac 2014 on 06/10/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class BalanceTableViewCell: UITableViewCell {

    @IBOutlet weak var nutrientNames: UILabel!
    @IBOutlet weak var nutreintUnits: UILabel!
    @IBOutlet weak var nutrientValues: UILabel!
    @IBOutlet weak var nutrientPercent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
