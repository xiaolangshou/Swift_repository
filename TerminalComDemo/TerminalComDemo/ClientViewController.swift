//
//  ClientViewController.swift
//  TerminalComDemo
//
//  Created by mac on 2019/2/8.
//  Copyright © 2019 TLLTD. All rights reserved.
//

import UIKit
import SnapKit
import RxCocoa
import RxSwift
import SwiftSocket

class ClientViewController: UIViewController {

    lazy var client: TCPClient = {
        let client = TCPClient(address: "192.168.8.100", port: 7878)
        return client
    }()
    
    var displayStr = ""
    
    let ipTitle = UILabel()
    let ipTF = UITextField()
    let portTitle = UILabel()
    let portTF = UITextField()
    let displayStrTF = UITextField()
    let connectBtn = UIButton()
    let disconnectBtn = UIButton()

    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        
        ipTitle.text = "IP:"
        view.addSubview(ipTitle)
        ipTitle.snp.makeConstraints { (make) in
            make.width.equalTo(50)
            make.height.equalTo(25)
            make.left.equalTo(30)
            make.top.equalTo(100)
        }
        
        ipTF.backgroundColor = UIColor.lightGray
        view.addSubview(ipTF)
        ipTF.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(25)
            make.left.equalTo(ipTitle.snp.right).offset(10)
            make.centerY.equalTo(ipTitle.snp.centerY)
        }
        
        portTitle.text = "Port:"
        view.addSubview(portTitle)
        portTitle.snp.makeConstraints { (make) in
            make.width.equalTo(50)
            make.height.equalTo(25)
            make.left.equalTo(ipTitle.snp.left)
            make.top.equalTo(ipTitle.snp.bottom).offset(20)
        }
        
        portTF.backgroundColor = UIColor.lightGray
        view.addSubview(portTF)
        portTF.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(25)
            make.left.equalTo(portTitle.snp.right).offset(10)
            make.centerY.equalTo(portTitle.snp.centerY)
        }
        
        displayStrTF.backgroundColor = UIColor.groupTableViewBackground
        view.addSubview(displayStrTF)
        displayStrTF.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(portTF.snp.bottom).offset(10)
            make.height.equalTo(50)
        }
        displayStrTF.rx.text.subscribe { [weak self] result in
            if let value = result.element {
                self?.displayStr = value ?? ""
                print(self?.displayStr ?? "None")
            }
        }.disposed(by: bag)
        
        connectBtn.setTitle("Connect", for: UIControl.State.normal)
        connectBtn.backgroundColor = UIColor.green
        connectBtn.addTarget(self, action: #selector(connectBtnTapped),
                             for: UIControl.Event.touchUpInside)
        view.addSubview(connectBtn)
        connectBtn.snp.makeConstraints { (make) in
            make.left.equalTo(ipTitle.snp.left)
            make.top.equalTo(displayStrTF.snp.bottom).offset(30)
            make.height.equalTo(25)
        }
        
        disconnectBtn.setTitle("Disconnect", for: UIControl.State.normal)
        disconnectBtn.backgroundColor = UIColor.red
        disconnectBtn.addTarget(self, action: #selector(disconnectBtnTapped),
                                for: UIControl.Event.touchUpInside)
        view.addSubview(disconnectBtn)
        disconnectBtn.snp.makeConstraints { (make) in
            make.left.equalTo(connectBtn.snp.right).offset(50)
            make.centerY.equalTo(connectBtn.snp.centerY)
            make.height.equalTo(25)
        }
    }
    
    @objc func connectBtnTapped() {
        
        switch client.connect(timeout: 1) {
        case .success:
            switch client.send(string: self.displayStr) {
            case .success:
                print("success")
                if let data = client.readStr(1024 * 10) {
                    print("reusult = \(data)")
                }
            case .failure(let error):
                print("fail: error", error)
            }
        case .failure(let error):
            print("fail: error", error)
        }
    }
    
    @objc func disconnectBtnTapped() {
        
        client.close()
    }
}
