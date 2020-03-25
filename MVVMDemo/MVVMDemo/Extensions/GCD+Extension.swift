//
//  GCDExtension.swift
//  MVVMDemo
//
//  Created by Liu Tao on 2018/12/3.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import Foundation

extension DispatchQueue {
    
    private static var _onceToken = [String]()
    
    static func once(_ token: String, _ block: () -> Void) {
        objc_sync_enter(self)
        defer { objc_sync_exit(self) }
        
        if _onceToken.contains(token) { return }
        
        _onceToken.append(token)
        block()
    }
}
