//
//  RightViewModel.swift
//  MVVMDemo
//
//  Created by Liu Tao on 2018/12/13.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import Foundation
import Charts
import RxCocoa
import RxSwift
import Starscream
import SwiftyJSON

protocol RightViewModelDelegate: NSObjectProtocol {
    
    func updateData(data: LineChartView.showData)
}

class RightViewModel {
    
    weak var delegate: RightViewModelDelegate?
    var socketClient: SocketClient?
    
    init() {
        setupScoket()
    }
    
    func setupScoket() {
        
        socketClient = SocketClient(urlStr: "ws://192.168.1.120:5000/?sid=20")
        
        socketClient?.socket.onConnect = { [weak self] in
            print("websocket is connected")
          
            let message = SendMessageModel(senderID: 20,
                                           receiverID: 101,
                                           messageType: 2,
                                           content: "")
            self?.socketClient?.sendMessage(message: message)
        }
        
        socketClient?.socket.onDisconnect = { error in
            if let e = error as? WSError {
                print("websocket is disconnected: \(e.message)")
            } else if let e = error {
                print("websocket is disconnected: \(e.localizedDescription)")
            } else {
                print("websocket disconnected")
            }
        }
        
        socketClient?.socket.onText = { text in
            
            DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
                
                let jsonText = String.getDicFromJsonStr(josnStr: text)
                
                do {
                    let data = try JSONSerialization.data(withJSONObject: jsonText, options: .prettyPrinted)
                    let json = try JSON.init(data: data)
                    
                    DispatchQueue.main.async {
                        if let data = json.toModel(RecieveMsgModel.self) {
                            
                            let showData = LineChartView.showData()
                            showData.SenderID = data.SenderID
                            showData.ReceiverID = data.ReceiverID
                            showData.MessageType = data.MessageType
                            showData.Content.RecordTime = data.Content.RecordTime
                            showData.Content.Data = data.Content.Data
                            showData.Content.FFTData = data.Content.FFTData
                            showData.Content.ControlData.BootingTime = data.Content.ControlData.BootingTime
                            showData.Content.ControlData.CuttingDepth = data.Content.ControlData.CuttingDepth
                            showData.Content.ControlData.CuttingTime = data.Content.ControlData.CuttingTime
                            showData.Content.ControlData.FeedRate = data.Content.ControlData.FeedRate
                            showData.Content.ControlData.InputSpeed = data.Content.ControlData.InputSpeed
                            showData.Content.ControlData.MotorTemperature = data.Content.ControlData.MotorTemperature
                            showData.Content.ControlData.OperatingTime = data.Content.ControlData.OperatingTime
                            showData.Content.ControlData.SpindleCurrent = data.Content.ControlData.SpindleCurrent
                            showData.Content.ControlData.SpindleLoadRatio = data.Content.ControlData.SpindleLoadRatio
                            showData.Content.ControlData.SpindleSpeed = data.Content.ControlData.SpindleSpeed
                            showData.Content.ControlData.X_axisPosition = data.Content.ControlData.X_axisPosition
                            showData.Content.ControlData.Y_axisPosition = data.Content.ControlData.Y_axisPosition
                            showData.Content.ControlData.Z_axisPosition = data.Content.ControlData.Z_axisPosition
                            
                            self.delegate?.updateData(data: showData)
                        }
                    }
                } catch let error {
                    fatalError(error as! String)
                }
            }
        }
        
    }
    
    func connect() {
        print("connecting...")
        socketClient?.connect()
    }
    
    func disconnect() {
        print("disconnected...")
        socketClient?.disconnect()
    }
}
