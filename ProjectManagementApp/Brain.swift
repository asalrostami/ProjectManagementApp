//
//  Brain.swift
//  ProjectManagementApp
//
//  Created by Asal Rostami on 2017-08-16.
//  Copyright © 2017 Asal Rostami. All rights reserved.
//

import Foundation

public func statusNumToString(statusNum:Int) -> String
{
    var statusString = ""
    if statusNum == 0
    {
        statusString = "To Do"
    }else if statusNum == 1
    {
        statusString = "In Progress"
    }else if statusNum == 2
    {
        statusString = "Done"
    }
    
    return statusString
    
}

public func statusStringToNum(statusString:String) -> Int
{
    var statusNum = 0
    
    if statusString == "To Do"
    {
        statusNum = 0
    }else if statusString == "In Progress"
    {
        statusNum = 1
    }else if statusString == "Done"
    {
        statusNum = 2
    }
    
    return statusNum
    
}
public func DateAsString() -> String {
    
    let date = NSDate()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let str = dateFormatter.string(from: date as Date)
    return str
}

