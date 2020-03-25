//
//  APIManager+HTTP.swift
//  MVVMDemo
//
//  Created by mac on 2018/11/30.
//  Copyright © 2018 Liu Tao. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

extension APIManager {
    
    typealias HTTPCallback = (Bool, JSON?, APIError?) -> Void
    
    static func get(api: String,
                    params: [String: Any]? = nil,
                    headers: [String: String]? = nil,
                    reqCallback: @escaping HTTPCallback)
    {
        sendTo(api: api,
               method: .get,
               params: params,
               headers: headers,
               reqCallback: reqCallback)
    }
    
    static func post(api: String,
                     params: [String: Any]? = nil,
                     headers: [String: String]? = nil,
                     reqCallback: @escaping HTTPCallback)
    {
        sendTo(api: api,
               method: .post,
               params: params,
               headers: headers,
               reqCallback: reqCallback)
    }
    
    static func sendTo(api: String,
                       method: HTTPMethod,
                       params: Parameters?,
                       headers: HTTPHeaders?,
                       reqCallback:@escaping HTTPCallback)
    {
        let encodings: [HTTPMethod: Any] = [
            HTTPMethod.get: URLEncoding.default,
            HTTPMethod.post: JSONEncoding.default
        ]
        let encoding = encodings[method] as! ParameterEncoding
        
        let callBack = { (resp: DataResponse<Data>) in
            switch resp.result {
            case .success(let value):
                let json = JSON(value)
//                if json["success"].boolValue {
//                    reqCallback(true, json["data"], nil)
//                } else {
//                    let code = json["error_code"].intValue
//                    let msg = json["msg"].stringValue
//                    reqCallback(false, nil, APIError.business(code: code, msg: msg))
//                }
                reqCallback(true, json, nil)
            case .failure(let error):
                print(error)
            }
        }
        
        APIManager.shared.sendRequest(api,
                                      method: method,
                                      parameters: params,
                                      encoding: encoding,
                                      headers: headers,
                                      callBack: callBack)
    }
    
}
