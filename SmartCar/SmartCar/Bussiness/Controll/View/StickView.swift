//
//  StickView.swift
//  SmartCar
//
//  Created by Thomas Lau on 2020/7/18.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit
import SnapKit

class StickView: UIView {
    
    var frontBtnTouchdown: (() -> (Void))?
    var frontBtnTouchcancel: (() -> (Void))?
    
    var backBtnTouchdown: (() -> (Void))?
    var backBtnTouchcancel: (() -> (Void))?
    
    var leftBtnTouchdown: (() -> (Void))?
    var leftBtnTouchcancel: (() -> (Void))?
    
    var rightBtnTouchdown: (() -> (Void))?
    var rightBtnTouchcancel: (() -> (Void))?
    
    var frontBtn = UIButton()
    var backBtn = UIButton()
    var leftBtn = UIButton()
    var rightBtn = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        fatalError("init error")
    }
    
    func setupView(frame: CGRect) {
        
        self.backgroundColor = UIColor.clear
        
        frontBtn.backgroundColor = UIColor.cyan
        frontBtn.setTitle("FRONT", for: UIControl.State.normal)
        self.addSubview(frontBtn)
        frontBtn.snp.makeConstraints { (make) in
            make.width.equalTo(50)
            make.height.equalTo(120)
            make.centerY.equalTo(self.snp.centerY).offset(-frame.height * 0.25)
            make.centerX.equalTo(self.snp.centerX).offset(-frame.width * 0.25)
        }
        frontBtn.addTarget(self, action: #selector(frontBtnTouchDown), for: .touchDown)
        frontBtn.addTarget(self, action: #selector(frontBtnTouchCancel), for: .touchUpInside)
        
        backBtn.backgroundColor = UIColor.cyan
        backBtn.setTitle("BACK", for: UIControl.State.normal)
        self.addSubview(backBtn)
        backBtn.snp.makeConstraints { (make) in
            make.width.equalTo(50)
            make.height.equalTo(120)
            make.centerY.equalTo(self.snp.centerY).offset(frame.height * 0.25)
            make.centerX.equalTo(self.snp.centerX).offset(-frame.width * 0.25)
        }
        backBtn.addTarget(self, action: #selector(backBtnTouchDown), for: .touchDown)
        backBtn.addTarget(self, action: #selector(backBtnTouchCancel), for: .touchUpInside)
        
        leftBtn.setTitle("LEFT", for: UIControl.State.normal)
        leftBtn.backgroundColor = UIColor.cyan
        self.addSubview(leftBtn)
        leftBtn.snp.makeConstraints { (make) in
            make.width.equalTo(120)
            make.height.equalTo(50)
            make.centerY.equalTo(self.snp.centerY)
            make.centerX.equalTo(self.snp.centerX).offset(-frame.width * 0.375)
        }
        leftBtn.addTarget(self, action: #selector(leftBtnTouchDown), for: .touchDown)
        leftBtn.addTarget(self, action: #selector(leftBtnTouchCancel), for: .touchUpInside)
        
        rightBtn.setTitle("RIGHT", for: UIControl.State.normal)
        rightBtn.backgroundColor = UIColor.cyan
        self.addSubview(rightBtn)
        rightBtn.snp.makeConstraints { (make) in
            make.width.equalTo(120)
            make.height.equalTo(50)
            make.centerY.equalTo(self.snp.centerY)
            make.centerX.equalTo(self.snp.centerX).offset(-frame.width * 0.125)
        }
        rightBtn.addTarget(self, action: #selector(rightBtnTouchDown), for: .touchDown)
        rightBtn.addTarget(self, action: #selector(rightBtnTouchCancel), for: .touchUpInside)
    }

    @objc func frontBtnTouchDown() {
        frontBtnTouchdown!()
    }
    
    @objc func frontBtnTouchCancel() {
        frontBtnTouchcancel!()
    }
    
    @objc func backBtnTouchDown() {
        backBtnTouchdown!()
    }
    
    @objc func backBtnTouchCancel() {
        frontBtnTouchcancel!()
    }
    
    @objc func leftBtnTouchDown() {
        leftBtnTouchdown!()
    }
    
    @objc func leftBtnTouchCancel() {
        leftBtnTouchcancel!()
    }
    
    @objc func rightBtnTouchDown() {
        rightBtnTouchdown!()
    }
    
    @objc func rightBtnTouchCancel() {
        rightBtnTouchcancel!()
    }
}
