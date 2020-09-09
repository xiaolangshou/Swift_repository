//
//  ViewController.swift
//  SwiftRuntimeDemo3
//
//  Created by Liu Tao on 2020/9/9.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let n = ""
        
        n.personName = "aaa"
        
        print(n.personName!)
    }
}

