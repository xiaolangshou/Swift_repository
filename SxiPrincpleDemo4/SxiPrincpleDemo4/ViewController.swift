//
//  ViewController.swift
//  SxiPrincpleDemo4
//
//  Created by lian shan on 2021/6/6.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("不使用迪米法特原则")
        let teacher1 = Teacher1()
        let leader1 = GroupLeader1()
        teacher1.command(leader: leader1)

        print("\n使用迪米法特原则")
        let teacher2 = Teacher2()
        var girls = [Girl]()
        for _ in 0..<20 {
            girls.append(Girl())
        }
        let leader2 = GroupLeader2(girls: girls)
        teacher2.command(leader: leader2)
    }
}

class Teacher1 {

    init() { }

    func command(leader: GroupLeader1) {
        var girls = [Girl]()
        // Teacher1类和非朋友类girl发生了交流
        for _ in 0..<20 {
            girls.append(Girl.init())
        }
        leader.countGirls(girls: girls)
    }
}

class GroupLeader1 {

    func countGirls(girls: [Girl]) {
        print("girls size: \(girls.count)")
    }
}

class Teacher2 {

    init() { }

    func command(leader: GroupLeader2) {
        // Teacher2类和非朋友类girl没有发生交流
        leader.countGirls()
    }
}

class GroupLeader2 {

    private var girls = [Girl]()

    init(girls: [Girl]) {
        self.girls = girls
    }

    func countGirls() {
        print("girls size: \(girls.count)")
    }
}

class Girl {

    init() {}
}
