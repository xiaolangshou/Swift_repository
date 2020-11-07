//
//  ViewController.swift
//  PlistToVCDemo
//
//  Created by Thomas Lau on 2020/10/31.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let targetClassName = "target_vc1"
  
        // 字符串转类
        let TargetClass: AnyClass? = NSClassFromString(targetClassName)
        
        // 所有控制器都继承自UIViewControler用他来接收,并创建对应目标控制器类型
        let destVc = TargetClass?.init() as? UIViewController

    }
}

