//
//  ViewController.swift
//  RunLoop
//shui
//  Created by 邱淼 on 16/8/31.
//  Copyright © 2016年 txcap. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var thread: Thread?

    override func viewDidLoad() {
        super.viewDidLoad()

        demo1()
//        demo2()
    }

    /// 在所有UI相关的操作之前处理任务: 按钮点击之前,先执行observe方法里面的代码
    func demo1() {

        func observer()  {
            let observer = CFRunLoopObserverCreateWithHandler(kCFAllocatorDefault,
                                                              CFRunLoopActivity.allActivities.rawValue,
                                                              true,
                                                              0)
            { (observer, activity) in

                switch activity.rawValue {
                case 1:
                    print("--- 即将进入 Loop ---")
                case 2:
                    print(" 即将处理 Timer ")
                case 4:
                    print(" 即将处理 Source ")
                case 32:
                    print(" 即将进入休眠")
                case 64:
                    print("\n 刚从休眠中唤醒 ")
                case 128:
                    print("--- 即将退出Loop ---")
                default:
                    break
                }
            }

            // RunLoop 的创建是发生在第一次获取时
            CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, CFRunLoopMode.defaultMode)
        }

        let btn = UIButton()
        btn.frame = CGRect(x: 100, y: 50, width: 100, height: 100)
        btn.backgroundColor = UIColor.green
        btn.addTarget(self, action: #selector(btnclick), for: .touchUpInside)
        btn.setTitle("btn", for: .normal)
        self.view.addSubview(btn)

        observer()
    }

    @objc func btnclick() {
        print(" 点击了Btn")
    }

    /// 常驻子线程检测触屏
    /*
     a.如果没有实现添加NSPort或者NSTimer，会发现执行完run方法，线程就会消亡，后续再执行touchbegan方法无效。
     b.我们必须保证线程不消亡，才可以在后台接受事件处理
     c.RunLoop 启动前内部必须要有至少一个 Timer/Observer/Source，所以在 [runLoop run] 之前先创建了一个新的 NSMachPort 添加进去了。通常情况下，调用者需要持有这个 NSMachPort (mach_port) 并在外部线程通过这个 port 发送消息到 loop 内；但此处添加 port 只是为了让 RunLoop 不至于退出，并没有用于实际的发送消息。
     d.可以发现执行完了run方法，这个时候再点击屏幕，可以不断执行test方法，因为线程self.thread一直常驻后台，等待事件加入其中，然后执行。*/
    func demo2() {
        self.thread = Thread.init(target: self, selector:#selector(lanchRunloop), object: nil)
        self.thread?.name = "子线程1"
        self.thread?.start()
    }

    /// 子线程默认不会创建runloop，需要手动创建
    @objc func lanchRunloop() {
        print("lanchRunloop in thread: \(self.thread?.name ?? "")")
        RunLoop.current.add(Port(), forMode: RunLoop.Mode.default)
        RunLoop.current.run()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
        self.perform(#selector(test), on: self.thread ?? Thread.init(), with: nil, waitUntilDone: false)
    }

    @objc func test()  {
        print("test: \(Thread.current)")
     }

}

