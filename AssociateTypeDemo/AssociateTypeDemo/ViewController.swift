//
//  ViewController.swift
//  AssociateTypeDemo
//
//  Created by Liu Tao on 2020/3/12.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

// 关联类型为协议中的某个类型提供了一个占位名（或者说别名），其代表的实际类型在协议被采纳时才会被指定
protocol pro1 {
    associatedtype T
    func updateCell(_ data: T)
}

struct Model {
    let age: Int
}

class ViewController: UIViewController, pro1 {
    
    func updateCell(_ data: Model) {
        print("updateCell...")
    }
    
    typealias T = Model

    func min<T: Comparable>(_ x: T, _ y: T) -> T {
        return y < x ? y : x
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(min(10, 5))
        updateCell(Model.init(age: 29))
    }
}
