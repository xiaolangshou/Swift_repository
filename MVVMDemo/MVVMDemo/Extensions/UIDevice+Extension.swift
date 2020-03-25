//
//  UIDevice.swift
//  MVVMDemo
//
//  Created by Liu Tao on 2018/12/3.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit

extension UIDevice {
    
    static var isPhoneX: Bool {
        return UIScreen.main.bounds.size.height == 812
    }
    
    static var isPhoneXMax: Bool {
        return UIScreen.main.bounds.size.height == 896
    }
    
    static var isPhoneXR: Bool {
        return UIScreen.main.bounds.size.width == 276
    }
    
    static let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
}

extension UIWindow {
    
    static var keyWindow: UIWindow? {
        return UIApplication.shared.keyWindow
    }
}
