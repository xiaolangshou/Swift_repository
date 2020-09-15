//
//  ViewController.swift
//  DataPersistance
//
//  Created by Thomas Lau on 2020/4/13.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

/// Userdefault 适合存储轻量级的本地客户端数据，如存储大批量数据不推荐使用

class ViewController: UIViewController {
    
    let inputTF1 = UITextField.init(frame: CGRect.init(x: 30, y: 65, width: 120, height: 35))
    let inputTF2 = UITextField.init(frame: CGRect.init(x: 160, y: 65, width: 120, height: 35))
    let btn1 = UIButton.init(frame: CGRect.init(x: 30, y: 100, width: 100, height: 25))
    let btn2 = UIButton.init(frame: CGRect.init(x: 30, y: 140, width: 100, height: 25))
    let disLbl = UILabel.init(frame: CGRect.init(x: 30, y: 270, width: 200, height: 60))

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        
        view.addSubview(btn1)
        btn1.setTitle("write data", for: UIControl.State.normal)
        btn1.backgroundColor = UIColor.cyan
        btn1.addTarget(self, action: #selector(btn1Tapped), for: UIControl.Event.touchUpInside)
        
        view.addSubview(btn2)
        btn2.setTitle("read data", for: UIControl.State.normal)
        btn2.backgroundColor = UIColor.cyan
        btn2.addTarget(self, action: #selector(btn2Tapped), for: UIControl.Event.touchUpInside)
        
        view.addSubview(inputTF1)
        inputTF1.placeholder = "input name here"
        inputTF1.backgroundColor = UIColor.yellow
        
        view.addSubview(inputTF2)
        inputTF2.placeholder = "input token here"
        inputTF2.backgroundColor = UIColor.yellow
        
        view.addSubview(disLbl)
        disLbl.text = ""
        disLbl.backgroundColor = UIColor.lightGray
    }
    
    @objc func btn1Tapped() {
        
        // 存账户信息
        UserDefaults.AccountInfo.set(value: inputTF1.text, forKey: .userName)
        UserDefaults.AccountInfo.set(value: 29, forKey: .age)
        UserDefaults.AccountInfo.set(value: false, forKey: .death)
        UserDefaults.AccountInfo.set(value: ["Baidu","Alibaba","Tencent"], forKey: .jobs)
        
        
        UserDefaults.LoginInfo.set(value: inputTF2.text, forKey: .token)
        UserDefaults.LoginInfo.set(value: "2188", forKey: .userId)
        UserDefaults.LoginInfo.set(value: "unnoaisduf", forKey: .password)
        
        let alert = UIAlertController(title: "success", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @objc func btn2Tapped() {
        
        let a1 = UserDefaults.AccountInfo.string(forKey: .userName)
        let a2 = UserDefaults.AccountInfo.Int(forKey: .age)
        let a3 = UserDefaults.AccountInfo.Bool(forKey: .death)
        let a4 = UserDefaults.AccountInfo.array(forKey: .jobs)
        
        let b1 = UserDefaults.LoginInfo.string(forKey: .token)
        let b2 = UserDefaults.LoginInfo.string(forKey: .userId)
        let b3 = UserDefaults.LoginInfo.string(forKey: .password)
        
        print("\(a1 ?? ""), \(a2 ?? 0), \(a3 ?? false), \(a4 ?? []), \(b1 ?? ""), \(b2 ?? ""), \(b3 ?? "")")
        
        disLbl.text = "\(a1 ?? ""), \(a2 ?? 0), \(a3 ?? false), \(a4 ?? []), \(b1 ?? ""), \(b2 ?? ""), \(b3 ?? "")"
    }

}

// 为了让存取的key一致: 常量保存，和分组存储
extension UserDefaults {
    // 账户信息
    struct AccountInfo: UserDefaultsSettable {
        enum defaultKeys: String {
            case userName
            case age
            case death
            case jobs
        }
    }
    
    // 登录信息
    struct LoginInfo: UserDefaultsSettable {
        enum defaultKeys: String {
            case token
            case userId
            case password
        }
    }
}

protocol UserDefaultsSettable {
    
    associatedtype defaultKeys: RawRepresentable
}

extension UserDefaultsSettable where defaultKeys.RawValue==String {
    
    // write
    static func set(value: String?, forKey key: defaultKeys) {
        let aKey = key.rawValue
        UserDefaults.standard.set(value, forKey: aKey)
    }
    
    static func set(value: Int?, forKey key: defaultKeys) {
        let aKey = key.rawValue
        UserDefaults.standard.set(value, forKey: aKey)
    }
    
    static func set(value: Bool?, forKey key: defaultKeys) {
        let aKey = key.rawValue
        UserDefaults.standard.set(value, forKey: aKey)
    }
    
    static func set(value: Array<Any>?, forKey key: defaultKeys) {
        let aKey = key.rawValue
        UserDefaults.standard.set(value, forKey: aKey)
    }
    
    // read
    static func string(forKey key: defaultKeys) -> String? {
        let aKey = key.rawValue
        return UserDefaults.standard.string(forKey: aKey)
    }
    
    static func Int(forKey key: defaultKeys) -> Int? {
        let aKey = key.rawValue
        return UserDefaults.standard.integer(forKey: aKey)
    }
    
    static func Bool(forKey key: defaultKeys) -> Bool? {
        let aKey = key.rawValue
        return UserDefaults.standard.bool(forKey: aKey)
    }
    
    static func array(forKey key: defaultKeys) -> Array<Any>? {
        let aKey = key.rawValue
        return UserDefaults.standard.array(forKey: aKey)
    }
}
