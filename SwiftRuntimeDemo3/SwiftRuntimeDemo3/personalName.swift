//
//  personalName.swift
//  SwiftRuntimeDemo3
//
//  Created by Liu Tao on 2020/9/9.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import Foundation

extension NSObject {
    
    private struct AssociatedKeys {
        static var personName = "yf_PersonName"
    }
    
    var personName: String? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.personName) as? String
        }
        
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.personName, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
}

