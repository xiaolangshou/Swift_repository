//
//  Date+Extension.swift
//  Soccer
//
//  Created by Thomas Lau on 2018/4/12.
//  Copyright © 2018年 追球体育. All rights reserved.
//

import Foundation

extension Date {

    // 今年
    static func currentYear() -> Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day], from: Date())
        return com.year!
    }
    
    // 今月
    static func currentMonth() -> Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day], from: Date())
        return com.month!
        
    }
    
    // 今日
    static func currentDay() -> Int {
        let calendar = NSCalendar.current
        let com = calendar.dateComponents([.year,.month,.day], from: Date())
        return com.day!
        
    }
    
    // 今天星期几
    static func currentWeekDay() -> Int{
        let interval = Int(Date().timeIntervalSince1970)
        let days = Int(interval/86400) // 24*60*60
        let weekday = ((days + 4)%7+7)%7
        return weekday == 0 ? 7 : weekday
    }
    
    // 本月天数
    static func countOfDaysInCurrentMonth() -> Int {
        let calendar = Calendar(identifier:Calendar.Identifier.gregorian)
        let range = (calendar as NSCalendar?)?.range(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: Date())
        return (range?.length)!
        
    }
    
    // 根据年月得到某月天数
    static func getCountOfDaysInMonth(year: Int, month: Int) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM"
        let date
            = dateFormatter.date(from: String(year)+"-"+String(month))
        let calendar = Calendar(identifier:Calendar.Identifier.gregorian)
        let range = (calendar as NSCalendar?)?.range(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: date!)
        return (range?.length)!
    }
    
    // 根据年月得到某月第一天是周几
    static func getfirstWeekDayInMonth(year: Int, month: Int) -> Int {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM"
        let date = dateFormatter.date(from: String(year) + "-" + String(month))
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        let comps = (calendar as NSCalendar?)?.components(NSCalendar.Unit.weekday, from: date!)
        let week = comps?.weekday
        return week! - 1
    }
    
    // 本月开始日期
    static func startOfCurrentMonth() -> Date {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let calendar = Calendar.current
        let components = calendar.dateComponents(Set<Calendar.Component>([.year, .month]), from: date)
        let startOfMonth = calendar.date(from: components)!
        let dateStr = dateFormatter.string(from: startOfMonth as Date)
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let finalDate = dateFormatter.date(from: dateStr)
        
        return finalDate!
    }
    
    // 本月结束日期
    static func endOfCurrentMonth() -> Date {
        let calendar = Calendar.current
        var components = DateComponents()
        components.month = 1
        components.day = -1
        
        let endOfMonth = calendar.date(byAdding: components, to: startOfCurrentMonth())!
        return endOfMonth
    }
    
    // 指定年月的开始日期
    static func startOfMonth(year: Int, month: Int) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let calendar = Calendar.current
        var startComps = DateComponents()
        startComps.day = 1
        startComps.month = month
        startComps.year = year
        let startDate = calendar.date(from: startComps)!
        let dateStr = dateFormatter.string(from: startDate)
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        
        let finalDate = dateFormatter.date(from: dateStr)
        
        return finalDate!
    }
    
    
    // 指定年月的结束日期
    static func endOfMonth(year: Int, month: Int) -> Date {
        
        let calendar = Calendar.current
        var components = DateComponents()
        components.month = 1
        components.day = -1
        
        let endDate = calendar.date(byAdding: components,
                                      to: startOfMonth(year: year, month: month))!
        return endDate
    }
    
    // date转日期字符串
    static func dateToDateString(_ date: Date, dateFormat: String) -> String {
        let timeZone = NSTimeZone.local
        let formatter = DateFormatter()
        formatter.timeZone = timeZone
        formatter.dateFormat = dateFormat
        
        let date = formatter.string(from: date)
        return date
    }
    
    // 日期字符串转date
    static func dateStringToDate(_ dateStr:String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: dateStr)
        return date!
    }
    
    // 时间字符串转date
    static func timeStringToDate(_ dateStr:String) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd  HH:mm:ss"
        let date = dateFormatter.date(from: dateStr)
        return date!
    }
    
    // 计算天数差
    static func dateDifference(_ dateA: Date, from dateB: Date) -> Double {
        let interval = dateA.timeIntervalSince(dateB)
        return interval/86400
    }
    
    // 比较时间先后
    static func compareOneDay(oneDay: Date, withAnotherDay anotherDay: Date) ->  Int {
        
        let dateFormatter:DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let oneDayStr:String = dateFormatter.string(from: oneDay)
        let anotherDayStr:String = dateFormatter.string(from: anotherDay)
        let dateA = dateFormatter.date(from: oneDayStr)
        let dateB = dateFormatter.date(from: anotherDayStr)
        let result:ComparisonResult = (dateA?.compare(dateB!))!
        // Date1 is in the future
        if(result == ComparisonResult.orderedDescending ) {
            return 1
        }
        // Date1 is in the past
        else if(result == ComparisonResult.orderedAscending) {
            return 2
        }
        // Both dates are the same
        else {
            return 0
        }
    }

    // 将时间转换为时间戳
    static func stringToTimeStamp(_ stringTime: String)-> Int {
        let dfmatter = DateFormatter()
        dfmatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        dfmatter.locale = Locale.current
        
        let date = dfmatter.date(from: stringTime)
        let dateStamp:TimeInterval = date!.timeIntervalSince1970
        let dateSt = Int(dateStamp)
        
        return dateSt
    }
    
    // 将时间戳转换为年月日
    static func timeStampToString(_ timeStamp:String) ->String {
        let string = NSString(string: timeStamp)
        let timeSta:TimeInterval = string.doubleValue
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="yyyy年MM月dd日"
        let date = Date(timeIntervalSince1970: timeSta)
        return dfmatter.string(from: date)
    }
    
    // 将时间戳转换为具体时间
    static func timeStampToStringDetail(_ timeStamp:String) -> String {
        let string = NSString(string: timeStamp)
        let timeSta:TimeInterval = string.doubleValue
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="yyyy年MM月dd日HH:mm:ss"
        let date = Date(timeIntervalSince1970: timeSta)
        return dfmatter.string(from: date)
    }
    
    // 将时间戳转换为时分秒
    static func timeStampToHHMMSS(_ timeStamp:String) -> String {
        let string = NSString(string: timeStamp)
        let timeSta:TimeInterval = string.doubleValue
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="HH:mm:ss"
        let date = Date(timeIntervalSince1970: timeSta)
        return dfmatter.string(from: date)
    }
    
    // 获取系统的当前时间戳
    static func getCurrentStamp() -> Int {
        // 获取当前时间戳
        let date = Date()
        let timeInterval = Int(date.timeIntervalSince1970)
        return timeInterval
    }
    
    // 月份数字转汉字
    static func numberToChina(monthNum: Int) -> String {
        let ChinaArray = ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"]
        let ChinaStr:String = ChinaArray[monthNum - 1]
        return ChinaStr
        
    }
    
    // 数字前补0
    static func add0BeforeNumber(_ number: Int) -> String {
        if number >= 10 {
            return String(number)
        } else {
            return "0" + String(number)
        }
    }
    
    // 获取指定日期
    static func getDate(monthsToAdd: Int, daysToAdd: Int) -> Date {
        
        var newDateComponent = DateComponents()
        newDateComponent.month = monthsToAdd
        newDateComponent.day = daysToAdd
        
        let calculatedDate = Calendar.current.date(byAdding: newDateComponent, to: Date())
        
        return calculatedDate!
    }

    // 获取从某天开始的指定日期
    static func getDate(startDate: Date, monthsToAdd: Int, daysToAdd: Int) -> Date {
        
        var newDateComponent = DateComponents()
        newDateComponent.month = monthsToAdd
        newDateComponent.day = daysToAdd
        
        let calculatedDate = Calendar.current.date(byAdding: newDateComponent, to: startDate)
        
        if daysToAdd == 0
            && monthsToAdd == 0
        {
            return startDate
        }
        
        return calculatedDate!
    }
    
    // 比较两个时间戳之差
    static func compareTwoTime(startTimeStamp: Int, nowTimeStamp: Int) -> String {
        
        var timeString = String()
        let timeDiff = nowTimeStamp - startTimeStamp
        let mins = Int(timeDiff / 60)
        
        if mins < 0 {
            timeString = "未开"
        } else if mins >= 0 && mins <= 90 {
            timeString = String(mins) + "'"
        } else {
            timeString = "完场"
        }
        
        return timeString
    }
    
    // 比较两个时间戳之差，返回整型
    static func compareTwoTimeInt(startTimeStamp: Int, nowTimeStamp: Int) -> Int {
        
        var timeInt = Int(0)
        let timeDiff = nowTimeStamp - startTimeStamp
        let mins = Int(timeDiff / 60)
        
        if mins < 0 {
            timeInt = 0
        } else if mins >= 0 && mins <= 90 {
            timeInt = mins
        } else {
            timeInt = 90
        }
        
        return timeInt
    }

}
