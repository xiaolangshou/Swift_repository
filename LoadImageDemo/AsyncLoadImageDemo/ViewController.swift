//
//  ViewController.swift
//  AsyncLoadImageDemo
//
//  Created by Thomas Lau on 2018/6/28.
//  Copyright © 2018年 Thomas Lau. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let url1 = "https://static.arkcloudtech.com/image/webnative/topBack.png"
    let url2 = "https://static.arkcloudtech.com/image/webnative/red.png"
    let url3 = "https://static.arkcloudtech.com/image/webnative/black.png"
    let url4 = "https://static.arkcloudtech.com/image/webnative/flat.png"
    let url5 = "https://static.arkcloudtech.com/image/webnative/topBack.png"
    
    let imgView1 = UIImageView.init(frame: CGRect.init(x: 10, y: 10, width: 60, height: 60))
    let imgView2 = UIImageView.init(frame: CGRect.init(x: 80, y: 10, width: 60, height: 60))
    let imgView3 = UIImageView.init(frame: CGRect.init(x: 150, y: 10, width: 60, height: 60))
    let imgView4 = UIImageView.init(frame: CGRect.init(x: 10, y: 90, width: 60, height: 60))
    let imgView5 = UIImageView.init(frame: CGRect.init(x: 80, y: 90, width: 60, height: 60))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        view.addSubview(imgView1)
        view.addSubview(imgView2)
        view.addSubview(imgView3)
        view.addSubview(imgView4)
        view.addSubview(imgView5)
        
        let now = Date()
        let complete1: UIImageView.Complete = { [unowned self] in
            let time: TimeInterval = now.timeIntervalSince1970
            print("image1 download complete in \(self.timeStampToHHMMSS("\(time)"))")
        }
        let complete2: UIImageView.Complete = { [unowned self] in
            let time: TimeInterval = now.timeIntervalSince1970
            print("image2 download complete in \(self.timeStampToHHMMSS("\(time)"))")
        }
        let complete3: UIImageView.Complete = { [unowned self] in
            let time: TimeInterval = now.timeIntervalSince1970
            print("image3 download complete in \(self.timeStampToHHMMSS("\(time)"))")
        }
        let complete4: UIImageView.Complete = { [unowned self] in
            let time: TimeInterval = now.timeIntervalSince1970
            print("image4 download complete in \(self.timeStampToHHMMSS("\(time)"))")
        }
        let complete5: UIImageView.Complete = { [unowned self] in
            let time: TimeInterval = now.timeIntervalSince1970
            print("image5 download complete in \(self.timeStampToHHMMSS("\(time)"))")
        }
        
        imgView1.loadWebImage(imgUrl: url1, complete: complete1)
        imgView2.loadWebImage(imgUrl: url2, complete: complete2)
        imgView3.loadWebImage(imgUrl: url3, complete: complete3)
        imgView4.loadWebImage(imgUrl: url4, complete: complete4)
        imgView5.loadWebImage(imgUrl: url5, complete: complete5)
    }
    
    // 将时间戳转换为时分秒
    func timeStampToHHMMSS(_ timeStamp:String) -> String {
        let string = NSString(string: timeStamp)
        let timeSta:TimeInterval = string.doubleValue
        let dfmatter = DateFormatter()
        dfmatter.dateFormat="HH:mm:ss"
        let date = Date(timeIntervalSince1970: timeSta)
        return dfmatter.string(from: date)
    }
}

