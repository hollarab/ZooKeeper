//
//  StaffTableViewCell.swift
//  ZooKeeper
//
//  Created by hollarab on 2/13/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import UIKit

class StaffTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureViewForStaff(staff:Staff) {
        nameLabel.text = staff.name
    }

}
