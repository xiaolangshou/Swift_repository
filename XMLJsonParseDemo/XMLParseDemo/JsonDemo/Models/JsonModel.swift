//
//  Model.swift
//  XMLParseDemo
//
//  Created by Liu Tao on 2018/3/12.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit
import ObjectMapper

class JsonModel: Mappable {

    var message: DicModel?

    required init?(map: Map) {

        message = DicModel(map: map)

        if map.JSON["message"] == nil {
            return nil
        }
    }

    func mapping(map: Map) {
        message <- map["message"]
    }
}

class DicModel: Mappable {
    
    var name = String()
    var message = String()
    var id = Int()
    var updated_at = String()
    var message_date = String()
    var created_at = String()

    required init?(map: Map) {
        if map.JSON["name"] == nil {
            return nil
        }
        if map.JSON["message"] == nil {
            return nil
        }
        if map.JSON["id"] == nil {
            return nil
        }
        if map.JSON["updated_at"] == nil {
            return nil
        }
        if map.JSON["message_date"] == nil {
            return nil
        }
        if map.JSON["created_at"] == nil {
            return nil
        }
    }

    func mapping(map: Map) {
        name <- map["name"]
        message <- map["message"]
        id <- map["id"]
        updated_at <- map["updated_at"]
        message_date <- map["message_date"]
        created_at <- map["created_at"]
    }
}
