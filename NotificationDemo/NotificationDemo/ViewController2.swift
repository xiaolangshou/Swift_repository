//
//  ViewController2.swift
//  NotificationDemo
//
//  Created by Thomas Lau on 2018/5/24.
//  Copyright © 2018年 Thomas Lau. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    let vc1 = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.cyan
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateData(notify:)),
                                               name: NSNotification.Name(rawValue: "111"),
                                               object: nil)
        
        vc1.callBack = {
            NotificationCenter.default.post(name: NSNotification.Name("111"), object: "hello!")
        }
    }
    
    @objc func updateData(notify: Notification) {
        print(notify.object ?? "nil")
    }

}
