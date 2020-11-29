//
//  MacroDefinition.swift
//  DebugPrintDemo
//
//  Created by lian shan on 2020/11/26.
//

import Foundation

func DLog<T>(message: T, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line) {
    #if DEBUG
    let logStr: String = (fileName as NSString).pathComponents.last!.replacingOccurrences(of: "swift", with: "")
    print("类:\(logStr) 方法:\(methodName) 行:\(lineNumber) 数据:\(message)")
    #endif
}
