//
//  ViewController.swift
//  StaticVarDemo
//
//  Created by lian shan on 2021/4/7.
//

import UIKit

class ViewController: UIViewController {

    static var url = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        A.func1()

    }


}

class A {

    static var url = ""

    static public func func1() {
        let theUrl = URL.init(string: "aaaa")

        url = theUrl!.absoluteString.replacingOccurrences(of: "native.m.lazada.com/payment",                                                                         with: "bbb")

        print(url)
    }

}
