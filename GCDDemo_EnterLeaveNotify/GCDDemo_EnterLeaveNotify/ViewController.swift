//
//  ViewController.swift
//  GCDDemo_EnterLeaveNotify
//
//  Created by Thomas Lau on 2020/5/2.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// 使用group 可以等到所有的任务都完成后再回到主线程刷新UI
        let group = DispatchGroup()
        group.enter()// enter method increase group task count
        print("开始第一个请求")
        AF.request("https://httpbin.org/get").responseJSON { (response) in
            print("接收第一个请求")
            group.leave()// leave methos decrease group task count
        }
        
        group.enter()
        print("开始第二个请求")
        AF.request("https://httpbin.org/get").responseJSON { (response) in
            print("接收第二个请求")
            group.leave()
        }
        
        group.enter()
        print("开始第三个请求")
        AF.request("https://httpbin.org/get").responseJSON { (response) in
            print("接收第三个请求")
            group.leave()
        }
        
        group.enter()
        print("开始第四个请求")
        AF.request("https://httpbin.org/get").responseJSON { (response) in
            print("接收第四个请求")
            group.leave()
        }
        
        // closure will be called when group count reaches 0
        group.notify(queue: DispatchQueue.main) {
            print("任务结束")
            // 更新UI
        }
        
        print("接着往下跑")
    }

}

