//
//  ViewController.swift
//  ClosureDemo3
//
//  Created by Liu Tao on 2018/11/21.
//  Copyright © 2018 Liu Tao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let v = SubView.init(frame: CGRect.init(x: 10, y: 10, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    func setupView() {
        
        view.addSubview(v)
        
        v.btnTapped = { value in
            print("transmitted value is:\(value)")
        }
        
        v.btn2Tapped = { str in
            print(str)
        }
    }
}

