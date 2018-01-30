//
//  WhiteTableViewCell.swift
//  MemoBomb
//
//  Created by lee on 2018. 1. 18..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit

class WhiteTableViewCell: UITableViewCell {

    @IBOutlet weak var contentsLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

