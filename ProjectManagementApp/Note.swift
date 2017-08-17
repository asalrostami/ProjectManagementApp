//
//  Note.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-17.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import Foundation
import RealmSwift

class Note :Object
{
    
     dynamic var noteId : Int = 0
     dynamic var id : Int = 0
     dynamic var noteDesc : String = ""
     dynamic var noteDate : String = ""
    
    
    override class func primaryKey() -> String {
        return "noteId"
    }
    
}
