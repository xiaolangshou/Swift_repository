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
    lazy var imageView = UIImageView.init(frame: CGRect.init(x: 50, y: 200, width: 100, height: 100))
    let scrollView = UIScrollView.init(frame: CGRect.init(x: 10, y: 100, width: UIScreen.main.bounds.width - 20, height: 300))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.backgroundColor = UIColor.cyan
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.contentSize = CGSize.init(width: UIScreen.main.bounds.width - 20, height: 400)

        scrollView.addSubview(imageView)
        imageView.backgroundColor = UIColor.yellow

        self.observer()
        
        thread = Thread.init(target: self, selector:#selector(run), object: nil)
        thread?.start()
    }

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

    @objc func run() {
        
        print("后台常驻线程开启===========\(Thread.current)")
        //方法一
        RunLoop.current.add(Port.init(), forMode: RunLoop.Mode.default)
        RunLoop.current.run()
    }

    // 由于图片渲染到屏幕需要消耗较多资源，为了提高用户体验，当用户滚动tableview的时候，只在后台加载图片，但是不显示图片，当用户停下来的时候才显示图片。
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.perform(#selector(userImageView),
                     on: self.thread!,
                     with: nil,
                     waitUntilDone: false)
    }
    
    @objc func userImageView()  {
        
        // setImage只能在NSDefaultRunLoopMode 模式下使用
        
        let img1 = UIImage.init(named: "qiyerongzi")
        let img2 = UIImage.init(named: "tianxingjiangtang")
        
        DispatchQueue.main.async {
            self.imageView.image = img1
//            self.imageView.image = UIImage.init(named: "qiyerongzi")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.imageView.image = img2
//            self.imageView.image = UIImage.init(named: "tianxingjiangtang")
        }
    }
    
    
    /*
     上面的代码可以达到如下效果：
     
     用户点击屏幕，在主线程中，三秒之后显示图片
     
     但是当用户点击屏幕之后，如果此时用户又开始滚动textview，那么就算过了三秒，图片也不会显示出来，当用户停止了滚动，才会显示图片。
     
     这是因为限定了方法setImage只能在NSDefaultRunLoopMode 模式下使用。而滚动textview的时候，程序运行在tracking模式下面，所以方法setImage不会执行。
 */
}

