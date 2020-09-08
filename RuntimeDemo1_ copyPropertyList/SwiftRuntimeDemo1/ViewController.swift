//
//  ViewController.swift
//  SwiftRuntimeDemo1
//
//  Created by Thomas Lau on 2020/9/8.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("------ objc runtime ------")
        showClsRuntime(cls: MuixSwiftClass.self)
        
        print("------ swift runtime ------")
        showClsRuntime(cls: PureSwiftClass.self)
    }
}

class PureSwiftClass {
    
    var bolValue = false
    var age = 0
    var height = Float(0)
    var name: String?
    var exName: String?
    
    func testPureAction() {
        print("PureSwiftClass.testPureAction")
    }
}

class MuixSwiftClass: UIViewController {
    
    // 添加@objc后就可以使用runtime方法
    @objc var bolValue = false
    @objc var age = 0
    @objc var height = Float(0)
    @objc var name: String?
    @objc var exName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    @objc func createSubView(view : UIView) {
        print("MuixSwiftClass.createSubView")
    }
    
    @objc func testVoidWithBool(boolValue : Bool , tempInt : Int , tempFloat : Float , str : String , obj : AnyObject) {
        print("MuixSwiftClass.testVoidWithBool")
    }
}

func showClsRuntime (cls: AnyClass)  {
    
    print("----------方法列表开始-----------")
    var methodNum: UInt32 = 0
    let methodList: UnsafeMutablePointer<objc_property_t>! = class_copyMethodList(cls, &methodNum)
    for index in 0..<numericCast(methodNum) {
        let method: Method = methodList[index]
        if let methodName: String = String(utf8String: property_getName(method)){
            print(methodName)
        }
    }
    print("----------方法列表结束-----------")
    free(methodList)
    print("----------属性列表开始-----------")
    
    var propertyNum: UInt32 = 0
    let propertyList: UnsafeMutablePointer<objc_property_t>! = class_copyPropertyList(cls, &propertyNum)
    for index in 0..<numericCast(propertyNum) {
        let property: objc_property_t = propertyList[index]
        if let proName: String = String(utf8String: property_getName(property)){
            print(proName)
        }
    }
    free(propertyList)
    print("----------属性列表结束-----------")
}
