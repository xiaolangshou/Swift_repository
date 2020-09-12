//
//  NSObjectExtension.swift
//  SwiftRuntimeDemo3
//
//  Created by Thomas Lau on 2020/9/9.
//  Copyright © 2020 TLLTD. All rights reserved.
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
                objc_setAssociatedObject(self, &AssociatedKeys.personName, newValue as NSString?, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
}
