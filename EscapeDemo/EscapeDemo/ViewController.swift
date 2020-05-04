//
//  ViewController.swift
//  EscapeDemo
//
//  Created by Thomas Lau on 2018/6/20.
//  Copyright © 2018年 Thomas Lau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    typealias CallBack = (String) -> Void
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// method 1
//        getData { (p) in
//            let now = Date()
//            let time: TimeInterval = now.timeIntervalSince1970
//            print("endTime1: \(time)")
//        }
        
        /// method 2
        let callback: CallBack = { p in
            let now = Date()
            let time: TimeInterval = now.timeIntervalSince1970
            print("endTime2: \(time)")
        }
        getData(completion: callback)
    }
    
    // 逃逸闭包: 当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行
    // 因为函数体返回之后才会获取到需要的数据，这时候才能数据通过闭包传给外部变量，否则传不出数据
    func getData(completion: @escaping CallBack) {
        
        let urlStr = "https://static.arkcloudtech.com/image/webnative/topBack.png"
        let now = Date()
        let time: TimeInterval = now.timeIntervalSince1970
        print("startTime: \(time)")
        if let url = URL(string: urlStr) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                print("data = \(String(describing: data))")
                let str = String(data: data!, encoding: String.Encoding.utf8)
                if let error = error {
                    print("error = \(error)")
                    return
                }
                completion(str ?? "")
            }
            let time2: TimeInterval = now.timeIntervalSince1970
            print("middleTime: \(time2)")
            task.resume()
        }
    }
    
    func timeStampToHHMMSS(_ timeStamp:String) -> String {
        
        let string = NSString(string: timeStamp)
        let timeSta:TimeInterval = string.doubleValue
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="HH:mm:ss"
        let date = Date(timeIntervalSince1970: timeSta)
        return dfmatter.string(from: date)
    }
}

