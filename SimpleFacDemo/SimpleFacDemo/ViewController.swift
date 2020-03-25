//
//  ViewController.swift
//  SimpleFacDemo
//
//  Created by Thomas Lau on 2020/3/7.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let m = MouseFac.createMouse(type: .Dell)
        m.logo()
    }


}

