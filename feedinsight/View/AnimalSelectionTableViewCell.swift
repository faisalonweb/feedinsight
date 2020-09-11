//
//  AnimalSelectionTableViewCell.swift
//  FeedInsight
//
//  Created by Hamza Iqbal on 11/09/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

class AnimalSelectionTableViewCell: UITableViewCell {

    @IBOutlet weak var tickImage: UIButton!
    @IBOutlet weak var setAnimalName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
