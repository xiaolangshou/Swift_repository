//
//  ViewController.swift
//  NotificationDemo
//
//  Created by Thomas Lau on 2018/5/24.
//  Copyright © 2018年 Thomas Lau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var callBack: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton()
        btn.backgroundColor = UIColor.red
        btn.frame = CGRect.init(x: 50, y: 300, width: 40, height: 25)
        btn.addTarget(self, action: #selector(transData), for: .touchUpInside)
        view.addSubview(btn)
    }
    
    @objc func transData() {
    
        callBack?()
        
        let vc2 = ViewController2()
        navigationController?.pushViewController(vc2, animated: true)
    }

}

