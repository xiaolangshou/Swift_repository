//
//  XmlViewModel.swift
//  XMLParseDemo
//
//  Created by Liu Tao on 2018/3/15.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit
import RxSwift
import Alamofire
import SwiftyXMLParser

class XmlViewModel: NSObject {

    // var updateTableView: (() -> Void)?

    var _resultArray = Variable([XmlModel]())

    fileprivate let _xmlStr = "http://www.nineeagle.com/product/NE_user_center.xml"
    fileprivate var _url: URL? = nil

    override init() {
        super.init()

        parsingXmlUsingAlamofire()
    }

    fileprivate func parsingXmlUsingAlamofire() {
        _url = URL(string: _xmlStr)
        Alamofire.request(_url!).responseData {[weak self] (response) in
            guard let this = self else { return }
            if let data = response.data {
                let xml = XML.parse(data)

                for element in xml["center", "file"] {
                    if let name = element["name"].text
                        , let type = element["type"].text
                        , let language = element["language"].text
                        , let version = element["version"].text
                        , let size = element["size"].text
                        , let thumnailUrl = element["thumnailUrl"].text
                        , let contentUrl = element["contentUrl"].text
                        , let model = element["model"].text
                    {
                        let model = XmlModel(name: name
                            , type: type
                            , language: language
                            , version: version
                            , size: size
                            , thumnailUrl: thumnailUrl
                            , contentUrl: contentUrl
                            , model: model)
                        this._resultArray.value.append(model)
                    }
                }
            }
            /*
             if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
             print("Data: \(utf8Text)") // original server data as UTF8 string
             }*/
            // this.updateTableView?()
        }
    }
}
