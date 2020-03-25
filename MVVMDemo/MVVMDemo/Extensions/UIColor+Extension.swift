//
//  UIColor+Extension.swift
//  MVVMDemo
//
//  Created by Liu Tao on 2018/12/3.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func hex(_ rgb: UInt, _ alpha: CGFloat = 1.0) -> UIColor {
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let greed = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat((rgb & 0x0000FF)) / 255.0
        
        return UIColor.init(red: red, green: greed, blue: blue, alpha: alpha)
    }
    
    static var random: UIColor {
        
        let red = CGFloat(arc4random() % 256) / 255.0
        let green = CGFloat(arc4random() % 256) / 255.0
        let blue = CGFloat(arc4random() % 256) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    func alpha(_ value: CGFloat) -> UIColor {
        return self.withAlphaComponent(value)
    }
}
