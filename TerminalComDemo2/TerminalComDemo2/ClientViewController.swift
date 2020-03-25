//
//  ClientViewController.swift
//  TerminalComDemo2
//
//  Created by mac on 2019/2/14.
//  Copyright © 2019 TLLTD. All rights reserved.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift
import CocoaAsyncSocket

class ClientViewController: UIViewController {
    
    var socket: GCDAsyncSocket? = nil
    var message = ""
    
    let btn = UIButton()
    let messageTF = UITextField()
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSocket()
        setupView()
    }
    
    func setupSocket() {
        
        socket = GCDAsyncSocket(delegate: self, delegateQueue: DispatchQueue.main)
        
        do {
            _ = try self.socket?.connect(toHost: "192.168.8.100", onPort: 7878)
        } catch {
            print("error")
        }
    }
    
    func setupView() {
        
        btn.backgroundColor = UIColor.cyan
        btn.setTitle("send", for: UIControl.State.normal)
        view.addSubview(btn)
        btn.snp.makeConstraints { (make) in
            make.width.equalTo(60)
            make.height.equalTo(20)
            make.center.equalToSuperview()
        }
        btn.addTarget(self, action: #selector(btnTapped),
                      for: UIControl.Event.touchUpInside)
        
        messageTF.backgroundColor = UIColor.groupTableViewBackground
        messageTF.placeholder = "input message here"
        view.addSubview(messageTF)
        messageTF.rx.text.subscribe { [weak self] str in
            if let value = str.element {
                self?.message = value ?? "Nonthing"
            }
        }.disposed(by: bag)
        messageTF.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(30)
            make.bottom.equalTo(btn.snp.top).offset(-30)
        }
    }
    
    @objc func btnTapped() {
        
        let data = self.message.data(using: String.Encoding.utf8)
        socket?.write(data ?? Data(), withTimeout: 1, tag: 100)
    }
}

extension ClientViewController: GCDAsyncSocketDelegate {
    
    func socketDidDisconnect(_ sock: GCDAsyncSocket, withError err: Error?) {
        print("did disconnect to host")
    }
    
    func socket(_ sock: GCDAsyncSocket, didConnectToHost host: String, port: UInt16) {
        print("did connect to host")
    }
    
    func socket(_ sock: GCDAsyncSocket, didWriteDataWithTag tag: Int) {
        print("did write data to host")
    }
    
    func socket(_ sock: GCDAsyncSocket, didRead data: Data, withTag tag: Int) {
        print("did read data to host")
    }
    
}
