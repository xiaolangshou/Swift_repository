//
//  UIScreen+ZQ.swift
//  Soccer
//
//  Created by QiuPeng on 2018/5/24.
//  Copyright © 2018年 追球体育. All rights reserved.
//

import Foundation
import UIKit

extension UIScreen {

    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height

    static var navBarHeight: CGFloat {
        return UIDevice.isPhoneX ? 88 : 64
    }
    static var tabBarHeight: CGFloat {
        return UIDevice.isPhoneX ? 83 : 49
    }

    static let safeAreaBottomHeight = 49.cgFloat
}

