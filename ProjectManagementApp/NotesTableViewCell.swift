//
//  NotesTableViewCell.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-13.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import UIKit

class NotesTableViewCell: UITableViewCell {

    
    @IBOutlet weak var descLbl: UILabel!
    
    
    @IBOutlet weak var dateNoteLblCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
