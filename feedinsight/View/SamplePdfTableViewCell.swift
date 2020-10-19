//
//  SamplePdfTableViewCell.swift
//  FeedInsight
//
//  Created by Mac 2014 on 19/10/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class SamplePdfTableViewCell: UITableViewCell {
    @IBOutlet weak var feedName: UILabel!
    @IBOutlet weak var moisture: UILabel!
    @IBOutlet weak var CP: UILabel!
    @IBOutlet weak var Fat: UILabel!
    @IBOutlet weak var Ash: UILabel!
    @IBOutlet weak var CF: UILabel!
    @IBOutlet weak var ADF: UILabel!
    @IBOutlet weak var NDF: UILabel!
    @IBOutlet weak var Search: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
