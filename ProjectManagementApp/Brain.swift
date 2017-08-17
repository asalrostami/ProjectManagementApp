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
public func ConverDateToString() -> String {
    
    let date = NSDate()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let str = dateFormatter.string(from: date as Date)
    return str
}

public func ConverStringToDate(dateString:String) -> Date {
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.date(from: dateString)
    return date!
}
func GetDateFromString(DateStr: String)-> Date
{
    let calendar = NSCalendar(identifier: NSCalendar.Identifier.gregorian)
    let DateArray = DateStr.components(separatedBy: "-")
    let components = NSDateComponents()
    components.year = Int(DateArray[2])!
    components.month = Int(DateArray[1])!
    components.day = Int(DateArray[0])! + 1
    let date = calendar?.date(from: components as DateComponents)
    
    return date!
}
public func daysBetweenDates(firstDate:Date ,secondDate:Date ) -> Int
{
    let calendar = NSCalendar.current
    
    // Replace the hour (time) of both dates with 00:00
    let date1 = calendar.startOfDay(for: firstDate)
    let date2 = calendar.startOfDay(for: secondDate)
    
    let components = calendar.dateComponents([.day], from: date1, to: date2)
    
    return components.day!
}




