//
//  APIResult.swift
//  MVVMDemo
//
//  Created by mac on 2018/12/1.
//  Copyright © 2018 Liu Tao. All rights reserved.
//

import Foundation

enum APIResult<T> {
    case success(value: T)
    case fail(error: APIError)
    
    var isSuccess: Bool {
        return self.value != nil
    }
    
    var value: T? {
        switch self {
        case .success(value: let value):
            return value
        case .fail(_):
            return nil
        }
    }
    
    var error: APIError? {
        switch self {
        case .success(_):
            return nil
        case .fail(let error):
            return error
        }
    }
    
}
