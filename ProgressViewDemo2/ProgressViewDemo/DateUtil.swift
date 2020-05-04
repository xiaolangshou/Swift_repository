//
//  DateUtil.swift
//  Togezer
//
//  Created by Roy on 25/10/2016.
//  Copyright © 2016 ZiuQiuTiYu All rights reserved.
//

import UIKit

class DateUtil: NSObject {

    static func currentTimeStamp() -> Int {
        let now = Date()
        let timeInterval = now.timeIntervalSince1970
        let timeStamp = Int(timeInterval)

        return timeStamp
    }
    
    static func currentMorningTimeStamp() -> Int {
        
        let now = Date()
        let calendar = Calendar(identifier: .chinese)
        let components = calendar.dateComponents([.year,.month,.day], from: now)
        let morning = (calendar.date(from: components))!
        let timeStamp = Int(morning.timeIntervalSince1970)
        
        return timeStamp
    }
    
    static func morningTimeStamp(date: Date) -> Int {
        
        let calendar = Calendar(identifier: .chinese)
        let components = calendar.dateComponents([.year,.month,.day], from: date)
        let morning = (calendar.date(from: components))!
        let timeStamp = Int(morning.timeIntervalSince1970)
        
        return timeStamp
    }

    static func timeStampToString(timeStamp: Int) -> String {
        
        let timeSta = TimeInterval(timeStamp)
        let date = Date(timeIntervalSince1970: timeSta)
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "dd/MM/yy HH:mm:ss"
        
        return dfmatter.string(from: date as Date)
    }
    
    static func stringFromDate(_ date: Date, format:String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
    
    static func dateFromString(_ str: String, format:String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.date(from: str)
    }
    
    static func isToday(_ date: Date) -> Bool {
        
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        
        let today = Date()
        if df.string(from: today) == df.string(from: date) {
            return true
        }
        
        return false
    }
    
    static func getShowStrOfDate(_ date: Date) -> String{
        
        var timeStr: String = ""
        let df = DateFormatter()
        
        if DateUtil.isToday(date) {
            df.dateFormat = "HH:mm"
            timeStr = df.string(from: date)
        } else {
            df.dateFormat = "yy/M/d HH:mm"
            timeStr = df.string(from: date)
        }
        
        return timeStr
    }
    
    static func isSameDay(_ oneDate: Date, anotherDate: Date) -> Bool {
        
        let oneDate = DateUtil.stringFromDate(oneDate, format: "yy/MM/dd")
        let anotherDate = DateUtil.stringFromDate(anotherDate, format: "yy/MM/dd")
        
        if oneDate == anotherDate {
            return true
        }
        
        return false
    }
    
    /// - returns: start from sunday, start from 1, end with 7
    static func getWeekDayIndexFromDate(_ date: Date) -> Int {
        
        let weekDayIndexStr = self.stringFromDate(date, format: "e")
        
        return Int(weekDayIndexStr)!
    }
    
    static func getCNWeekDayStringFromDate(_ date: Date) -> String {
        
        let weekDayIndex = self.getWeekDayIndexFromDate(date)
        var ret = ""
        
        switch weekDayIndex {
        case 1:
            ret = "星期天"
        case 2:
            ret = "星期一"
        case 3:
            ret = "星期二"
        case 4:
            ret = "星期三"
        case 5:
            ret = "星期四"
        case 6:
            ret = "星期五"
        case 7:
            ret = "星期六"
        default:
            ret = ""
        }
        
        return ret
    }
    
}
