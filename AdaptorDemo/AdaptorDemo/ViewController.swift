//
//  ViewController.swift
//  AdaptorDemo
//
//  Created by lian shan on 2021/6/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let humman = Human.init()
        let a2 = Dog.init(hunman: humman)
        a2.useHandLang()
        let a3 = Cat.init(hunman: humman)
        a3.useHandLang()
    }
}
protocol Target { func useHandLang() }

class Human {
    init() {}
    func speak() { print("speak human language") }
}
class Dog: Target {
    var hunman = Human.init()
    init(hunman: Human) {
        self.hunman = hunman
    }
    func useHandLang() { self.hunman.speak() }
}
class Cat: Target {
    var hunman = Human.init()
    init(hunman: Human) {
        self.hunman = hunman
    }
    func useHandLang() { self.hunman.speak() }
}
class Adaptor: Human, Target {
    func useHandLang() { super.speak() }
}
