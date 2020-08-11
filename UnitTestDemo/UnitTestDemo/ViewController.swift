//
//  ViewController.swift
//  UnitTestDemo
//
//  Created by Thomas Lau on 2020/8/9.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(2.square())
    }


}

extension Int {
    func square() -> Int {
        return self * self * self
    }
}
