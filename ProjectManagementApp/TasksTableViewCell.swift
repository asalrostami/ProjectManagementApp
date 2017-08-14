//
//  TasksTableViewCell.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-08.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import UIKit

class TasksTableViewCell: UITableViewCell {

    @IBOutlet weak var taskLbl: UILabel!
    
    @IBOutlet weak var startDateOfTaskCell: UILabel!
    
    
    @IBOutlet weak var statusTaskCell: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
