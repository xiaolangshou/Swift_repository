//
//  ViewController.swift
//  UDPDemo
//
//  Created by Thomas Lau on 2020/3/23.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let btn = UIButton.init(frame: CGRect.init(x: 20, y: 99, width: 60, height: 30))
    let btn2 = UIButton.init(frame: CGRect.init(x: 20, y: 200, width: 60, height: 30))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    func setupView() {
        view.addSubview(btn)
        btn.setTitle("接受", for: UIControl.State.normal)
        btn.backgroundColor = UIColor.cyan
        btn.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        
        view.addSubview(btn2)
        btn2.setTitle("发送", for: UIControl.State.normal)
        btn2.backgroundColor = UIColor.cyan
        btn2.addTarget(self, action: #selector(btn2Tapped), for: .touchUpInside)
    }
    
    // 当做client, 接受server发过来的UDP数据
    @objc func btnTapped() {
        
        let udpClient = GCDAsyncUdpSocket.init(delegate: self, delegateQueue: DispatchQueue.main)
        do {
            try udpClient.bind(toPort: 7788)
            print("connect success")
        } catch {
            print("connect error")
        }
    }
    
    // 当做server, 向client发送UDP数据（测试成功）
    @objc func btn2Tapped() {
        
        let udpClient = GCDAsyncUdpSocket.init(delegate: self, delegateQueue: DispatchQueue.main)
        
        do {
            try udpClient.enableBroadcast(true)
            let data = "hello world dfflaskdflasdjlksdflaksdjflsdkjflsdfjlsdfjsldfjsdlfj".data(using: String.Encoding.utf8)!
            udpClient.send(data, toHost: "10.161.222.122", port: 7788, withTimeout: 10, tag: 1)
            print("connect success")
        } catch {
            print("connect error")
        }
    }

}

extension ViewController: GCDAsyncUdpSocketDelegate {
    
    func udpSocket(_ sock: GCDAsyncUdpSocket,
                   didReceive data: Data,
                   fromAddress address: Data,
                   withFilterContext filterContext: Any?)
    {
        let str = String.init(data: data, encoding: String.Encoding.utf8)
        print("receiced data = \(str ?? "")")
    }
    
    func udpSocket(_ sock: GCDAsyncUdpSocket, didNotConnect error: Error?) {
        print("didNotConnect")
    }
    
    func udpSocketDidClose(_ sock: GCDAsyncUdpSocket, withError error: Error?) {
        print("udpSocketDidClose")
    }
    
    func udpSocket(_ sock: GCDAsyncUdpSocket, didConnectToAddress address: Data) {
        print("didConnectToAddress")
    }
    
    func udpSocket(_ sock: GCDAsyncUdpSocket, didSendDataWithTag tag: Int) {
        print("didSendDataWithTag \(tag)")
    }
}
