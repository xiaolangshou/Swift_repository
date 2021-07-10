//
//  ViewController.swift
//  DeferDemo
//
//  Created by lian shan on 2021/6/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        printNumbers()
    }

    func printNumbers() {
        defer { print("1") }
        defer { print("2") }
        defer { print("3") }
        defer { print("4") }

        print(5)
    }

}

