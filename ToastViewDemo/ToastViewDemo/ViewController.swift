//
//  ViewController.swift
//  ToastViewDemo
//
//  Created by Thomas Lau on 2020/10/7.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let t = LAPaymentToastView.init(frame: UIScreen.main.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        view.addSubview(t)
    }


}

