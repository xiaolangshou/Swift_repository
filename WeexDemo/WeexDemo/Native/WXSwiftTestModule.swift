//
//  WXSwiftTestModule.swift
//  WeexDemo
//
//  Created by lian shan on 2021/1/8.
//

import Foundation
import WeexSDK

public class WXSwiftTestModule {

}

public extension WXSwiftTestModule {

    @objc(printSome:callback:)
    func printSome(someThing: String, callback: WXModuleCallback) {
        print(someThing)
        // someThing：回调给JS的数据
        callback(someThing)
    }
}
