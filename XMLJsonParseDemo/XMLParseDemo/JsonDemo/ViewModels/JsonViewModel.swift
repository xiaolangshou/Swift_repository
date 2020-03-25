//
//  JsonViewModel.swift
//  XMLParseDemo
//
//  Created by Liu Tao on 2018/3/15.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit
import RxSwift
import Alamofire
import SwiftyJSON
import ObjectMapper
import RxDataSources

struct SectionJsonModel {
    var header: String
    var items: [Item]
}

extension SectionJsonModel: SectionModelType {
    typealias Item = JsonModel

    init(original: SectionJsonModel, items: [Item]) {
        self = original
        self.items = items
    }
}

class JsonViewModel: NSObject {

    var items = Variable([SectionJsonModel]())

    fileprivate let _jsonStr = "http://freezing-cloud-6077.herokuapp.com/messages.json"
    fileprivate var _url: URL? = nil
    fileprivate var _jsonArray = [JsonModel]()

    override init() {
        super.init()

        parseJsonUsingAlamofire()
    }
    
    func parseJsonUsingAlamofire() {

        _url = URL(string: _jsonStr)
        Alamofire.request(_url!).responseJSON { [weak self] response in
            guard self != nil else { return }
            /*
             if let json = response.result.value {
             print("json = \(json)")
             }
             if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
             print("Data: \(utf8Text)") // original server data as UTF8 string
             }*/
            if let value = response.result.value {
                let json = JSON(value).arrayObject
                self?._jsonArray = Mapper<JsonModel>().mapArray(JSONArray: json as! [[String : Any]])
                self?.items.value = [SectionJsonModel(header: "", items: (self?._jsonArray)!)]
            }

        }
    }
}
