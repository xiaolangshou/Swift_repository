//
//  ViewController.swift
//  B
//
//  Created by lian shan on 2021/6/2.
//

import UIKit

class ViewController: UIViewController {

    static let shared = ViewController.init()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        title = "vc1"
        view.backgroundColor = UIColor.cyan
    }
}

