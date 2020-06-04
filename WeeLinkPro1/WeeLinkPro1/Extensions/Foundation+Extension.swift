//
//  Foundation+Extension.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/5/18.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

// MARK: Int
extension Int {
    
    var cgFloat: CGFloat {
        return CGFloat(self)
        
    }
    var double: Double {
        return self.cgFloat.double
    }
    var string: String {
        return String(self)
    }

    var random: Int {
        return Int(arc4random())
    }

    static func random(max: Int, min: Int = 0) -> Int {
        if max < min {
            return 0
        }
        return min + Int(arc4random_uniform(UInt32(max - min)))
    }
}

// MARK: CGFloat
extension CGFloat {
    
    var int: Int {
        if self.isNaN {
            return 0
        }
        return Int(self)
    }
    var double: Double {
        return Double(self)
    }
    var string: String {
        return String(self.double)
    }
}

// MARK: Double
extension Double {
    
    var cgFloat: CGFloat {
        return CGFloat(self)
    }
    var int: Int {
        return Int(self)
    }
    var string: String {
        return String(self)
    }
    func format(_ formateStr: String) -> String {
        return String.init(format: formateStr, self)
    }
}
