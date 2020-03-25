//
//  String+Extension.swift
//  MVVMDemo
//
//  Created by Liu Tao on 2018/12/3.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit

extension String {
    
    func nsRange(from range: Range<String.Index>) -> NSRange {
        return NSRange(range, in: self)
    }
    
    func ga_widthForComment(fontSize: CGFloat, height: CGFloat = 15) -> CGFloat {
        
        let font = UIFont.systemFont(ofSize: fontSize)
        let rect = NSString(string: self).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: height),
                                                       options: .usesLineFragmentOrigin,
                                                       attributes: [kCTFontAttributeName as NSAttributedString.Key: font],
                                                       context: nil)
        return ceil(rect.width)
    }
    
    static func getDicFromJsonStr(josnStr: String) -> NSDictionary {
        
        let jsonData: Data = josnStr.data(using: .utf8)!
        let dict = try? JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
        if dict != nil {
            return dict as! NSDictionary
        }
        return NSDictionary()
    }
}
