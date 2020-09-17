//
//  JKSQLiteManger.swift
//  FMDB
//
//  Created by Liu Tao on 2020/9/17.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class JKSQLiteManger: NSObject {

    static let shared = JKSQLiteManger()
    
    // MARK: 2、（不安全的）数据库的创建&表的创建
    var dbQueue: FMDatabaseQueue?
    
    func openDB(DBName: String) {
        
        let path = String.cacheDir()+"/\(DBName)"
        print("数据库的路径=\(path)")
        
        dbQueue = FMDatabaseQueue(path: path)
        
        createTable()
    }
    
    func createTable() {
        
        // 1.编写SQL语句
        let sql = "CREATE TABLE IF NOT EXISTS T_Person6( \n" + "id INTEGER PRIMARY KEY AUTOINCREMENT, \n" + "name TEXT, \n" + "age INTEGER \n" + "); \n"
        
        // 2.执行SQL语句
        // 注意点: 在FMDB中除了查询意外, 都称之为更新
        dbQueue!.inDatabase { (db) in
            db.executeUpdate(sql, withArgumentsIn: [])
        }
    }
}
