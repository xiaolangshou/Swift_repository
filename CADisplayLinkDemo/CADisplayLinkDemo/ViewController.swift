//
//  ViewController.swift
//  CADisplayLinkDemo
//
//  Created by Thomas Lau on 2021/5/30.
//  Copyright © 2021 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var displayLink: CADisplayLink?
    var count: Double = 0
    var lastTime: CFTimeInterval = 0
    let lbl = UILabel.init(frame: CGRect.init(x: 20, y: 100, width: 200, height: 50))
    let btn = UIButton.init(frame: CGRect.init(x: 20, y: 200, width: 50, height: 60))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCADisplayLink()
        setupView()
    }

    func setupView() {
        view.addSubview(lbl)
        lbl.backgroundColor = UIColor.lightGray
        
        view.addSubview(btn)
        btn.backgroundColor = UIColor.cyan
        btn.setTitle("stop", for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(stopBtnTapped), for: UIControl.Event.touchUpInside)
    }
    
    @objc func stopBtnTapped() {
        displayLink?.invalidate()
        displayLink = nil
    }

    func setupCADisplayLink() {
        displayLink = CADisplayLink.init(target: self, selector: #selector(refresh))
        displayLink?.preferredFramesPerSecond = 30
        displayLink?.add(to: RunLoop.current, forMode: RunLoop.Mode.common)
    }
    
    // 每当屏幕刷新结束时，runloop会向target发送一次refresh消息
    @objc func refresh() {
        print(#function)
        
        if lastTime == 0 {
            lastTime = displayLink!.timestamp
            return
        }
        
        count += 1
        
        let delta = displayLink!.timestamp - lastTime
        if delta < 1 { return }
        lastTime = displayLink!.timestamp
        let fps = count / delta
        count = 0
        
        //根据FPS调整字体颜色
        let progress = fps / 60.0
        print("progress = \(progress)")
        let color = UIColor.init(hue: CGFloat(0.27 * (progress - 0.2)), saturation: 1, brightness: 9.0, alpha: 1)
        lbl.textColor = color
        let txt = NSMutableAttributedString.init(string: "\(round(fps)) FPS")
        lbl.attributedText = txt
    }

}

