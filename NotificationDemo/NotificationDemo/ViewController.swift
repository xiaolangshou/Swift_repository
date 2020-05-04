//
//  ViewController.swift
//  NotificationDemo
//
//  Created by Thomas Lau on 2018/5/24.
//  Copyright © 2018年 Thomas Lau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    static let shared = ViewController()

    let btn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        addObserver()
    }
    
    func setupView() {
        
        btn.backgroundColor = UIColor.blue
        btn.frame = CGRect.init(x: 50, y: 300, width: 40, height: 25)
        btn.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        view.addSubview(btn)
    }
    
    func addObserver() {
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeBackColor(notify:)),
                                               name: NSNotification.Name.init("111"),
                                               object: nil)
    }
    
    @objc func btnTapped() {

        let vc2 = ViewController2()
        navigationController?.pushViewController(vc2, animated: true)
    }

    @objc func changeBackColor(notify: Notification) {
        print("recieved obj: \(notify.object ?? "nil")")
        
        if notify.object as! String == "red" {
            self.view.backgroundColor = UIColor.red
        }
    }
}

