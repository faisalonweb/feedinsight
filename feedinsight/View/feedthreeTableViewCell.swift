//
//  feedthreeTableViewCell.swift
//  FeedInsight
//
//  Created by Mac 2014 on 21/07/2020.
//  Copyright © 2020 faisal. All rights reserved.
//

import UIKit

protocol feedthreeTableViewCellDelegate: class {
  func minusTapped(cellIndex: Int)
}

class feedthreeTableViewCell: UITableViewCell {
    @IBOutlet weak var labeltxt: UILabel!
    var cellIndex = -1
    weak var delegate: feedthreeTableViewCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func deleteBtn(_ sender: Any) {
        delegate?.minusTapped(cellIndex: cellIndex)
    }
}
