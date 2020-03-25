//
//  ViewController.swift
//  RxSwiftDemo
//
//  Created by Thomas Lau on 2018/6/17.
//  Copyright © 2018年 Thomas Lau. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var tx: UITextField!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    fileprivate let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindUI()
        TraditionalKVO()
    }

    fileprivate func bindUI() {
        // 按钮点击事件
        btn.rx.tap.subscribe(onNext: {
            print("btn tapped")
        }).disposed(by: bag)
        // delegate事件
        scrollView.rx.contentOffset.subscribe(onNext: { offset in
            print("offset = \(offset)")
        }).disposed(by: bag)
        
        // 通知
        NotificationCenter.default.rx.notification(.UIApplicationWillEnterForeground)
            .subscribe(onNext: { _ in
                print("Application Will Enter Foreground")
            }).disposed(by: bag)
        NotificationCenter.default.rx.notification(.UIApplicationDidEnterBackground)
            .subscribe(onNext: { _ in
                print("Application Will Enter Background")
            }).disposed(by: bag)
        
        // KVO
        tx.rx.observe(String.self, "text").subscribe(onNext: { value in
            print("value = \(String(describing: value))")
        }).disposed(by: bag)
        tx.text = "asdddddddddddddd"
    }
    
    // 传统KVO
    fileprivate func TraditionalKVO() {
        
        tx.addObserver(self,
                       forKeyPath: "text",
                       options: [.initial, .new],
                       context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                               of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?,
                               context: UnsafeMutableRawPointer?)
    {
        let newValue = change?[.newKey] as? String
        print("newValue = \(String(describing: newValue))")
    }
    
    deinit {
        tx.removeObserver(self, forKeyPath: "text")
    }

}

