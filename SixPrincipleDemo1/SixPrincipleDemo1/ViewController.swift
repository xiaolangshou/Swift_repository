//
//  ViewController.swift
//  SixPrincipleDemo1
//
//  Created by lian shan on 2021/6/2.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("不使用单一职责原则")
        let p1 = Phone1.init()
        p1.dail(phoneNum: "137239779")
        p1.hangup()
        p1.chat(person: "Thomas")

        print("\n使用单一职责原则")
        let p2 = Phone2.init()
        p2.connectionMng.dail(phoneNum: "137239779")
        p2.connectionMng.hangup()
        p2.dataTansfer.chat(person: "Thomas")
    }
}


class Phone1 {
    required init() {}
    func dail(phoneNum: String) { print(phoneNum) }
    func hangup() { print("hangup") }
    func chat(person: String) { print(#function) }
}

class Phone2: NSObject {
    let connectionMng = ConnectionMngInterface.init()
    let dataTansfer = DataTansferInterface.init()
    required override init() {}
}

class ConnectionMngInterface {
    required init() {}
    func dail(phoneNum: String) { print(#function) }
    func hangup() { print(#function) }
}

class DataTansferInterface {
    required init() {}
    func chat(person: String) { print(#function) }
}
