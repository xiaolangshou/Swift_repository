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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn1 = UIButton()
        btn1.setTitle("vc2", for: UIControlState.normal)
        btn1.backgroundColor = UIColor.green
        btn1.frame = CGRect.init(x: 50, y: 300, width: 40, height: 25)
        btn1.addTarget(self, action: #selector(btn1Tapped), for: .touchUpInside)
        view.addSubview(btn1)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateData(notify:)),
                                               name: NSNotification.Name(rawValue: "111"),
                                               object: nil)
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(updateData2(notify:)),
//                                               name: NSNotification.Name(rawValue: "111"),
//                                               object: nil)
        
        
        
        let btn2 = UIButton()
        btn2.setTitle("vc3", for: UIControlState.normal)
        btn2.backgroundColor = UIColor.green
        btn2.frame = CGRect.init(x: 50, y: 380, width: 40, height: 25)
        btn2.addTarget(self, action: #selector(btn2Tapped), for: .touchUpInside)
        view.addSubview(btn2)
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.init("222"),
                                               object: nil,
                                               queue: OperationQueue.main)
        { [weak self] (notify) in
            print(notify.object ?? "nil")
            if notify.object as! String == "blue" {
                self?.view.backgroundColor = UIColor.blue
            }
        }
    }
    
    @objc func btn1Tapped() {
        addObserver()
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
    
    @objc func btn2Tapped() {

        let vc3 = ViewController3()
        navigationController?.pushViewController(vc3, animated: true)
    }
    
    @objc func updateData(notify: Notification) {
        print(notify.object ?? "nil")
        if notify.object as! String == "gray" {
            view.backgroundColor = UIColor.gray
        }
    }
    
//    @objc func updateData2(notify: Notification) {
//        print(notify.object ?? "nil")
//        if notify.object as! String == "gray" {
//            view.backgroundColor = UIColor.red
//        }
//    }

    @objc func changeBackColor(notify: Notification) {
        print("recieved obj: \(notify.object ?? "nil")")
        
        if notify.object as! String == "red" {
            self.view.backgroundColor = UIColor.red
        }
    }
}

