//
//  Person.swift
//  FMDB
//
//  Created by Liu Tao on 2020/9/17.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class Person: NSObject {

    @objc var id: Int32 = 0
    @objc var name: String?
    @objc var age: Int32 = 0
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    override init() {
        super.init()
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        print("\(key)")
    }
    
    override var description: String {
        
        return "id = \(id), age = \(age), name = \(name!)"
    }
    
    // MARK: 执行数据源 CRUD的操作
    /**
     插入一条数据
     */
    func insertPerson() {
        
        assert(name != nil, "必须要给name赋值")
        
        // 1、编写SQLite语句
        let sql = "INSERT INTO T_Person6 (name,age) VALUES ('\(name!)',\(age));"
        // 2、执行SQLite语句
        /** 只要在inTransaction闭包中执行的语句都是已经开启的事务
            第一个参数：已经打开了的数据库对象
            第二个参数：用于是否需要回滚数据
         */
        JKSQLiteManger.shared.dbQueue?.inTransaction({ (db, rollback) in

            // 如果插入数据失败就回滚
            /*
               OC中的写法   ：*rollback = YES
               Swift中的写法：rollback.pointee = true (rollback.memory = true 废弃)
             */
            if !db.executeUpdate(sql, withArgumentsIn: [])
            {
                 rollback.pointee = true
            } else {
                print("insert success")
            }
            
        })
    }
    
    // 删除一条数据
    func deletePerson() {
        
       // assert(name != nil, "必须要给name赋值")
        
        let sql = "DELETE FROM T_Person6 WHERE age = \(self.age);"
        
        JKSQLiteManger.shared.dbQueue?.inTransaction({ (db, rollback) in
            
            if !db.executeUpdate(sql, withArgumentsIn: []) {
                rollback.pointee = true
            } else {
                print("delete success")
            }
        })
    }
    
    // MARK: - 执行数据源CRUD的操作
    class func loadPersons(finished: ([Person])->())
    {
        let sql = "SELECT * FROM T_Person6;"
        
        JKSQLiteManger.shared.dbQueue?.inDatabase({ (db) -> Void in
            
            let res = db.executeQuery(sql, withArgumentsIn: [])
            
            // next取出一行数据
            var models = [Person]()
            while (res?.next())!
            {
                let p = Person()
                p.id = (res?.int(forColumn: "id"))!
                p.name = res?.string(forColumn: "name")
                p.age = (res?.int(forColumn: "age"))!
                models.append(p)
            }
            
            finished(models)
        })
        
    }
}
