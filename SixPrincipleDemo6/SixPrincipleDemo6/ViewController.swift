//
//  ViewController.swift
//  SixPrincipleDemo6
//
//  Created by lian shan on 2021/6/7.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        let soldier = Soldier.init(gun: Handgun.init())
//        soldier.killEnemy()
//
//        let snipper = Snipper.init(gun: Rifle.init())
//        snipper.killEnemy()

        let f = Father.init()
        let set: Set<String> = ["a","b","c"]
        f.doSomething(set: set)

        let s = Son.init()
        let arr = ["a","b","b","c"]
        s.doSomething(set: arr)
    }
}
class Soldier {
    private var gun = AbstractGun.init()
    init(gun: AbstractGun) { self.gun = gun }
    func killEnemy() {
        print("开始射杀敌人")
        self.gun.shoot()
    }
}
class Snipper: Soldier {
    private var sks = SKS.init()
    func setSks(sks: SKS) { self.sks = sks }
    override func killEnemy() {
        sks.zoomOut()
        sks.shoot()
    }
}
class AbstractGun {
    init() {}
    func shoot() {}
}
class Handgun: AbstractGun {
    // 1.子类必须完全实现父类的方法
    override func shoot() { print("手枪射击") }
}
class Rifle: AbstractGun {
    // 1.子类必须完全实现父类的方法
    override func shoot() { print("步枪射击") }
}
class MachineGun: AbstractGun {
    // 1.子类必须完全实现父类的方法
    override func shoot() { print("机枪射击") }
}
class SKS: Rifle {
    override func shoot() { print("SKS射击") }
    // 2.孩子类可以有自己的个性
    func zoomOut() { print("通过八倍镜观察敌人") }
}

class Father {
    func doSomething(set: Set<String>) {
        print("父类被执行")
        print(set)
    }
}
// 3. 子类中方法的入参类型必须与父类中被覆写的方法的入参类型相同或更宽松
class Son: Father {
    func doSomething<T>(set: T) {
        print("子类被执行")
        print(set)
    }
}
