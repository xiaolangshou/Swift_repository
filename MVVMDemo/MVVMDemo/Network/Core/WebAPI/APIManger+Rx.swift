//
//  APIManger+Rx.swift
//  MVVMDemo
//
//  Created by mac on 2018/12/1.
//  Copyright © 2018 Liu Tao. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import RxSwift

extension APIManager {
    
    typealias ResResult = (json: JSON, jsonData: Data)
    
    private static func rx_SendReq(_ path: String,
                                   method: HTTPMethod,
                                   encoding: ParameterEncoding,
                                   params: Parameters?,
                                   header: HTTPHeaders?) -> Observable<APIResult<JSON>> {
        
        return Observable.create({ (observer) -> Disposable in
            APIManager.shared.sendRequest(path,
                                          method: method,
                                          parameters: params,
                                          encoding: encoding,
                                          headers: header,
                                          callBack:
            { (resp) in
                switch resp.result {
                case .success(let data):
                    let json = JSON(data)
                    observer.onNext(APIResult.success(value: json))
//                    let success = json["success"].boolValue
//                    if success {
//                        observer.onNext(APIResult.success(value: json))
//                        break
//                    }
//                    // 业务错误
//                    var error = APIError.business(code: -1, msg: "unkown data")
//                    if let code = json["error_code"].int,
//                        let msg = json["msg"].string {
//                        error = APIError.business(code: code, msg: msg)
//                        if code == APIError.kickOut {
//                            Alert.show(title: msg)
//
//                        }
//                        observer.onNext(APIResult.fail(error: error))
//                        resp.request?.printError(error)
//                    }
                case .failure(let error):
                    self.handlerNSError(error as NSError)
                    observer.onNext(APIResult.fail(error: APIError.nerwork(error: error)))
                    resp.request?.printError(error)
                }
                observer.onCompleted()
            })
            return Disposables.create()
        })
    }
    
    static func  rx_GET(_ path: String, params: Parameters? = nil, headers: HTTPHeaders? = nil) -> Observable<APIResult<JSON>> {
        return APIManager.rx_SendReq(path,
                                     method: .get,
                                     encoding: URLEncoding.default,
                                     params: params,
                                     header: headers)
    }
    
    static func rx_POST(_ path: String, params: Parameters? = nil, headers: HTTPHeaders? = nil) -> Observable<APIResult<JSON>> {
        return APIManager.rx_SendReq(path,
                                     method: .post,
                                     encoding: JSONEncoding.default,
                                     params: params,
                                     header: headers)
    }
}

extension APIManager {
    static func handlerNSError(_ error: NSError) {
        #if DEBUG
        print(error)
        #endif
        let code = error.code
        if NSURLErrorTimedOut == code {
            Alert.show(title: "请求超时")
        }
        if NSURLErrorCannotConnectToHost == code {
            Alert.show(title: "无法连接到服务器")
        }
    }
}
