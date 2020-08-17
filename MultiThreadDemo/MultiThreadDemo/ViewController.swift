//
//  ViewController.swift
//  MultiThreadDemo
//
//  Created by Liu Tao on 2020/2/27.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let imgUrl = "http://hangge.com/blog/images/logo.png"
    let imgUrl2 = "http://f.01ny.cn/forum/201411/03/161209n9nv013t9936qr16.jpg"
    let imgUrl3 = "http://f.01ny.cn/forum/201411/03/161209n9nv013t9936qr16.jpg"
    let imgUrl4 = "http://f.01ny.cn/forum/201411/03/161209n9nv013t9936qr16.jpg"
    let imgUrl5 = "http://f.01ny.cn/forum/201411/03/161209n9nv013t9936qr16.jpg"
    let imgUrl6 = "http://f.01ny.cn/forum/201411/03/161209n9nv013t9936qr16.jpg"
    let imgUrl7 = "http://f.01ny.cn/forum/201411/03/161209n9nv013t9936qr16.jpg"
    let imgUrl8 = "http://f.01ny.cn/forum/201411/03/161209n9nv013t9936qr16.jpg"
    
    let imageView = UIImageView(frame: CGRect(x: UIScreen.main.bounds.size.width * 0.5, y: 100, width: 100, height: 60))
    let imageView2 = UIImageView(frame: CGRect(x: UIScreen.main.bounds.size.width * 0.5, y: 160, width: 100, height: 60))
    let imageView3 = UIImageView(frame: CGRect(x: UIScreen.main.bounds.size.width * 0.5, y: 220, width: 100, height: 60))
    let imageView4 = UIImageView(frame: CGRect(x: UIScreen.main.bounds.size.width * 0.5, y: 280, width: 100, height: 60))
    let imageView5 = UIImageView(frame: CGRect(x: UIScreen.main.bounds.size.width * 0.5, y: 340, width: 100, height: 60))
    let imageView6 = UIImageView(frame: CGRect(x: UIScreen.main.bounds.size.width * 0.5, y: 400, width: 100, height: 60))
    let imageView7 = UIImageView(frame: CGRect(x: UIScreen.main.bounds.size.width * 0.5, y: 460, width: 100, height: 60))
    let imageView8 = UIImageView(frame: CGRect(x: UIScreen.main.bounds.size.width * 0.5, y: 520, width: 100, height: 60))
    
    enum ThreadMethod {
        case detachNew
        case threadInit
    }
    var tMethod = ThreadMethod.detachNew
    var img: UIImage?
    var img2: UIImage?
    var startTime: TimeInterval?
    var endTime: TimeInterval?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        threadDemo(threadMethod: ViewController.ThreadMethod.detachNew)
        operationDemo()
