//
//  ViewController.swift
//  ScrollViewDemo
//
//  Created by Liu Tao on 2018/3/11.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let v = vvv()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(v)
        v.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.height.equalTo(250)
            make.left.equalTo(10)
            make.right.equalTo(-10)
        }
        v.count = 5
    }



}

