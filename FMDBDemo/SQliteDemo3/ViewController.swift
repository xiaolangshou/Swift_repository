//
//  ViewController.swift
//  SQliteDemo3
//
//  Created by Liu Tao on 2018/11/28.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit
import SnapKit
import FMDB

class ViewController: UIViewController {

    let btn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn.backgroundColor = UIColor.cyan
        btn.setTitle("check", for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(btnTapped), for: UIControl.Event.touchUpInside)
        view.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(50)
            make.height.equalTo(25)
        }
        
        // add
        DB.insert(log: FeedLog(id: "Thomas",
                               count: 2,
                               type: 1,
                               remark: "remark",
                               logTime: Date(),
                               logDay: "11/24"))
        DB.insert(log: FeedLog(id: "Candice",
                               count: 3,
                               type: 6,
                               remark: "99",
                               logTime: Date(),
                               logDay: "11/16"))
        
        // update
        DB.update(log: FeedLog(id: "Thomas",
                               count: 11,
                               type: 222,
                               remark: "000",
                               logTime: Date.init(timeIntervalSinceNow: TimeInterval.init()),
                               logDay: "222"))
        
        // delete
        //DB.remove(id: "Candice")
    }

    @objc func btnTapped() {
        
        let feedLog = DB.select(id: "ll")
        
        if let feedLog = feedLog {
            print("\(feedLog.id), \(feedLog.logDay), \(feedLog.logTime), \(feedLog.count), \(feedLog.type), \(feedLog.remark)")
        }
    }

}

