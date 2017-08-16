//
//  Task.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-15.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import Foundation
import RealmSwift

class Task: Object {
    
    dynamic var idTask : Int = 0
    dynamic var taskName : String = ""
    dynamic var startDate : String = ""
    dynamic var status : Int = 0
    dynamic var finishDate : String = ""
    

    
}
