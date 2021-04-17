//
//  ViewController.swift
//  NavDemo
//
//  Created by lian shan on 2021/4/1.
//

import UIKit

class ViewController: UIViewController {

    let btn = UIButton.init(frame: CGRect.init(x: 20, y: 90, width: 100, height: 50))

    deinit {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.cyan
        view.addSubview(btn)
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(btnTapped), for: UIControl.Event.touchUpInside)
    }


    @objc func btnTapped() {

        let vc = ViewController2()
//        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)

    }
}

