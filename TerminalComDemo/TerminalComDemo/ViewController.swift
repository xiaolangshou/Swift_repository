//
//  ViewController.swift
//  TerminalComDemo
//
//  Created by mac on 2019/2/8.
//  Copyright © 2019 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    static let sharedVC = ViewController()
    
    let client = UIButton()
    let server = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        
        client.setTitle("client", for: UIControl.State.normal)
        client.backgroundColor = UIColor.green
        view.addSubview(client)
        client.snp.makeConstraints { (make) in
            make.width.equalTo(55)
            make.height.equalTo(25)
            make.left.equalTo(100)
            make.top.equalTo(100)
        }
        client.addTarget(self, action: #selector(clientBtnTapped), for: UIControl.Event.touchUpInside)
        
        server.setTitle("server", for: UIControl.State.normal)
        server.backgroundColor = UIColor.green
        view.addSubview(server)
        server.snp.makeConstraints { (make) in
            make.width.equalTo(client.snp.width)
            make.height.equalTo(client.snp.height)
            make.centerY.equalTo(client.snp.centerY)
            make.right.equalTo(-100)
        }
        server.addTarget(self, action: #selector(serverBtnTapped), for: UIControl.Event.touchUpInside)
    }
    
    @objc func clientBtnTapped() {
        
        let vc = ClientViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func serverBtnTapped() {
        
        let vc = ServerViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

