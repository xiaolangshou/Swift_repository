//
//  ViewController.swift
//  ClosureDemo
//
//  Created by Thomas Lau on 2018/4/26.
//  Copyright © 2018年 Thomas Lau. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {

    static let shared = ViewController1()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    fileprivate func setupView() {
        
        let btn = UIButton()
        btn.backgroundColor = UIColor.cyan
        btn.frame = CGRect(x: 40, y: 100, width: 100, height: 50)
        btn.setTitle("111111", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        btn.addTarget(self, action: #selector(pushToVC2(btn:)), for: .touchUpInside)
        view.addSubview(btn)
    }
    
    @objc func pushToVC2(btn: UIButton) {
        
        let vc2 = ViewController2()
        
        vc2.closure = { value in
            print("value = \(String(describing: value))")
        }

        navigationController?.pushViewController(vc2, animated: true)
    }
}

