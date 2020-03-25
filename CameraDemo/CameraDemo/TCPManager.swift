//
//  TCPManager.swift
//  CameraDemo
//
//  Created by Thomas Lau on 2020/3/23.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import Foundation
import CocoaAsyncSocket

protocol TCPManagerDelegate: NSObjectProtocol {
    
    func didConnectToHost(host: String, port: UInt16)
    func didReadData(data: Data, withTag tag: Int)
}

class TCPManager: NSObject {
    
    weak var delegate: TCPManagerDelegate?
    var clientSocket: GCDAsyncSocket?
    
    override init() {
        super.init()
        
        clientSocket = GCDAsyncSocket(delegate: self, delegateQueue: DispatchQueue.main)
    }
    
    func connect(ip: String, port: UInt16) -> Bool {

        do {
            if clientSocket?.isDisconnected ?? false {
                try clientSocket?.connect(toHost: ip, onPort: port, withTimeout: 3.0)
                print("did connected")
            }
            return true
        } catch _ {
            print("did not connected")
            return false
        }
    }
    
    deinit {
        GCDTimer.shared.cancelTimer(WithTimerName: "video")
    }
    
}

extension TCPManager: GCDAsyncSocketDelegate {
    
    func socket(_ sock: GCDAsyncSocket, didConnectToHost host: String, port: UInt16) {
        print("连上了服务器，sock = \(sock)")
        print("开始读取服务端数据")
        clientSocket?.readData(withTimeout: 10, tag: 0)
        delegate?.didConnectToHost(host: host, port: port)
    }
    
    func socket(_ sock: GCDAsyncSocket, didRead data: Data, withTag tag: Int) {
        print("已经读取服务器数据")
        delegate?.didReadData(data: data, withTag: tag)
    }
    
    func socketDidDisconnect(_ sock: GCDAsyncSocket, withError err: Error?) {
        print("已断开连接")
    }
}
