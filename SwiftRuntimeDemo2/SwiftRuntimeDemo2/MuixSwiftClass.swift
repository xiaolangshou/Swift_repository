//
//  MuixSwiftClass.swift
//  SwiftRuntimeDemo2
//
//  Created by Thomas Lau on 2020/9/8.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class MuixSwiftClass: UIViewController {
    
    @objc var bolValue: Bool = false
    @objc var age: Int = 0
    @objc var height: Float = 0
    @objc var name: String?
    @objc var exName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @objc func createSubView(view: UIView) {
        print("MuixSwiftClass.createSubView")
    }
    
    @objc func testVoidWithBool(boolValue: Bool, tempInt: Int, tempFloat: Float, str: String, obj: AnyObject) {
        print("MuixSwiftClass.testVoidWithBool")
    }
}

extension MuixSwiftClass {
    
    @objc func swizzle_viewWillAppear(_ animated: Bool) {
        swizzle_viewWillAppear(animated)
        print("swizzle_viewWillAppear")
    }
}

extension MuixSwiftClass: SelfAware {
    
    static func awake() {
        takeOnceTime
    }
    
    private static let takeOnceTime: Void = {
        
        let originalSelector = #selector(viewWillAppear(_:))
        let swizzleSelector = #selector(swizzle_viewWillAppear(_:))
        swizzlingForClass(MuixSwiftClass.self,
                          originalSelector: originalSelector,
                          swizzledSelector: swizzleSelector)
    }()
}
