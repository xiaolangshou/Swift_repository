//
//  ViewController2.swift
//  ProtocolDemo2
//
//  Created by Thomas Lau on 2020/5/4.
//  Copyright © 2020 Thomas Lau. All rights reserved.
//

import UIKit

struct Model {
    let age: Int
}

protocol TLProtocol {
    associatedtype T // 为协议中的某个变量提供占位名，其代表的实际类型在协议被使用时才会被决定
    func updateCell(_ data: T)
}

class ViewController2: UIViewController, TLProtocol {
    
    typealias T = Model

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.cyan
        
        self.updateCell(Model.init(age: 80))
    }

    func updateCell(_ data: Model) {
        print(#function)
        print(data.age)
    }
}
