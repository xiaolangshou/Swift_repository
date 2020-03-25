//
//  UIView+Extension.swift
//  MVVMDemo
//
//  Created by Liu Tao on 2018/12/3.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit

extension UIView {
    // subviews
    func removeAllSubviews() {
        for view in subviews {
            view.removeFromSuperview()
        }
    }
    
    @discardableResult
    func becomeSubviewIn(_ superView: UIView) -> Self {
        superView.addSubview(self)
        
        return self
    }
    
    // 圆角,边框
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.masksToBounds = newValue > 0
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor {
        set {
            layer.borderColor = newValue.cgColor
        }
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
    }
    
    // 渐变色
    func setGradientBackgroundColor(beginColor: UIColor, endColor: UIColor) {
        let layer = CAGradientLayer()
        layer.colors = [beginColor.cgColor, endColor.cgColor]
        layer.frame = self.bounds
        self.layer.insertSublayer(layer, at: 0)
    }
    
    // 设置阴影
    func setShadow(color: UIColor = .black,
                   alpha: Float = 0.5,
                   x: CGFloat = 0,
                   y: CGFloat = 0,
                   blur: CGFloat = 0)
    {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = alpha
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.shadowRadius = blur
    }
}
