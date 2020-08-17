//
//  ViewController.swift
//  GCDDemo
//
//  Created by Liu Tao on 2018/3/11.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let serialQueue = DispatchQueue(label: "serial", attributes: .init(rawValue: 0))
    let concurrentQueue = DispatchQueue(label: "concurrent", attributes: .concurrent)
    let mainQueue = DispatchQueue.main //主队列是GCD自带的一种特殊串行队列。放到主队列的任务都会放到放到主线程执行。
    let globalQueue = DispatchQueue.global()
    
    let imageUrl = "http://ww1.sinaimg.cn/large/85cccab3tw1esjheer9apg20dw0dz7wh.jpg"

    override func viewDidLoad() {
        super.viewDidLoad()

        // lockQuestion()
        // asyncFunc()
        // serialQsyn()
        // serialQAsyn()
        // conQsyn()
         conQAsyn()
        // dispatchBarrier()
//        groupDemo()
    }
    
    /// 单线程，同步任务：报错
    func lockQuestion() {
        mainQueue.sync {
            print("main queue")
        }
    }
    
    /// 单线程，异步任务: 1 3 2
    func asyncFunc() {
        print("1")
        mainQueue.async {
            print("2")
        }
        Thread.sleep(forTimeInterval: 3)
        print("3")
    }
    
    /// 串行队列，同步任务：依次执行
    func serialQsyn() {
        for i in 0..<10 {
            serialQueue.sync {
                sleep(arc4random()%3)
                print("\(i)")
            }
        }
    }
    
    /// 串行队列，异步任务：开新线程，依次执行
    func serialQAsyn() {
        print("current thread = \(Thread.current)")
        for i in 0..<10 {
            serialQueue.async {
                sleep(arc4random()%3)
                print(i,Thread.current)
            }
        }
    }
    
    
    /// 并发队列，同步任务：主线程依次执行
    func conQsyn() {
        for i in 0..<10 {
            globalQueue.sync {
                sleep(arc4random()%3)
                print(i, Thread.current)
            }
        }
    }
    
    /// 并发队列，异步任务：开多个线程并发执行
    func conQAsyn() {
        for i in 0..<10 {
            globalQueue.async {
                sleep(arc4random()%3)
                print(i, Thread.current)
            }
        }
    }
    
    /// 栅栏使用场景：用于读写隔离，以保证写入的时候，不被读取
    func dispatchBarrier() {
        
        struct File {
            var content = ""
        }
        
        var file = File()
        file.content = "This is a file"
        
        // let writeFileToWorkItem = DispatchWorkItem {
        let writeFileToWorkItem = DispatchWorkItem(flags: DispatchWorkItemFlags.barrier) {
            file.content = "This file has been modified."
            Thread.sleep(forTimeInterval: 1)
            print("write file")
        }
        
        let readFileWorkItem = DispatchWorkItem {
            Thread.sleep(forTimeInterval: 1)
            print("file.content=\(file.content)")
        }
        
        for _ in 0..<3 {
            concurrentQueue.async(execute: readFileWorkItem)
        }
        
        concurrentQueue.async(execute: writeFileToWorkItem)
        
        for _ in 0..<3 {
            concurrentQueue.async(execute: readFileWorkItem)
        }
    }
    
    // 等到所有的队列任务执行完毕之后再进行后续操作
    func groupDemo() {
        let group = DispatchGroup()
        print("group 任务开始执行")
        for i in 0..<10 {
            DispatchQueue.global().async(group: group) {
                sleep(arc4random()%3)
                print("任务\(i + 1)下载完成")
            }
        }

        group.notify(queue: DispatchQueue.main) {
            print("group 任务执行结束, 去更新UI")
        }
        
//        let group = DispatchGroup()
//        for i in 0...10 {
//            DispatchQueue.global().async(group: group) {
//                sleep(arc4random()%10)//休眠时间随机
//                print(i)
//            }
//        }
//        switch group.wait(timeout: DispatchTime.now()+10) {
//        case .success:
//            print("group 任务执行结束")
//        case .timedOut:
//            print("group 任务执行超时")
//        }
    }

}
