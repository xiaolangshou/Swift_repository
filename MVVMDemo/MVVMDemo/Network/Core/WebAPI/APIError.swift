
//
//  APIError.swift
//  MVVMDemo
//
//  Created by mac on 2018/11/30.
//  Copyright © 2018 Liu Tao. All rights reserved.
//

import Foundation

enum APIError: Error {
    case nerwork(error: Error)
    case business(code: Int, msg: String)
    case parseJSONFail
    case uploadFileFail(msg: String?)
    case unknow
}

extension APIError {
    /// 被踢出
    static let kickOut = 10000
}

extension APIError {
    var needShow: Bool {
        switch self {
        case .business:
            return true
        default:
            return false
        }
    }
    
    var showMessage: String {
        switch self {
        case .business(_, let msg):
            return msg
        case .parseJSONFail:
            return "json parse error"
        default: return ""
        }
    }
}
