//
//  ViewController.swift
//  SixPrincipleDemo2
//
//  Created by lian shan on 2021/6/3.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("不使用依赖倒置原则")
        let driver = Driver1()
        driver.driveBenz(benz: Benz.init())
        driver.driveBMW(bmw: BMW.init())
        driver.driveVW(vw: VW.init())
        print("\n使用依赖倒置原则")
        let driver2 = Driver2()
        let car1 = MecedesBenz.init()
        let car2 = BayerischeMotorenWerke.init()
        let car3 = VolksWagan.init()
        driver2.driveCar(car: car1)
        driver2.driveCar(car: car2)
        driver2.driveCar(car: car3)
    }
}
class Driver1 {
    init() {}
    func driveBenz(benz: Benz) { benz.run() }
    func driveBMW(bmw: BMW) { bmw.run() }
    func driveVW(vw: VW) { vw.run() }
}
class Benz {
    init() {}
    func run() { print("run Benz") }
}
class BMW {
    init() {}
    func run() { print("run BMW") }
}
class VW {
    init() {}
    func run()  { print("run VolksWagan") }
}
class Driver2 {
    init() {}
    func driveCar(car: Car) { car.run()}
}
class Car {
    init() {}
    func run() { print("") }
}
class MecedesBenz: Car {
    override init() {}
    override func run() { print("run Benz") }
}
class BayerischeMotorenWerke: Car {
    override init() {}
    override func run() { print("run BMW") }
}
class VolksWagan: Car {
    override init() {}
    override func run()  { print("run VolksWagan") }
}
