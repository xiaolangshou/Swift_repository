//
//  ViewController3.swift
//  NotificationDemo
//
//  Created by Liu Tao on 2020/5/3.
//  Copyright © 2020 Thomas Lau. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.post(name: NSNotification.Name("222"), object: "blue")
    }
}
