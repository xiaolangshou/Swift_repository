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
    
    var frontBtnTap: (() -> (Void))?
    var backBtnTap: (() -> (Void))?
    var leftBtnTap: (() -> (Void))?
    var rightBtnTap: (() -> (Void))?
    
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
        frontBtn.addTarget(self, action: #selector(frontBtnTapped), for: .touchUpInside)
        
        backBtn.backgroundColor = UIColor.cyan
        backBtn.setTitle("BACK", for: UIControl.State.normal)
        self.addSubview(backBtn)
        backBtn.snp.makeConstraints { (make) in
            make.width.equalTo(50)
            make.height.equalTo(120)
            make.centerY.equalTo(self.snp.centerY).offset(frame.height * 0.25)
            make.centerX.equalTo(self.snp.centerX).offset(-frame.width * 0.25)
        }
        backBtn.addTarget(self, action: #selector(backBtnTapped), for: .touchUpInside)
        
        leftBtn.setTitle("LEFT", for: UIControl.State.normal)
        leftBtn.backgroundColor = UIColor.cyan
        self.addSubview(leftBtn)
        leftBtn.snp.makeConstraints { (make) in
            make.width.equalTo(120)
            make.height.equalTo(50)
            make.centerY.equalTo(self.snp.centerY)
            make.centerX.equalTo(self.snp.centerX).offset(-frame.width * 0.375)
        }
        leftBtn.addTarget(self, action: #selector(leftBtnTapped), for: .touchUpInside)
        
        rightBtn.setTitle("RIGHT", for: UIControl.State.normal)
        rightBtn.backgroundColor = UIColor.cyan
        self.addSubview(rightBtn)
        rightBtn.snp.makeConstraints { (make) in
            make.width.equalTo(120)
            make.height.equalTo(50)
            make.centerY.equalTo(self.snp.centerY)
            make.centerX.equalTo(self.snp.centerX).offset(-frame.width * 0.125)
        }
        rightBtn.addTarget(self, action: #selector(rightBtnTapped), for: .touchUpInside)
    }

    @objc func frontBtnTapped() {
        frontBtnTap!()
    }
    
    @objc func backBtnTapped() {
        backBtnTap!()
    }
    
    @objc func leftBtnTapped() {
        leftBtnTap!()
    }
    
    @objc func rightBtnTapped() {
        rightBtnTap!()
    }
}
