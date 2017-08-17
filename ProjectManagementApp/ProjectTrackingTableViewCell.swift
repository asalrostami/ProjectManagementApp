//
//  ProjectTrackingTableViewCell.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-14.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import UIKit

class ProjectTrackingTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var taskNameLblCell: UILabel!

    @IBOutlet weak var startDateTaskCell: UILabel!
    
    
    @IBOutlet weak var statusTaskCell: UILabel!
    
    @IBOutlet weak var finishDateTaskCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
