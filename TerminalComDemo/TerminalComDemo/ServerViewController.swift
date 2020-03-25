//
//  ServerViewController.swift
//  TerminalComDemo
//
//  Created by mac on 2019/2/8.
//  Copyright © 2019 TLLTD. All rights reserved.
//

import UIKit
import SnapKit
import SwiftSocket

class ServerViewController: UIViewController {

    lazy var server: TCPServer = {
        let server = TCPServer(address: "192.168.8.102", port: 9999)
        return server
    }()
    
    let startBtn = UIButton()
    let stopBtn = UIButton()
    let resultLbl = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        
        startBtn.backgroundColor = UIColor.green
        view.addSubview(startBtn)
        startBtn.snp.makeConstraints { (make) in
            make.width.equalTo(50)
            make.height.equalTo(25)
            make.left.equalTo(50)
            make.centerY.equalToSuperview()
        }
        startBtn.setTitle("start", for: UIControl.State.normal)
        startBtn.addTarget(self, action: #selector(startBtnTapped), for: UIControl.Event.touchUpInside)
        
        stopBtn.backgroundColor = UIColor.red
        stopBtn.setTitle("stop", for: UIControl.State.normal)
        stopBtn.addTarget(self, action: #selector(stopBtnTapped), for: UIControl.Event.touchUpOutside)
        view.addSubview(stopBtn)
        stopBtn.snp.makeConstraints { (make) in
            make.width.equalTo(50)
            make.height.equalTo(25)
            make.right.equalTo(-50)
            make.centerY.equalTo(startBtn.snp.centerY)
        }
        
        resultLbl.text = "......"
        resultLbl.backgroundColor = UIColor.groupTableViewBackground
        view.addSubview(resultLbl)
        resultLbl.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(30)
            make.bottom.equalTo(startBtn.snp.top).offset(-50)
        }
    }

    @objc func startBtnTapped() {
        
        print("start btn tapped...")
        
        startListening()
    }
    
    @objc func stopBtnTapped() {
        
        print("stop btn tapped...")
        
        server.close()
    }
    
    func startListening() {
        
        DispatchQueue.global().async {
            switch self.server.listen() {
            case .success:
                while true {
                    if let client = self.server.accept() {
                        self.echoService(client: client)
                    } else {
                        print("accept error")
                        DispatchQueue.main.async {
                            self.resultLbl.text = "accept error"
                        }
                    }
                }
            case .failure(let error):
                print("listen fail: \(error)")
                DispatchQueue.main.async {
                    self.resultLbl.text = "listen fail: \(error)"
                }
            }
        }
    }
    
    func echoService(client: TCPClient) {
        
        print("New client from:\(client.address)[\(client.port)]")
        DispatchQueue.main.async {
            self.resultLbl.text = "New client from:\(client.address)[\(client.port)]"
        }
       
        if let d = client.read(1024 * 10) {
            // print("result \(client.send(data: d))")
            DispatchQueue.main.async {
                self.resultLbl.text = "result \(d)"
            }
        } else {
            print("can not read")
            DispatchQueue.main.async {
                self.resultLbl.text = "can not read"
            }
        }
        client.close()
    }

}