//       gcdDemo()
    }
    
    func setupView() {
        
        func addSubView(v: UIImageView) {
            view.addSubview(v)
            v.backgroundColor = UIColor.lightText
            v.contentMode = .scaleAspectFill
        }
        
        addSubView(v: imageView)
        addSubView(v: imageView2)
        addSubView(v: imageView3)
        addSubView(v: imageView4)
        addSubView(v: imageView5)
        addSubView(v: imageView6)
        addSubView(v: imageView7)
        addSubView(v: imageView8)
    }
    
    func threadDemo(threadMethod: ThreadMethod) {
        
        startTime = currentTimeStamp()
        tMethod = threadMethod
        if tMethod == ThreadMethod.detachNew {
            Thread.detachNewThread { [weak self] in
                let data = self?.downlaodImg(url: self?.imgUrl ?? "")
                self?.img = UIImage.init(data: data ?? Data())
                
                if self != nil {
                    self?.performSelector(onMainThread:#selector(self?.setImg), with: nil, waitUntilDone: true)
                }
                
                return
            }
        } else if tMethod == ThreadMethod.threadInit {
            let thread = Thread.init(target: self, selector: #selector(downloadImage(url:)), object: nil)
            thread.start()
        }
    }
    
    func operationDemo() {
        startTime = currentTimeStamp()
        
        let operation1 = BlockOperation.init { [weak self] in
            
            let data = self?.downlaodImg(url: self?.imgUrl ?? "")
            
            OperationQueue.main.addOperation { [weak self] in
                print("operation queue 1:")
                self?.imageView.image = UIImage.init(data: data ?? Data())
                self?.endTime = self?.currentTimeStamp()
                let t = self?.startTime?.distance(to: self?.endTime ?? 0)
                print("time consume =", t ?? 0)
            }
            return
        }
        
        let operation2 = BlockOperation.init { [weak self] in
            
            let data = self?.downlaodImg(url: self?.imgUrl2 ?? "")
            
            OperationQueue.main.addOperation { [weak self] in
                print("operation queue 2:")
                self?.imageView2.image = UIImage.init(data: data ?? Data())
                self?.endTime = self?.currentTimeStamp()
                let t = self?.startTime?.distance(to: self?.endTime ?? 0)
                print("time consume =", t ?? 0)
            }
            return
        }
        
        let operation3 = BlockOperation.init { [weak self] in
            
            let data = self?.downlaodImg(url: self?.imgUrl3 ?? "")
            
            OperationQueue.main.addOperation { [weak self] in
                print("operation queue 3:")
                self?.imageView3.image = UIImage.init(data: data ?? Data())
                self?.endTime = self?.currentTimeStamp()
                let t = self?.startTime?.distance(to: self?.endTime ?? 0)
                print("time consume =", t ?? 0)
            }
            return
        }
        
        let operation4 = BlockOperation.init { [weak self] in
            
            let data = self?.downlaodImg(url: self?.imgUrl4 ?? "")
            
            OperationQueue.main.addOperation { [weak self] in
                print("operation queue 4:")
                self?.imageView4.image = UIImage.init(data: data ?? Data())
                self?.endTime = self?.currentTimeStamp()
                let t = self?.startTime?.distance(to: self?.endTime ?? 0)
                print("time consume =", t ?? 0)
            }
            return
        }
        
        let operation5 = BlockOperation.init { [weak self] in
            
            let data = self?.downlaodImg(url: self?.imgUrl5 ?? "")
            
            OperationQueue.main.addOperation { [weak self] in
                print("operation queue 5:")
                self?.imageView5.image = UIImage.init(data: data ?? Data())
                self?.endTime = self?.currentTimeStamp()
                let t = self?.startTime?.distance(to: self?.endTime ?? 0)
                print("time consume =", t ?? 0)
            }
            return
        }
        
        let operation6 = BlockOperation.init { [weak self] in
            
            let data = self?.downlaodImg(url: self?.imgUrl6 ?? "")
            
            OperationQueue.main.addOperation { [weak self] in
                print("operation queue 6:")
                self?.imageView6.image = UIImage.init(data: data ?? Data())
                self?.endTime = self?.currentTimeStamp()
                let t = self?.startTime?.distance(to: self?.endTime ?? 0)
                print("time consume =", t ?? 0)
            }
            return
        }
        
        let operation7 = BlockOperation.init { [weak self] in
            
            let data = self?.downlaodImg(url: self?.imgUrl7 ?? "")
            
            OperationQueue.main.addOperation { [weak self] in
                print("operation queue 7:")
                self?.imageView7.image = UIImage.init(data: data ?? Data())
                self?.endTime = self?.currentTimeStamp()
                let t = self?.startTime?.distance(to: self?.endTime ?? 0)
                print("time consume =", t ?? 0)
            }
            return
        }
        
        let operation8 = BlockOperation.init { [weak self] in
            
            let data = self?.downlaodImg(url: self?.imgUrl8 ?? "")
            
            OperationQueue.main.addOperation { [weak self] in
                print("operation queue 8:")
                self?.imageView8.image = UIImage.init(data: data ?? Data())
                self?.endTime = self?.currentTimeStamp()
                let t = self?.startTime?.distance(to: self?.endTime ?? 0)
                print("time consume =", t ?? 0)
            }
            return
        }
        
        let queue = OperationQueue.init()
        queue.maxConcurrentOperationCount = 4
        queue.addOperation(operation1)
        queue.addOperation(operation2)
        queue.addOperation(operation3)
        queue.addOperation(operation4)
        queue.addOperation(operation5)
        queue.addOperation(operation6)
        queue.addOperation(operation7)
        queue.addOperation(operation8)
    }
    
    
    // gcd 下载10张图片
    func gcdDemo() {
        
        let queue0 = DispatchQueue(label: "q0", attributes: .concurrent)
        let queue1 = DispatchQueue(label: "q1", attributes: .concurrent)
        let queue2 = DispatchQueue(label: "q2", attributes: .concurrent)
        let queue3 = DispatchQueue(label: "q3", attributes: .concurrent)
        let queue4 = DispatchQueue(label: "q4", attributes: .concurrent)
        let queue5 = DispatchQueue(label: "q5", attributes: .concurrent)
        let queue6 = DispatchQueue(label: "q6", attributes: .concurrent)
        let queue7 = DispatchQueue(label: "q7", attributes: .concurrent)
        
        startTime = currentTimeStamp()
        
        queue0.async { [weak self] in
            let data = self?.downlaodImg(url: self?.imgUrl)
            DispatchQueue.main.async {
                self?.imageView.image = UIImage.init(data: data ?? Data())
                self?.endTime = self?.currentTimeStamp()
                let t = self?.startTime?.distance(to: self?.endTime ?? 0)
                print("time consume =", t ?? 0)
            }
        }
        
        queue1.async { [weak self] in
            let data = self?.downlaodImg(url: self?.imgUrl2)
            DispatchQueue.main.async {
                self?.imageView2.image = UIImage.init(data: data ?? Data())
                self?.endTime = self?.currentTimeStamp()
                let t = self?.startTime?.distance(to: self?.endTime ?? 0)
                print("time consume =", t ?? 0)
            }
        }
        
        queue2.async { [weak self] in
            let data = self?.downlaodImg(url: self?.imgUrl3)
            DispatchQueue.main.async {
                self?.imageView3.image = UIImage.init(data: data ?? Data())
                self?.endTime = self?.currentTimeStamp()
                let t = self?.startTime?.distance(to: self?.endTime ?? 0)
                print("time consume =", t ?? 0)
            }
        }
        
        queue3.async { [weak self] in
            let data = self?.downlaodImg(url: self?.imgUrl4)
            DispatchQueue.main.async {
                self?.imageView4.image = UIImage.init(data: data ?? Data())
                self?.endTime = self?.currentTimeStamp()
                let t = self?.startTime?.distance(to: self?.endTime ?? 0)
                print("time consume =", t ?? 0)
            }
        }
        
        queue4.async { [weak self] in
            let data = self?.downlaodImg(url: self?.imgUrl5)
            DispatchQueue.main.async {
                self?.imageView5.image = UIImage.init(data: data ?? Data())
                self?.endTime = self?.currentTimeStamp()
                let t = self?.startTime?.distance(to: self?.endTime ?? 0)
                print("time consume =", t ?? 0)
            }
        }
        
        queue5.async { [weak self] in
            let data = self?.downlaodImg(url: self?.imgUrl6)
            DispatchQueue.main.async {
                self?.imageView6.image = UIImage.init(data: data ?? Data())
                self?.endTime = self?.currentTimeStamp()
                let t = self?.startTime?.distance(to: self?.endTime ?? 0)
                print("time consume =", t ?? 0)
            }
        }
        
        queue6.async { [weak self] in
            let data = self?.downlaodImg(url: self?.imgUrl7)
            DispatchQueue.main.async {
                self?.imageView7.image = UIImage.init(data: data ?? Data())
                self?.endTime = self?.currentTimeStamp()
                let t = self?.startTime?.distance(to: self?.endTime ?? 0)
                print("time consume =", t ?? 0)
            }
        }
        
        queue7.async { [weak self] in
            let data = self?.downlaodImg(url: self?.imgUrl8)
            DispatchQueue.main.async {
                self?.imageView8.image = UIImage.init(data: data ?? Data())
                self?.endTime = self?.currentTimeStamp()
                let t = self?.startTime?.distance(to: self?.endTime ?? 0)
                print("time consume =", t ?? 0)
            }
        }
        
//        DispatchQueue.global().async { [weak self] in
//            let data = self?.downlaodImg(url: self?.imgUrl)
//
//            DispatchQueue.main.async { [weak self] in
//                print("gcd queue:")
//                self?.imageView.image = UIImage.init(data: data ?? Data())
//                self?.endTime = self?.currentTimeStamp()
//                let t = self?.startTime?.distance(to: self?.endTime ?? 0)
//                print("time consume =", t ?? 0)
//            }
//        }
    }
    
    
    /// program mark
    @objc func downloadImage(url: String?) {
        let data = try? Data.init(contentsOf: URL.init(string:url ?? self.imgUrl) ?? URL.init(fileURLWithPath: ""))
        print("data =", data ?? "nothing")
        
        if !Thread.current.isMainThread {
            self.img = UIImage.init(data: data ?? Data())
            self.performSelector(onMainThread: #selector(setImg), with: nil, waitUntilDone: true)
        }
    }
    
    func downlaodImg(url: String?) -> Data {
        let data = try? Data.init(contentsOf: URL.init(string:url ?? self.imgUrl) ?? URL.init(fileURLWithPath: ""))
        print("data = ", data ?? "nothing")
        return data ?? Data()
    }
    
    @objc func setImg() {
        print("nsthread queue:")
        self.imageView.image = self.img
        endTime = currentTimeStamp()
        let t = startTime?.distance(to: endTime ?? 0)
        print("time consume =", t ?? 0)
    }
    
    func currentTimeStamp() -> TimeInterval {
        let date = Date()
        // GMT时间转时间戳 没有时差，直接是系统当前时间戳
        return date.timeIntervalSince1970
    }
}

