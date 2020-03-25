//
//  Data+Extension.swift
//  MVVMDemo
//
//  Created by Liu Tao on 2018/12/13.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import Foundation

extension NSDictionary {
    
    func toJsonString() -> String {
        
        if (!JSONSerialization.isValidJSONObject(self)) {
            print("无法解析出JSONString")
            return ""
        }
        let data: NSData = try! JSONSerialization.data(withJSONObject: self, options: []) as NSData
        let JSONString = NSString(data:data as Data, encoding: String.Encoding.utf8.rawValue)
        
        return JSONString! as String
    }
}
