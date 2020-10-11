//
//  ViewController.swift
//  Bbb
//
//  Created by Thomas Lau on 2020/10/11.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let btn = UIButton.init(frame: CGRect.init(x: 10, y: 80, width: 100, height: 40))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(btn)
        btn.backgroundColor = UIColor.red
        btn.setTitle("openAaa", for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(btnTapped), for: UIControl.Event.touchUpInside)
    }

    @objc func btnTapped() {
        
        let url = URL(string: "aaa://TLTech.Aaa")!
//        let url = URL(string: "https://")!
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.openURL(url)
        } else {
           print("未安装该App")
        }
    }
}

