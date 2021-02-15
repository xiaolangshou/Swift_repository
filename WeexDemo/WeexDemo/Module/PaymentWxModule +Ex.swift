//
//  WeexModule+Ex.swift
//  WeexDemo
//
//  Created by lian shan on 2021/1/15.
//

import Foundation

extension PaymentWxModule {

    static let TAG = "PaymentWxModule"

    /// 提交数据
    /// - Parameter componentKey: 组件key值
    @objc public func submitAsync(_ componentKey: String) {
        let info = ["key": componentKey] as [String: Any]

        NotificationCenter.default.post(name: NSNotification.Name("LAPaymentWxModule.submitAsync"),
                                        object: info)
    }

    /// 提交数据
    /// - Parameter componentTag: 组件tag，只提交第一个找到的tag
    @objc public func submitAsyncByTag(_ componentTag: String) {
        let info = ["tag": componentTag] as [String: Any]

        NotificationCenter.default.post(name: NSNotification.Name("LAPaymentWxModule.submitAsync"),
                                        object: info)
    }

    @objc public func openFloatingLayer(_ url: String,
                                        params: [AnyHashable: Any],
                                        width: Int,
                                        height: Int)
    {
        let info = ["url": url,
                    "params": params,
                    "width": width,
                    "height": height] as [String: Any]
        NotificationCenter.default.post(name: NSNotification.Name("LAPaymentWxModule.openFloatingLayer"),
                                        object: info)
    }
}
