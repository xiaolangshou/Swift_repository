
//
//  ServerViewController.swift
//  TerminalComDemo2
//
//  Created by mac on 2019/2/14.
//  Copyright © 2019 TLLTD. All rights reserved.
//

import UIKit
import SnapKit
import CocoaAsyncSocket

class ServerViewController: UIViewController {

    var listenSocket: GCDAsyncSocket?
    var checkThread: Thread?
    var timer: Timer?
    var arrayClient = [GCDAsyncSocket]()
    var count = 0
    
    let backView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupSocket()
    }
    
    func setupView() {
        
        backView.layer.borderColor = UIColor.cyan.cgColor
        backView.layer.borderWidth = 1.0
        backView.backgroundColor = UIColor.white
        backView.layer.cornerRadius = 50
        view.addSubview(backView)
        backView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.equalTo(100)
        }
    }
    
    func setupSocket() {
        
        // 监听客户端
        listenSocket = GCDAsyncSocket(delegate: self, delegateQueue: DispatchQueue.main)
        do {
            try listenSocket?.accept(onInterface: "192.168.8.102", port: 9999)
        } catch {
            print("error")
        }
        
        // 开启个不死线程不断检测所连接的每个客户端的心跳
        checkThread = Thread(target: self, selector: #selector(checkClientOnline), object: nil)
        checkThread?.start()
    }
    
    @objc func checkClientOnline() {
        
        timer = Timer.scheduledTimer(timeInterval: 3,
                             target: self,
                             selector: #selector(repeatCheckClinetOnline),
                             userInfo: nil,
                             repeats: true)
        RunLoop.current.run()
    }
    
    @objc func repeatCheckClinetOnline() {
        
        count += 1
        print("repeatCheckClinetOnline \(count)")
    }
}

extension ServerViewController: GCDAsyncSocketDelegate {
    
    func socket(_ sock: GCDAsyncSocket, didAcceptNewSocket newSocket: GCDAsyncSocket) {
        
        print("did accept new socket...")
        
        arrayClient.append(newSocket)
        newSocket.readData(withTimeout: -1, tag: 100)
    }
    
    func socket(_ sock: GCDAsyncSocket, didRead data: Data, withTag tag: Int) {
        
        if tag == 100 {
            var resultStr = String(data: data, encoding: String.Encoding.utf8)
            if (resultStr?.contains("\n"))! {
                resultStr?.removeLast(1)
            }

            print("did read data: \(resultStr ?? "None")")
            let value = UInt(resultStr ?? "0")
            print("v = \(String(describing: value))")
            backView.backgroundColor = UIColor.hex(value ?? 0)
            sock.readData(withTimeout: -1, tag: 100)
        }
    }
    
    func socketDidDisconnect(_ sock: GCDAsyncSocket, withError err: Error?) {
        
        print("socket did disconnect")
        
        timer?.invalidate()
        timer = nil
    }
}
