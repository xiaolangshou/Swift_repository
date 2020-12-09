//
//  ViewController.swift
//  StackViewDemo
//
//  Created by Thomas Lau on 2020/12/9.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stack = UIStackView.init(frame: CGRect.init(x: 20, y: 30, width: 100, height: 500))
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 30
        view.addSubview(stack)
        
        let v1 = UIView.init()
        v1.backgroundColor = UIColor.cyan
        
        let v2 = UIView.init()
        v2.backgroundColor = UIColor.cyan
        
        stack.addArrangedSubview(v1)
        stack.addArrangedSubview(v2)
    }


}

