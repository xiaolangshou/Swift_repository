//
//  ViewController.swift
//  BridgeDemo
//
//  Created by lian shan on 2021/6/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let army = Army.init(transport: RoadTransportation.init())
        army.gotoBattleFieldBy()
        let army2 = Army.init(transport: AirTransportation.init())
        army2.gotoBattleFieldBy()
    }
}
class ArmedForces {
    var transport = Transportation.init()
    init(transport: Transportation) {
        self.transport = transport
    }
    func gotoBattleFieldBy() { print("goto Battle Field \(self.transport.transport())") }
}
class Army: ArmedForces {
    override func gotoBattleFieldBy() { print("army goto Battle Field \(self.transport.transport()) ") }
}
class Navy: ArmedForces {
    override func gotoBattleFieldBy() { print("navy goto Battle Field \(self.transport.transport())") }
}
class AirForce: ArmedForces {
    override func gotoBattleFieldBy() { print("airforce goto Battle Field \(self.transport.transport())") }
}
class Transportation {
    init() {}
    func transport() -> String { return "transport" }
}
class AirTransportation: Transportation {
    override func transport() -> String { return "by air" }
}
class RoadTransportation: Transportation {
    override func transport() -> String { return "by road" }
}
class SeaTransportation: Transportation {
    override func transport() -> String { return "by sea" }
}
