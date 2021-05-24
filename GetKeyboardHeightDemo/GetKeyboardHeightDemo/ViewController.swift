//
//  ViewController.swift
//  GetKeyboardHeightDemo
//
//  Created by Thomas Lau on 2021/5/24.
//  Copyright © 2021 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    func setupView() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillChangeFrame(node:)),
                                               name: UIResponder.keyboardWillChangeFrameNotification,
                                               object: nil)
        
        let tf = UITextField.init(frame: CGRect.init(x: 0, y: 100, width: 100, height: 50))
        tf.backgroundColor = UIColor.cyan
        view.addSubview(tf)
    }
    
    @objc func keyboardWillChangeFrame(node: Notification) {
        
        // 2.获取键盘最终 Y值
        let endFrame = (node.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        let y = endFrame.origin.y
        
        //3计算工具栏距离底部的间距
        let margin = UIScreen.main.bounds.height - y
        print("键盘高度",margin)
    }

}

