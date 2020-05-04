//
//  ViewController2.swift
//  NotificationDemo
//
//  Created by Thomas Lau on 2018/5/24.
//  Copyright © 2018年 Thomas Lau. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.cyan
        
        NotificationCenter.default.post(name: NSNotification.Name("111"), object: "gray")
    }

}
