//
//  ViewController.swift
//  AlamofireDemo
//
//  Created by Liu Tao on 2018/11/30.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let urlStr = "http://freezing-cloud-6077.herokuapp.com/messages.json"
    var sessionManager = SessionManager()
    
    typealias responseCallback = (DataResponse<Data>) -> Void
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 15
        sessionManager = SessionManager.init(configuration: config)
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
            dataRequest.responseData { (data) in
                callback(data)
            }
        } else {
            print("error")
        }
    }
    
    /*
    func sendRequest(urlStr: String) {
        
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
    }*/
    
}

