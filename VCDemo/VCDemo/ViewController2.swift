//
//  ViewController2.swift
//  VCDemo
//
//  Created by lian shan on 2021/4/16.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.red

        self.view.frame = CGRect.init(x: 0, y: 500, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.backgroundColor = UIColor.cyan
    }

}
