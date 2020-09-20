//
//  ViewController.swift
//  AlamofireDemo
//
//  Created by Liu Tao on 2018/11/30.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {
    
    let urlStr = "http://freezing-cloud-6077.herokuapp.com/messages.json"
    var sessionManager = SessionManager()
    
    typealias responseCallback = (DataResponse<Any>) -> Void
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // method 1
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 15
        sessionManager = SessionManager.init(configuration: config)

        sendRequest(urlStr: urlStr) { json in
            if let value = json.result.value {
                let json = JSON(value)
                print(json)
            }
        }
        
        // method 2
        // sendRequest2(urlStr: urlStr)
    }
    
    func sendRequest(urlStr: String,
                 method: HTTPMethod = .get,
                 parameters: Parameters? = nil,
                 encoding: ParameterEncoding = URLEncoding.default,
                 headers: HTTPHeaders? = nil,
                 callback:@escaping responseCallback)
    {
        if let url = URL.init(string: urlStr) {
            let dataRequest = sessionManager.request(url,
                                                     method: method,
                                                     parameters: parameters,
                                                     encoding: encoding,
                                                     headers: headers)
            dataRequest.validate().responseJSON { (json) in
                switch json.result.isSuccess {
                case true:
                    callback(json)
                case false:
                    print(json.result.error ?? "Error")
                }
            }
            /*
            dataRequest.responseString { (str) in
                print("-------------")
                print(str.result.value ?? "")
            }*/
        } else {
            print("error")
        }
    }
    
    
    func sendRequest2(urlStr: String) {
        
        if let url = URL.init(string: urlStr) {
            Alamofire.request(url).responseJSON { [weak self] (response) in
                guard self != nil else { return }
                
                if let value = response.result.value {
                    print(value)
                }
            }
        } else {
            print("url error")
        }
    }
    
}

