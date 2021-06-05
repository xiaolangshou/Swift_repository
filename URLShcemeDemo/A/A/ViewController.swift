//
//  ViewController.swift
//  A
//
//  Created by lian shan on 2021/6/2.
//

import UIKit

class ViewController: UIViewController {

    let btn = UIButton.init(frame: CGRect.init(x: 50, y: 100, width: 80, height: 80))

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(btn)
        btn.backgroundColor = UIColor.green
        btn.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
    }

    @objc func btnTapped() {

        let url = URL.init(string: "Thomas://page2")!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.openURL(url)
        } else {
            print("没有安装应用")
        }
    }

}

