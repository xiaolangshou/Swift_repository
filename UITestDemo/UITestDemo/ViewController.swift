//
//  ViewController.swift
//  UITestDemo
//
//  Created by Thomas Lau on 2020/8/9.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let lbl = UILabel.init(frame: CGRect.init(x: 10, y: 80, width: 200, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl.text = ""
        lbl.backgroundColor = UIColor.lightGray
        view.addSubview(lbl)
    }
}

