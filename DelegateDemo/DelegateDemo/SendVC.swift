//
//  SendVC.swift
//  DelegateDemo
//
//  Created by Thomas Lau on 2018/5/14.
//  Copyright © 2018年 Thomas Lau. All rights reserved.
//

import UIKit

protocol VC2Delagte: NSObjectProtocol {
    
    func changeBackColor(color: UIColor)
}

class SendVC: UIViewController {

    weak var delegate: VC2Delagte?
    let btn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.gray
        
        btn.frame = CGRect(x: 50, y: 100, width: 60, height: 30)
        btn.backgroundColor = UIColor.cyan
        btn.addTarget(self, action: #selector(changeBackgroundColor), for: .touchUpInside)
        view.addSubview(btn)
    }

    @objc func changeBackgroundColor() {
        
        delegate?.changeBackColor(color: UIColor.blue)
        
        dismiss(animated: true, completion: nil)
    }

}
