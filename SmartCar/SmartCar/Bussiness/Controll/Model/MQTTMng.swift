//
//  Communication.swift
//  SmartCar
//
//  Created by Thomas Lau on 2020/7/20.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import Foundation
import CocoaMQTT

class MQTTMng {
    
    var mqtt: CocoaMQTT?
    
    init(clientID: String, host: String, port: UInt16, username: String,
         password: String, topic: String, message: String, keepAlive: UInt16)
    {
        mqtt = CocoaMQTT.init(clientID: clientID, host: host, port: port)
        mqtt!.username = username
        mqtt!.password = password
        mqtt!.willMessage = CocoaMQTTWill.init(topic: topic, message: message)
        mqtt!.keepAlive = keepAlive
    }
    
    func sendMsg(topic: String, msg: String) {
        mqtt?.publish(topic, withString: msg, qos: CocoaMQTTQOS.qos1)
    }
    
    func connect() {
        mqtt?.connect()
    }
    
    func disconnect() {
        mqtt?.disconnect()
    }
}
