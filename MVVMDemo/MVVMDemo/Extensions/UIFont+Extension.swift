//
//  UIFont+Extension.swift
//  MVVMDemo
//
//  Created by Liu Tao on 2018/12/17.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func MILanTing(_ size: CGFloat) -> UIFont {
        
        return UIFont(name: "MILanTing_GB", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func Kmedium(_ size: CGFloat) -> UIFont {
        
        return UIFont(name: "Kmedium", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
