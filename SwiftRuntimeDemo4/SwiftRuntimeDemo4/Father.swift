//
//  Father.swift
//  SwiftRuntimeDemo4
//
//  Created by Liu Tao on 2020/9/10.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class Father: NSObject {
    @objc dynamic func makeMoney() {
       print("make money")
    }
}

extension Father {
    
    static func swizzle() {
        let originSelector = #selector(Father.makeMoney)
        let swizzleSelector = #selector(Father.swizzle_makeMoney)
        let originMethod = class_getInstanceMethod(Father.self, originSelector)
        let swizzleMethod = class_getInstanceMethod(Father.self, swizzleSelector)
        method_exchangeImplementations(originMethod!, swizzleMethod!)
    }
    
    @objc func swizzle_makeMoney() {
        print("have a rest and make money")
    }
}
