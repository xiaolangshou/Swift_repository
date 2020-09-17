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
    
    func insertPerson() {
        
        assert(name != nil, "必须要给name赋值")
        
        let sql = "INSERT INTO T_Person6 (name, age) VALUES ('\(name!),\(age));"
        
        JKSQLiteManger.shared.dbQueue?.inTransaction({ (db, rollback) in
            
            if !db.executeUpdate(sql, withArgumentsIn: []) {
                rollback.pointee = true
            } else {
                
            }
        })
    }
    
    class func loadPersons(finished: ([Person]) -> ()) {
        
        let sql = "SELECT * FROM T_Person6;"
        
        JKSQLiteManger.shared.dbQueue?.inDatabase({ (db) -> Void in
            let res = db.executeQuery(sql, withArgumentsIn: [])
            
            var models = [Person]()
            while (res?.next())! {
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
