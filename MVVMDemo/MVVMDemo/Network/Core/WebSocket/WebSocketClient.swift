//
//  SocketLayer.swift
//  MVVMDemo
//
//  Created by mac on 2018/12/4.
//  Copyright © 2018 Liu Tao. All rights reserved.
//

import Foundation
import Starscream

class SocketClient {
    
    let socket: WebSocket
    
    init(urlStr: String) {
        
        var request = URLRequest(url: urlStr.url!)
        request.timeoutInterval = 8
        socket = WebSocket(request: request)
    }
    
    func connect() {
        socket.connect()
    }
    
    func disconnect() {
        socket.disconnect()
    }
    
    func sendMessage(message: SendMessageModel) {

        let encodedData = try? JSONEncoder().encode(message)
        var json: Any?
        if let data = encodedData {
            json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            let jsonData = json as! NSDictionary
            
            print(jsonData.toJsonString())
            socket.write(string: jsonData.toJsonString())
        } else {
            print("no message")
        }
    }
}
