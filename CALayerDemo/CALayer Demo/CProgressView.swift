//
//  CProgressView.swift
//  CALayer Demo
//
//  Created by Thomas Lau on 2018/8/7.
//  Copyright © 2018年 Thomas Lau. All rights reserved.
//

import UIKit

class CProgressView: UIView {
    
    var progress = Float(0) {
        didSet {
            progressLayer.strokeEnd = CGFloat(progress)
        }
    }
    
    var strokeColor = UIColor.hex(0xE94444) {
        didSet {
            progressLayer.strokeColor = strokeColor.cgColor
        }
    }
    
    private let progressLayer = CAShapeLayer()
    private let backgroundLayer = CAShapeLayer()
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initView()
    }
    
    private func initView() {
        backgroundLayer.fillColor = UIColor.clear.cgColor
        backgroundLayer.strokeColor = UIColor.hex(0xCECECE).cgColor
        backgroundLayer.strokeStart = 0.0
        backgroundLayer.lineWidth = 10.0
        backgroundLayer.lineCap = kCALineCapRound
        layer.addSublayer(backgroundLayer)
        
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = strokeColor.cgColor
        progressLayer.lineWidth = 10.0
        progressLayer.lineCap = kCALineCapRound
        layer.addSublayer(progressLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let bezierPath = UIBezierPath(
            arcCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2),
            radius: self.frame.size.width/2,
            startAngle: -CGFloat.pi/2,
            endAngle: CGFloat.pi*3/2, clockwise: true
        )
        
        progressLayer.path = bezierPath.cgPath
        progressLayer.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        
        backgroundLayer.path = bezierPath.cgPath
        backgroundLayer.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
    }
    
}

extension UIColor {
    
    static func hex(_ rgb: UInt,
                    _ alpha: CGFloat = 1.0) -> UIColor {
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let greed = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat((rgb & 0x0000FF)) / 255.0
        
        return UIColor.init(red: red, green: greed, blue: blue, alpha: alpha)
    }
}
