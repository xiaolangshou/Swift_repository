//
//  DB.swift
//  SQliteDemo3
//
//  Created by mac on 2018/11/28.
//  Copyright © 2018 Liu Tao. All rights reserved.
//

import Foundation
import FMDB

class DB {
    
    // 建表
    class func getDb() -> FMDatabase {
        
        let filemgr = FileManager.default
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        
        let docsDir = dirPaths[0] as String
        
        let databasePath = docsDir + "feedlog.fb"
        
        if !filemgr.fileExists(atPath: databasePath) {
            
            let db = FMDatabase(path: databasePath)
            
            if db.open() {
                let sql_stmt = "CREATE TABLE IF NOT EXISTS FEEDLOGS (ID TEXT PRIMARY KEY, COUNT INTEGER, TYPE INTEGER,LOGTIME DATETIME,LOGDAY TEXT, REMARK TEXT)"
                if !db.executeStatements(sql_stmt) {
                    print("Error: \(db.lastErrorMessage())")
                }
                db.close()
            } else {
                print("Error: \(db.lastErrorMessage())")
            }
        }
        
        let feedlogDb = FMDatabase.init(path: databasePath)
        
        return feedlogDb
    }
    
    // 增
    class func insert(log: FeedLog) {
        
        let sql="INSERT INTO FEEDLOGS (ID, COUNT,TYPE,LOGTIME,LOGDAY,REMARK) "+"VALUES (?,?,?,?,?,?)"
        let db = DB.getDb()
        db.open()
        db.executeUpdate(sql, withArgumentsIn: [log.id, log.count,log.type,log.logTime,log.logDay,log.remark])
        db.close()
    }
    
    // 删
    class func remove(id: String) {
        let sql = "DELETE FROM FEEDLOGS WHERE ID = ?"
        let db = DB.getDb()
        db.open()
        db.executeUpdate(sql, withArgumentsIn: [id])
        db.close()
    }
    
    // 改
    class func update(log: FeedLog) {
        
        let sql = "UPDATE FEEDLOGS SET COUNT=?,TYPE=?,LOGTIME=?,LOGDAY=?,REMARK=? WHERE ID=?"
        let db = DB.getDb()
        db.open()
        db.executeUpdate(sql, withArgumentsIn: [log.count,log.type,log.logTime,log.logDay,log.remark,log.id])
        db.close()
    }
    
    // 查
    class func select(id:String) -> FeedLog? {
        
        let sql = "SELECT * FROM FEEDLOGS WHERE ID = ?"
        let db = DB.getDb()
        db.open()
        let rs = db.executeQuery(sql, withArgumentsIn: [id])
        let log = FeedLog()

        while rs?.next() ?? true {
            
            log.id = rs?.string(forColumn: "ID") ?? ""
            log.count = rs?.int(forColumn: "COUNT") ?? 0
            log.type = rs?.int(forColumn: "TYPE") ?? 0
            log.remark = rs?.string(forColumn: "REMARK") ?? ""
            log.logTime = rs?.date(forColumn: "LOGTIME") ?? Date()
            log.logDay = rs?.string(forColumn: "LOGDAY") ?? ""
        }
        db.close()
        
        return log
    }
    
    
}
