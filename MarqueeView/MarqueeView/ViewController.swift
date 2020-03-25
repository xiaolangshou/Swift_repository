//
//  ViewController.swift
//  MarqueeView
//
//  Created by Thomas Lau on 2018/6/1.
//  Copyright © 2018年 Thomas Lau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let v = ZQMaqueeView()
        v.content = "春花秋月何时了？往事知多少。小楼昨夜又东风，故国不堪回首月明中。"
        v.font = UIFont.systemFont(ofSize: 18)
        v.textColor = UIColor.red
        view.addSubview(v)
        v.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(20)
        }

    }

}

