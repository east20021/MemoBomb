//
//  ExpiredMemoTableViewCell.swift
//  MemoBomb
//
//  Created by lee on 2018. 3. 5..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit

class ExpiredMemoTableViewCell: UITableViewCell {

    @IBOutlet weak var expiredMemoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
