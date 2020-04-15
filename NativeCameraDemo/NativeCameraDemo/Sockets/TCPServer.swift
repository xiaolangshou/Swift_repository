//
//  TCPServer.swift
//  NativeCameraDemo
//
//  Created by Thomas Lau on 2020/4/15.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class TCPServer: NSObject {
    
    static let sharedInstance = TCPServer.init()
    let queue = DispatchQueue(label: "subQueue", attributes: .concurrent)
    
    var serverSocket: GCDAsyncSocket?
    var arrayClient: [GCDAsyncSocket]?
    
    override init() {
        super.init()
        
        serverSocket = GCDAsyncSocket.init(delegate: self, delegateQueue: queue)
        arrayClient = [GCDAsyncSocket]()
    }
    
    
    // 开启端口监听
    func openSerViceWithPort(port: UInt16) {
        
        do {
            try serverSocket?.accept(onPort: port)
            print("端口监听成功开启")
        } catch {
            print("监听端口失败")
        }
    }
    
    func sendData(data: NSData) {
        
        // 可以给多个播放器发送, 这里我测试就默认给一个socket来发送数据
        if arrayClient?.count ?? 0 > 0 {
            arrayClient?[0].write(data as Data, withTimeout: -1, tag: 0)
        }
    }
}

extension TCPServer: GCDAsyncSocketDelegate {
    
    // 连接上新的客户端socket
    func socket(_ sock: GCDAsyncSocket, didAcceptNewSocket newSocket: GCDAsyncSocket) {

        print("\(newSocket) ip: \(newSocket.connectedHost ?? ""), port:\(newSocket.localPort)")
        // 将客户端socket保存起来
        if !(arrayClient?.contains(newSocket))! {
            self.arrayClient?.append(newSocket)
        }
        newSocket.readData(withTimeout: -1, tag: 0)
    }
    
    // 读取客户端发送的数据
    func socket(_ sock: GCDAsyncSocket, didRead data: Data, withTag tag: Int) {
        sock.readData(withTimeout: -1, tag: 0)
    }
    
    // 连接断开
    func socketDidDisconnect(_ sock: GCDAsyncSocket, withError err: Error?) {
        
        for (i,s) in (arrayClient?.enumerated())! {
            if s == sock {
                arrayClient?.remove(at: i)
                print("关闭了 \(sock) 客户端")
            }
        }
    }
}
