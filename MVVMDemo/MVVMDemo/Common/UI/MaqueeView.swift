//
//  MaqueeView.swift
//  MVVMDemo
//
//  Created by mac on 2018/12/3.
//  Copyright © 2018 Liu Tao. All rights reserved.
//

import UIKit
import SnapKit

class MaqueeView: UIView {
    
    var content = "" {
        didSet {
            //移除之前所有的动画
            labelll.layer.removeAllAnimations()
            
            labelll.text = content
            theAnimations()
        }
    }
    
    var font = UIFont() {
        didSet {
            labelll.font = font
        }
    }
    
    var textColor = UIColor() {
        didSet {
            labelll.textColor = textColor
        }
    }
    
    private let labelll = UILabel()
    private let backgroundView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    fileprivate func setupView() {
        
        backgroundView.clipsToBounds = true
        backgroundView.backgroundColor = UIColor.clear
        self.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        theAnimations()
    }
    
    fileprivate func theAnimations() {
        
        labelll.removeFromSuperview()
        labelll.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        labelll.sizeToFit()
        backgroundView.addSubview(labelll)
        //开始动画
        UIView.beginAnimations("Marquee", context: nil)
        UIView.setAnimationDuration(10.0)
        UIView.setAnimationCurve(.linear)
        UIView.setAnimationRepeatAutoreverses(true)
        UIView.setAnimationRepeatCount(100)
        
        var frame = labelll.frame
        frame.origin.x = -frame.size.width
        labelll.frame = frame
        
        //与begin对应,结束动画
        UIView.commitAnimations()
    }

}
