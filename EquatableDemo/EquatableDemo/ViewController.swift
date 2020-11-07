//
//  ViewController.swift
//  EquatableDemo
//
//  Created by Thomas Lau on 2020/11/7.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let t = Thomas.init(name: "Li Tao", age: 29, weight: 80)
        let h = Thomas.init(name: "Liu Tao", age: 29, weight: 80)
        
        print(t == h)
        print(t != h)
    }

}


// Equatable 让2个对象用==比较
class Thomas: Equatable {
    
    var name: String?
    var age: Int?
    var weight: Int?
    
    init(name: String?, age: Int?, weight: Int?) {
        
        self.name = name
        self.age = age
        self.weight = age
    }
    
    static func == (lhs: Thomas, rhs: Thomas) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age && lhs.weight == rhs.weight
    }
}
