//
//  ViewController.swift
//  KeyArchivedDemo
//
//  Created by Thomas Lau on 2020/9/14.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         Person *person = [[Person alloc] init];
         person.name = @"Thomas";
         
         NSString *temp = NSTemporaryDirectory();
         NSString *filePath = [temp stringByAppendingPathComponent:@"1.data"];
         NSLog(@"%@", filePath);
         
         // 归档
         [NSKeyedArchiver archiveRootObject:person toFile:filePath];
         */
        
        let p = Person.init(name: "Thomas",
                            id: "9999",
                            age: 28,
                            weight: 77,
                            job: "ITer")
        
        let filePath = NSTemporaryDirectory() + "11.data"
        print("filePath: \(filePath)")
        do {
            try NSKeyedArchiver.archivedData(withRootObject: p, requiringSecureCoding: true)
        } catch {
            print("error")
        }
    }


}

class Person: NSCoding {
    
    var name: String?
    var id: String?
    var age: Int?
    var weight: Float?
    var job: String?
    
    init(name: String?, id: String?, age: Int?, weight: Float?, job: String?) {
        
        self.name = name
        self.id = id
        self.age = age
        self.weight = weight
        self.job = job
    }
    
    required init?(coder: NSCoder) {
        
        self.name = coder.decodeObject(forKey: "name") as? String
        self.id = coder.decodeObject(forKey: "id") as? String
        self.age = coder.decodeObject(forKey: "age") as? Int
        self.weight = coder.decodeObject(forKey: "weight") as? Float
        self.job = coder.decodeObject(forKey: "job") as? String
    }
    
    
    func encode(with coder: NSCoder) {
        
        // 告诉系统归档的属性是哪些
        coder.encode(self.name, forKey: "name")
        coder.encode(self.id, forKey: "id")
        coder.encode(self.age, forKey: "age")
        coder.encode(self.weight, forKey: "weight")
        coder.encode(self.job, forKey: "job")
    }
}
