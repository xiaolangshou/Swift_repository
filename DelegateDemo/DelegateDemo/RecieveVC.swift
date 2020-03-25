//
//  RecieveVC.swift
//  DelegateDemo
//
//  Created by Thomas Lau on 2018/5/14.
//  Copyright © 2018年 Thomas Lau. All rights reserved.
//

import UIKit

class RecieveVC: UIViewController {

    let btn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.brown
        
        btn.frame = CGRect(x: 50, y: 100, width: 40, height: 20)
        btn.backgroundColor = UIColor.green
        btn.addTarget(self, action: #selector(pushToVC2), for: .touchUpInside)
        view.addSubview(btn)
    }
    
    @objc func pushToVC2() {
        
        let vc2 = SendVC()
        vc2.delegate = self
        self.present(vc2, animated: true, completion: nil)
    }

}

extension RecieveVC: VC2Delagte {
    
    func changeBackColor(color: UIColor) {
        view.backgroundColor = color
    }

}

