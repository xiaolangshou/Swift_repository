//
//  ViewController.swift
//  SDKTest
//
//  Created by Thomas Lau on 2020/3/16.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit
import SDKFramework

class ViewController: UIViewController {
    
    var homeV: TLView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        homeV = TLView.init(frame: CGRect.init(x: 20, y: 20, width: 200, height: 100))
        view.addSubview(homeV ?? UIView())
    }

}

