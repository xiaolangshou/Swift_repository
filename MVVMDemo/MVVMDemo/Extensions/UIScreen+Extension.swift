//
//  UIScreen+Extension.swift
//  MVVMDemo
//
//  Created by Liu Tao on 2018/12/3.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit

extension UIScreen {
    
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    
    static var navBarHeight: CGFloat {
        return (UIDevice.isPhoneX || UIDevice.isPhoneXR || UIDevice.isPhoneXMax) ? 88 : 64
    }
    
    static var tabBarHeight: CGFloat {
        return (UIDevice.isPhoneX || UIDevice.isPhoneXR || UIDevice.isPhoneXMax) ? 83 : 49
    }
    
    static let safeAreaBottomHeight = 49.cgFloat
}
