//
//  APIManager.swift
//  MVVMDemo
//
//  Created by Liu Tao on 2018/11/30.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import RxSwift

class APIManager {
    
    static let shared = APIManager()
    
    private let sessionManger: SessionManager
    
    typealias requestCallBack = (DataResponse<Data>) -> Void
    
    private init() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 15
        sessionManger = SessionManager.init(configuration: config)
    }
    
    func sendRequest(_ path: String,
                     method: HTTPMethod = .get,
                     parameters: Parameters? = nil,
                     encoding: ParameterEncoding = URLEncoding.default,
                     headers: HTTPHeaders? = nil,
                     callBack:@escaping requestCallBack)
    {
            let dataRequest = sessionManger.request(path,
                                            method: method,
                                            parameters: parameters,
                                            encoding: encoding,
                                            headers: headers)
            dataRequest.responseData { (data) in
                callBack(data)
            }
    }
    
}

// Debug
extension URLRequest {
    func printError(_ error: Any) {
        let url = self.url?.absoluteString ?? "no url"
        let header = self.allHTTPHeaderFields ?? [:]
        #if DEBUG
        let body = String.init(data: self.httpBody ?? Data.init(), encoding: .utf8) ?? "nil"
        let info = """
        {
        Request Info
        url:    \(url)
        header: \(header)
        body:   \(body)
        error:  \(error)
        }
        """
        print(info)
        #endif
    }
}
