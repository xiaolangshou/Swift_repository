//
//  ViewController2.swift
//  NavDemo
//
//  Created by lian shan on 2021/4/1.
//

import UIKit

class ViewController2: UIViewController {

    let btn = UIButton.init(frame: CGRect.init(x: 90, y: 100, width: 200, height: 50))

    deinit {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.yellow
        view.addSubview(btn)
        btn.backgroundColor = UIColor.gray
        btn.addTarget(self, action: #selector(btnTapped), for: UIControl.Event.touchUpInside)
       
    }

    @objc func btnTapped() {
        self.dismiss(animated: true, completion: {
            print(self)
        })
    }
}
