
//
//  RightModel.swift
//  MVVMDemo
//
//  Created by Liu Tao on 2018/12/13.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import Foundation

class SendMessageModel: Codable {
    
    var SenderID: Int
    var ReceiverID: Int
    var MessageType: Int
    var Content: String
    
    init(senderID: Int,
         receiverID: Int,
         messageType: Int,
         content: String)
    {
        self.SenderID = senderID
        self.ReceiverID = receiverID
        self.MessageType = messageType
        self.Content = content
    }
}

struct RecieveMsgModel: Codable {
    
    var SenderID: Int
    var ReceiverID: Int
    var MessageType: Int
    var Content: ContentModel
}

extension RecieveMsgModel {
    
    struct ContentModel: Codable {
        var RecordTime: Int
        var Data: [Double]
        var FFTData: [Double]
        var ControlData: ControlDataModel
    }
    
    struct ControlDataModel: Codable {
        var InputSpeed: String
        var SpindleSpeed: String
        var FeedRate: String
        var SpindleLoadRatio: String
        var SpindleCurrent: String
        var MotorTemperature: String
        var CuttingDepth: String
        var CuttingTime: String
        var BootingTime: String
        var OperatingTime: String
        var X_axisPosition: String
        var Y_axisPosition: String
        var Z_axisPosition: String
    }
    
    init() {
        
        let contrData = RecieveMsgModel.ControlDataModel(InputSpeed: "",
                                                         SpindleSpeed: "",
                                                         FeedRate: "",
                                                         SpindleLoadRatio: "",
                                                         SpindleCurrent: "",
                                                         MotorTemperature: "",
                                                         CuttingDepth: "",
                                                         CuttingTime: "",
                                                         BootingTime: "",
                                                         OperatingTime: "",
                                                         X_axisPosition: "",
                                                         Y_axisPosition: "",
                                                         Z_axisPosition: "")
        self.init(SenderID: 0,
                  ReceiverID: 0,
                  MessageType: 0,
                  Content: RecieveMsgModel.ContentModel(RecordTime: 0,
                                                        Data: [],
                                                        FFTData: [],
                                                        ControlData: contrData))
    }
}
