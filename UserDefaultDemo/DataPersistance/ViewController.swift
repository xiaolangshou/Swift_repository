//
//  ViewController.swift
//  DataPersistance
//
//  Created by Thomas Lau on 2020/4/13.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

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
        inputTF1.placeholder = "input data here"
        inputTF1.backgroundColor = UIColor.yellow
        
        view.addSubview(inputTF2)
        inputTF2.placeholder = "input data here"
        inputTF2.backgroundColor = UIColor.yellow
        
        view.addSubview(disLbl)
        disLbl.text = ""
        disLbl.backgroundColor = UIColor.lightGray
    }
    
    @objc func btn1Tapped() {
        
        // 存账户信息
        UserDefaults.AccountInfo.set(value: inputTF1.text, forKey: .userName)
        UserDefaults.LoginInfo.set(value: inputTF2.text, forKey: .token)
        
        let alert = UIAlertController(title: "success", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @objc func btn2Tapped() {
        
        let a = UserDefaults.AccountInfo.string(forKey: .userName)
        let b = UserDefaults.LoginInfo.string(forKey: .token)
        print("\(a ?? ""): \(b ?? "")")
        
        disLbl.text = "\(a ?? "no input"), \(b ?? "no input")"
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
