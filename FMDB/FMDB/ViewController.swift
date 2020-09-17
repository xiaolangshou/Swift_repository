//
//  ViewController.swift
//  FMDB
//
//  Created by Liu Tao on 2020/9/17.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var p = Person()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.green
        
        insertPerson()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        loadPersons()
        
        deletePersons()
    }
    
    func insertPerson() {
        
//        p = Person(dict: ["name" : "thomas" as AnyObject, "age": 29 as AnyObject])
        let p = Person()
        p.name = "liu tao"
        p.age = 29
        p.insertPerson()
    }
    
    func loadPersons() {
        
        Person.loadPersons { (models) -> () in
            print("\(models) \n")
        }
    }
    
    func deletePersons() {
        
        p.deletePerson()
    }

    // dic -> json
    func getJSONStringFromDictionary(dictionary: NSDictionary) -> String {
        if (!JSONSerialization.isValidJSONObject(dictionary)) {
            print("无法解析出JSONString")
            return ""
        }
        let data: NSData! = try? JSONSerialization.data(withJSONObject: dictionary, options: []) as NSData?
        let JSONString = NSString(data: data as Data, encoding: String.Encoding.utf8.rawValue)
        return JSONString! as String
    }
    
    // json -> dic
    func getDictionaryFromJSONString(jsonString: String) -> NSDictionary {
        let jsonData: Data = jsonString.data(using: .utf8)!
        
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
    }
}

