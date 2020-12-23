//
//  ViewController.swift
//  HitTestDemo
//
//  Created by lian shan on 2020/11/30.
//

import UIKit

class ViewController: UIViewController {

    let v = UIView()
    let sw = UISwitch()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    func setupView() {

        view.addSubview(v)
        v.backgroundColor = UIColor.cyan
        v.frame = CGRect.init(x: 50, y: 100, width: 150, height: 50)

        let ges = UITapGestureRecognizer.init(target: self, action: #selector(tapGes))
        view.addGestureRecognizer(ges)

        v.addSubview(sw)
        sw.frame = CGRect.init(x: 2, y: 5, width: 60, height: 30)
        sw.addTarget(self, action: #selector(swTapped), for: UIControl.Event.valueChanged)
    }

    @objc func tapGes() {
        print(#function)

    }

    @objc func swTapped() {
        print(#function)
    }
}

