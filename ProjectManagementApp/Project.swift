//
//  Project.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-12.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import UIKit

class Project {
    
    
    var name = ""
    var startDate = ""
    var finishDate = ""
    
    init() {
        
    }
    
    init(name:String,startDate:String,finishDate:String) {
        self.name = name
        self.startDate = startDate
        self.finishDate = finishDate
    }
    
}
    

