//
//  ViewController2.swift
//  ClosureDemo
//
//  Created by Thomas Lau on 2018/4/26.
//  Copyright © 2018年 Thomas Lau. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    var closure: ((Int?) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let btn = UIButton()
        btn.backgroundColor = UIColor.red
        btn.frame = CGRect.init(x: 30, y: 100, width: 50, height: 15)
        btn.addTarget(self, action: #selector(backToVC1), for: .touchUpInside)
        view.addSubview(btn)

    }
    
    @objc func backToVC1() {
        
        closure?(5)
        navigationController?.popViewController(animated: true)
    }
}
