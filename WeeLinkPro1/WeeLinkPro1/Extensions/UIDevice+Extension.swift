//
//  UIDevice+iPhone.swift
//  Soccer
//
//  Created by QiuPeng on 2018/3/28.
//  Copyright © 2018年 ZiuQiuTiYu. All rights reserved.
//

import UIKit

extension UIDevice {
    static var isPhoneX: Bool {
        return UIScreen.height >= 812
    }
}

extension UIWindow {
    static var keyWindow: UIWindow? {
        return UIApplication.shared.keyWindow
    }
}



