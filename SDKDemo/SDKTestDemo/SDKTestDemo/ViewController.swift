//
//  ViewController.swift
//  SDKTestDemo
//
//  Created by Thomas Lau on 2020/3/5.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit
import SDKFramework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(homeV)
    }

    lazy var homeV: YLXHomeView = {
        let view = YLXHomeView.init(frame: CGRect.init(x: 20, y: 20, width: 200, height: 50))
        return view
    }()

}

