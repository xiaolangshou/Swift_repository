//
//  ViewController.swift
//  VCDemo
//
//  Created by lian shan on 2021/4/16.
//

import UIKit

class ViewController: UIViewController {

    let btn = UIButton.init(frame: CGRect.init(x: 20, y: 100, width: 100, height: 50))

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(btn)
        btn.backgroundColor = UIColor.cyan
        btn.addTarget(self, action: #selector(btnTapped), for: UIControl.Event.touchUpInside)
    }


    @objc func btnTapped() {
        let vc = ViewController2()
        self.present(vc, animated: true, completion: nil)
    }

}

