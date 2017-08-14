//
//  Task.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-14.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import UIKit

class Task: NSObject {
    var taskName = ""
    var startDate = ""
    var status = 0
    var finishDate = ""
    
    override init()
    {
        
    }
    
    init(taskName:String,startDate:String,status:Int) {
        self.taskName = taskName
        self.startDate = startDate
        self.status = status

    }
    

}
