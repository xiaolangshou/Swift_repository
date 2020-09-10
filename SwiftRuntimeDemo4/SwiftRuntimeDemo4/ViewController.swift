//
//  ViewController.swift
//  SwiftRuntimeDemo4
//
//  Created by Liu Tao on 2020/9/10.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Father.swizzle()
        let tmp = Father()
        tmp.makeMoney()
//        tmp.swizzle_makeMoney()
    }
}

