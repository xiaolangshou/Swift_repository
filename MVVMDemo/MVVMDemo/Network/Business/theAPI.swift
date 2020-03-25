//
//  Model1.swift
//  MVVMDemo
//
//  Created by mac on 2018/11/30.
//  Copyright © 2018 Liu Tao. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class theAPI {
    
//    static func GetAliInfo(_ callback: @escaping (AliModel) -> Void) {
//
//        let api = "http://gc.ditu.aliyun.com/geocoding"
//        let param: [String: Any] = ["a": "苏州市"]
//
//        APIManager.get(api: api, params: param) { (ok, json, error) in
//            if let model = json?.toModel(AliModel.self) {
//                callback(model)
//            }
//        }
//    }
    
    static func getAliInfo(cityName: String) -> Observable<APIResult<AliModel>> {
        
        let api = "http://gc.ditu.aliyun.com/geocoding"
        let param: [String: Any] = ["a": cityName]
        
        return APIManager.rx_GET(api, params: param).map({ (result) -> APIResult<AliModel> in
            switch result {
            case .success(let value):
                if let model = value.toModel(AliModel.self) {
                    return APIResult.success(value: model)
                }
                return APIResult.fail(error: APIError.parseJSONFail)
            case .fail(error: let error):
                return APIResult.fail(error: error)
            }
        })
    }
}
