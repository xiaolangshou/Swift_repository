//
//  ViewController.swift
//  FMDB
//
//  Created by Liu Tao on 2020/9/17.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.green
        
       // insertPerson()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        loadPersons()
    }
    
    func insertPerson() {
        
        _ = Person(dict: ["name" : "mm" as AnyObject, "age": 90 as AnyObject])
    }
    
    func loadPersons() {
        
        Person.loadPersons { (models) -> () in
            print(models)
        }
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

