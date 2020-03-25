//
//  XmlModel.swift
//  XMLParseDemo
//
//  Created by Liu Tao on 2018/3/14.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit

class XmlModel: NSObject {

    var name = String()
    var type = String()
    var language = String()
    var version = String()
    var size = String()
    var thumnailUrl = String()
    var contentUrl = String()
    var model = String()

    required init(name: String
        , type: String
        , language: String
        , version: String
        , size: String
        , thumnailUrl: String
        , contentUrl: String
        , model: String)
    {

        self.name = name
        self.type = type
        self.language = language
        self.version = version
        self.size = size
        self.thumnailUrl = thumnailUrl
        self.contentUrl = contentUrl
        self.model = model
    }
}
