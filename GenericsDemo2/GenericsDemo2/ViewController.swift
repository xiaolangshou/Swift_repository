//
//  ViewController.swift
//  GenericsDemo2
//
//  Created by Thomas Lau on 2020/9/26.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = Mall<Fruits>.init()
        _ = Mall<Meats>()
        _ = Mall<Vegetables>()
    }
}

class Mall<T> {
    private var stock: [T] = []
    
    func buy(_ product: T) {
        stock.append(product)
    }
    
    func sell() -> T? {
        let res = stock.last
        stock.removeLast()
        return res
    }
}

enum Fruits {
    case apple
    case banana
    case pear
    case orange
}

protocol Meats {}

class Vegetables {}
