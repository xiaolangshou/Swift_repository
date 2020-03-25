//
//  Alert.swift
//  MVVMDemo
//
//  Created by mac on 2018/12/2.
//  Copyright © 2018 Liu Tao. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    typealias Action = () -> Void
    
    static func show(title: String, message: String? = nil, action: Action? = nil) {
        
        let alertVC = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let cancel = UIAlertAction.init(title: "默认", style: UIAlertAction.Style.cancel) { _ in
            action?()
        }
        alertVC.addAction(cancel)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertVC, animated: true, completion: nil)
    }
    
    static func show(title: String?, message: String?, ok: String, okAction: Action?) {
        
        let alertVC = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction.init(title: "取消", style: .cancel, handler: nil)
        alertVC.addAction(cancel)
        let ok = UIAlertAction.init(title: "确定", style: .destructive) { _ in
            okAction?()
        }
        alertVC.addAction(ok)
        UIApplication.shared.keyWindow?.rootViewController?.present(alertVC, animated: true, completion: nil)
    }
    
    /// Debug 环境下都会展示
    /// Release 环境下只会展示 APIError.business 错误
    static func show(title: String, error: APIError) {
        if error.needShow {
            Alert.show(title: title, message: error.showMessage)
        } else {
            #if DEBUG
            Alert.show(title: title, message: error.showMessage)
            print(error)
            #endif
        }
    }
    
}
