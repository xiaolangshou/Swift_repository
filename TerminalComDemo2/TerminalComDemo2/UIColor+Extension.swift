//
//  UIColor+Extension.swift
//  TerminalComDemo2
//
//  Created by mac on 2019/2/15.
//  Copyright © 2019 TLLTD. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func hex(_ rgb: UInt, _ alpha: CGFloat = 1.0) -> UIColor {
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let greed = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat((rgb & 0x0000FF)) / 255.0
        
        return UIColor.init(red: red, green: greed, blue: blue, alpha: alpha)
    }
}
