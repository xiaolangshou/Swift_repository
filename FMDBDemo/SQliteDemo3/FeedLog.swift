//
//  FeedLog.swift
//  SQliteDemo3
//
//  Created by mac on 2018/11/28.
//  Copyright © 2018 Liu Tao. All rights reserved.
//

import Foundation

class FeedLog {
    
    var id: String
    var count: Int32
    var type: Int32
    var remark: String
    var logTime: Date
    var logDay: String
    
    init() {
        id = ""
        count = 0
        type = 0
        remark = ""
        logTime = Date.init()
        logDay = ""
    }
    
    init(id: String,
         count: Int32,
         type: Int32,
         remark: String,
         logTime: Date,
         logDay: String)
    {
        self.id = id
        self.count = count
        self.type = type
        self.remark = remark
        self.logTime = logTime
        self.logDay = logDay
    }
}
