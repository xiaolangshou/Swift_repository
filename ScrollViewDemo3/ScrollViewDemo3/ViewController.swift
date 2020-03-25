//
//  ViewController.swift
//  ScrollViewDemo3
//
//  Created by Thomas Lau on 2018/6/22.
//  Copyright © 2018年 Thomas Lau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let sView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSView()
    }

    func setupSView() {
        
        view.addSubview(sView)
        sView.backgroundColor = UIColor.cyan
        sView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 70)
        sView.contentSize = CGSize.init(width: UIScreen.main.bounds.width + 100, height: 70)
    }

}

