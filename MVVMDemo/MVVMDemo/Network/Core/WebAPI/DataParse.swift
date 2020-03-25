//
//  DataParse.swift
//  MVVMDemo
//
//  Created by mac on 2018/11/30.
//  Copyright © 2018 Liu Tao. All rights reserved.
//

import Foundation
import SwiftyJSON

extension Data {
    
    func toModel<T: Decodable>(_ type: T.Type) -> T? {
        let decoder = JSONDecoder()
        do {
            let model = try decoder.decode(type, from: self)
            return model
        } catch {
            print(error)
            print(type)
            
            return nil
        }
    }
}

extension JSON {
    
    func toModel<T: Decodable>(_ type: T.Type) -> T? {
        let data = try? self.rawData()
        return data?.toModel(type)
    }
}

extension Encodable {
    
    func toJsonData() -> Data? {
        let jsonEncoder = JSONEncoder()
        return try? jsonEncoder.encode(self)
    }
}
