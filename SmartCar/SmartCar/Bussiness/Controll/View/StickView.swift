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
        
        self.addSubview(frontBtn)
        frontBtn.snp.makeConstraints { (make) in
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.centerY.equalTo(self.snp.centerY).offset(-frame.height * 0.25)
            make.centerX.equalTo(self.snp.centerX).offset(-frame.width * 0.25)
        }
        frontBtn.addTarget(self, action: #selector(frontBtnTouchDown), for: .touchDown)
        frontBtn.addTarget(self, action: #selector(frontBtnTouchCancel), for: .touchUpInside)
        frontBtn.setImage(UIImage.init(named: "front"), for: UIControl.State.normal)
        frontBtn.setImage(UIImage.init(named: "front_touched"), for: UIControl.State.highlighted)
        
        self.addSubview(backBtn)
        backBtn.snp.makeConstraints { (make) in
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.centerY.equalTo(self.snp.centerY).offset(frame.height * 0.25)
            make.centerX.equalTo(self.snp.centerX).offset(-frame.width * 0.25)
        }
        backBtn.addTarget(self, action: #selector(backBtnTouchDown), for: .touchDown)
        backBtn.addTarget(self, action: #selector(backBtnTouchCancel), for: .touchUpInside)
        backBtn.setImage(UIImage.init(named: "back"), for: UIControl.State.normal)
        backBtn.setImage(UIImage.init(named: "back_touched"), for: UIControl.State.highlighted)
        
        self.addSubview(leftBtn)
        leftBtn.snp.makeConstraints { (make) in
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.centerY.equalTo(self.snp.centerY)
            make.centerX.equalTo(self.snp.centerX).offset(-frame.width * 0.375)
        }
        leftBtn.addTarget(self, action: #selector(leftBtnTouchDown), for: .touchDown)
        leftBtn.addTarget(self, action: #selector(leftBtnTouchCancel), for: .touchUpInside)
        leftBtn.setImage(UIImage.init(named: "left"), for: UIControl.State.normal)
        leftBtn.setImage(UIImage.init(named: "left_touched"), for: UIControl.State.highlighted)

        self.addSubview(rightBtn)
        rightBtn.snp.makeConstraints { (make) in
            make.width.equalTo(50)
            make.height.equalTo(50)
            make.centerY.equalTo(self.snp.centerY)
            make.centerX.equalTo(self.snp.centerX).offset(-frame.width * 0.125)
        }
        rightBtn.addTarget(self, action: #selector(rightBtnTouchDown), for: .touchDown)
        rightBtn.addTarget(self, action: #selector(rightBtnTouchCancel), for: .touchUpInside)
        rightBtn.setImage(UIImage.init(named: "right"), for: UIControl.State.normal)
        rightBtn.setImage(UIImage.init(named: "right_touched"), for: UIControl.State.highlighted)
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
