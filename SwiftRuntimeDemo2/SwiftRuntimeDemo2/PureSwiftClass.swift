//
//  PureSwiftClass.swift
//  SwiftRuntimeDemo2
//
//  Created by Thomas Lau on 2020/9/8.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import Foundation

class PureSwiftClass {
    
    @objc var bolValue: Bool = false
    @objc var age: Int = 0
    @objc var height: Float = 0
    @objc var name: String?
    @objc var exName: String?
    @objc func testPureAction() {
        print("pureSwiftClass.testPureAction")
    }
}

extension PureSwiftClass {
    
    @objc func swizzle_testPureAction() {
        swizzle_testPureAction()
        print("swizzle_testPureAction")
    }
}

extension PureSwiftClass: SelfAware {
    static func awake() {
        self.takeOnceTime
    }
    
    private static let takeOnceTime: Void = {
        
        let originalSelector = #selector(testPureAction)
        let swizzledSelector = #selector(swizzle_testPureAction)
        swizzlingForClass(PureSwiftClass.self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
    }()
}
