//
//  ViewController.swift
//  FMDB2
//
//  Created by Thomas Lau on 2020/9/18.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTable()
//        insertElement(arr: ["Thomas", 29])
//        insertElement(arr: ["Liu Tao", 22])
//        updateElement(arr: ["Zhu Lili", 2])
        deleteElement(arr: [2])
//        insertDatas()
    }

    // 创建表
    func createTable() {
        // 编写SQL语句（id: 主键  name和age是字段名）
        let sql = "CREATE TABLE IF NOT EXISTS User( \n" +
            "id INTEGER PRIMARY KEY AUTOINCREMENT, \n" +
            "name TEXT, \n" +
            "age INTEGER \n" +
        "); \n"
         
        // 执行SQL语句（注意点: 在FMDB中除了查询意外, 都称之为更新）
        let db = SQLiteManager.shareManger().db
        if db.open() {
            if db.executeUpdate(sql, withArgumentsIn: []){
                print("创建表成功")
            } else {
                print("创建表失败")
            }
        }
        db.close()
    }
    
    // 查询数据
    func checkData(arr: [Any]) {
        
        let sql = "SELECT * FROM User WHERE id < ?"
        
        let db = SQLiteManager.shareManger().db
        if db.open() {
            if let res = db.executeQuery(sql, withArgumentsIn: arr) {
                while res.next() {
                    let id = res.int(forColumn: "id")
                    let name = res.string(forColumn: "name")!
                    let age = res.int(forColumn: "age")
                    print(id, name, age)
                }
            } else {
                print("查询失败")
            }
        }
        db.close()
    }
    
    // 插入数据
    func insertElement(arr: [Any]) {
        
        let sql = "INSERT INTO User (name, age) VALUES (?,?);"
        
        let db = SQLiteManager.shareManger().db
        if db.open() {
            if db.executeUpdate(sql, withArgumentsIn: arr) {
                print("插入成功")
            } else {
                print("插入失败")
            }
        }
        db.close()
    }
    
    // 更新数据
    func updateElement(arr: [Any]) {
        
        let sql = "UPDATE User set name = ? WHERE id = ?;"
        
        let db = SQLiteManager.shareManger().db
        if db.open() {
            if db.executeUpdate(sql, withArgumentsIn: arr) {
                print("更新成功")
            } else {
                print("更新失败")
            }
        }
        db.close()
    }
    
    // 删除数据
    func deleteElement(arr: [Any]) {
        
        let sql = "DELETE FROM User WHERE id = ?;"
        // let sql = "DELETE FROM User WHERE id between 21 and 26;"
        
        let db = SQLiteManager.shareManger().db
        if db.open() {
            if db.executeUpdate(sql, withArgumentsIn: arr) {
                print("删除成功")
            } else {
                print("删除成功")
            }
        }
        db.close()
    }
    
    // 批量插入数据
    func insertDatas() {
        
        if let queue = SQLiteManager.shareManger().dbQueue {
            queue.inTransaction { (db, rollback) in
                
                do {
                    for i in 0..<10 {
                        try db.executeUpdate("INSERT INTO Userxx (name, age) VALUES (?,?)",
                                             values: ["Taylor", i])
                    }
                    print("插入成功!")
                } catch {
                    print("插入失败，进行回滚！")
                    rollback.pointee = true
                }
            }
        }
    }
}

