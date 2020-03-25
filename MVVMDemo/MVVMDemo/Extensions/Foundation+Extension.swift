//
//  Foundation+Extension.swift
//  MVVMDemo
//
//  Created by Liu Tao on 2018/12/3.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import Foundation
import UIKit

extension Array where Element: Equatable {
    
    @discardableResult
    mutating func removeObj(_ obj: Element) -> Element? {
        if let index = self.index(of: obj) {
            return self.remove(at: index)
        }
        return nil
    }
}

extension Array where Element == String {
    var getReqParams: String {
        if self.isEmpty {
            return ""
        }
        var r = self.reduce("", { $0 + "\($1)-"})
        r.removeLast()
        return r
    }
}

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

extension Int {
    func dateFormat(_ str: String) -> String {
        Date.dateFormatter.dateFormat = str
        let date = Date.init(timeIntervalSince1970: self.double)
        return Date.dateFormatter.string(from: date)
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

extension CGFloat {
    func format(_ formateStr: String) -> String {
        return String.init(format: formateStr, self)
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

// MARK: String
extension String {
    subscript (i: Int) -> String {
        let index = self.index(self.startIndex, offsetBy: i)
        let s = self[index]
        return String.init(s)
    }
    
    subscript (from: Int, to: Int) -> String? {
        if to > self.count - 1 {
            return nil
        }
        if from < 0 {
            return nil
        }
        let begin = self.index(self.startIndex, offsetBy: from)
        let end = self.index(self.startIndex, offsetBy: from + to)
        let sub = self[begin...end]
        return String.init(sub)
    }
}
