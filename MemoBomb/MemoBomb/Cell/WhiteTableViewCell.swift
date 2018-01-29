//
//  WhiteTableViewCell.swift
//  MemoBomb
//
//  Created by lee on 2018. 1. 18..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit

class WhiteTableViewCell: UITableViewCell {

    @IBOutlet weak var progressWidth: NSLayoutConstraint!
    @IBOutlet weak var contentsLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension NSLayoutConstraint {
    func changeMultiplier(changeMultiplier: CGFloat) -> NSLayoutConstraint {
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(item: self.firstItem!,
                                               attribute: self.firstAttribute,
                                               relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: changeMultiplier, constant: self.constant)
        
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        NSLayoutConstraint.activate([newConstraint])
        
        return newConstraint
    }
}
