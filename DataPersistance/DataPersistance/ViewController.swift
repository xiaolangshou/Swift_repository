//
//  ViewController.swift
//  DataPersistance
//
//  Created by Thomas Lau on 2020/4/13.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let btn1 = UIButton.init(frame: CGRect.init(x: 30, y: 80, width: 100, height: 25))
    let btn2 = UIButton.init(frame: CGRect.init(x: 30, y: 120, width: 100, height: 25))
    let btn3 = UIButton.init(frame: CGRect.init(x: 30, y: 160, width: 100, height: 25))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()
        setupView()
    }

    func setupView() {
        
        view.addSubview(btn1)
        btn1.setTitle("Userdefault", for: UIControl.State.normal)
        btn1.backgroundColor = UIColor.cyan
        btn1.addTarget(self, action: #selector(btn1Tapped), for: UIControl.Event.touchUpInside)
        
        view.addSubview(btn2)
        btn2.setTitle("Userdefault", for: UIControl.State.normal)
        btn2.backgroundColor = UIColor.cyan
        btn2.addTarget(self, action: #selector(btn2Tapped), for: UIControl.Event.touchUpInside)
        
        view.addSubview(btn3)
        btn3.setTitle("Userdefault", for: UIControl.State.normal)
        btn3.backgroundColor = UIColor.cyan
        btn2.addTarget(self, action: #selector(btn3Tapped), for: UIControl.Event.touchUpInside)
        
    }
    
    func initData() {
    
        // 存账户信息
        UserDefaults.AccountInfo.set(value: "chilli cheng", forKey: .userName)
        UserDefaults.LoginInfo.set(value: "token", forKey: .token)
    }
    
    @objc func btn1Tapped() {
        
        let a = UserDefaults.AccountInfo.string(forKey: .userName)
        let b = UserDefaults.LoginInfo.string(forKey: .token)
        print("\(a ?? ""): \(b ?? "")")
    }
    
    @objc func btn2Tapped() {
        
    }
    
    @objc func btn3Tapped() {
        
    }

}

extension UserDefaults {
    // 账户信息
    struct AccountInfo: UserDefaultsSettable {
        enum defaultKeys: String {
            case userName
            case age
        }
    }
    
    // 登录信息
    struct LoginInfo: UserDefaultsSettable {
        enum defaultKeys: String {
            case token
            case userId
        }
    }
}

protocol UserDefaultsSettable {
    associatedtype defaultKeys: RawRepresentable
}

extension UserDefaultsSettable where defaultKeys.RawValue==String {
    
    static func set(value: String?, forKey key: defaultKeys) {
        let aKey = key.rawValue
        UserDefaults.standard.set(value, forKey: aKey)
    }
    
    static func string(forKey key: defaultKeys) -> String? {
        let aKey = key.rawValue
        return UserDefaults.standard.string(forKey: aKey)
    }
}
