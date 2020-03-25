//
//  DashLine.swift
//  MVVMDemo
//
//  Created by Liu Tao on 2018/12/3.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit

class DashLine: UIView {
    
    let lineView = UIView(frame: CGRect(0, 0, UIScreen.width, 1))
    let shapeLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    private func setupView() {
        
        self.addSubview(lineView)
        
        shapeLayer.bounds = lineView.bounds
        shapeLayer.position = CGPoint(x: lineView.frame.width / 2, y: lineView.frame.height / 2)
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.hex(0xF0F0F0).cgColor
        
        shapeLayer.lineWidth = 1
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPhase = 0
        shapeLayer.lineDashPattern = [NSNumber(value: 5), NSNumber(value: 10)]
        
        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: lineView.frame.width, y: 0))
        shapeLayer.path = path
        
        lineView.layer.addSublayer(shapeLayer)
    }

}
