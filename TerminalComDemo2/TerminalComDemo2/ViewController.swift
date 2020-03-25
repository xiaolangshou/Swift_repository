//
//  ViewController.swift
//  TerminalComDemo2
//
//  Created by mac on 2019/2/14.
//  Copyright © 2019 TLLTD. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    static let shared = ViewController()
    
    let clientBtn = UIButton()
    let serverBtn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        
        clientBtn.setTitle("client", for: UIControl.State.normal)
        clientBtn.backgroundColor = UIColor.green
        view.addSubview(clientBtn)
        clientBtn.snp.makeConstraints { (make) in
            make.width.equalTo(60)
            make.height.equalTo(30)
            make.left.equalTo(30)
            make.top.equalTo(100)
        }
        clientBtn.addTarget(self, action: #selector(clientBtnTapped),
                            for: UIControl.Event.touchUpInside)
        
        serverBtn.setTitle("server", for: UIControl.State.normal)
        serverBtn.backgroundColor = UIColor.green
        view.addSubview(serverBtn)
        serverBtn.snp.makeConstraints { (make) in
            make.width.equalTo(60)
            make.height.equalTo(30)
            make.right.equalTo(-30)
            make.centerY.equalTo(clientBtn.snp.centerY)
        }
        serverBtn.addTarget(self, action: #selector(serverBtnTapped),
                            for: UIControl.Event.touchUpInside)
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

