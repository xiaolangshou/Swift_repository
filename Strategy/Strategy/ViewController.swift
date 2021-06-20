//
//  ViewController.swift
//  Strategy
//
//  Created by lian shan on 2021/6/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let mng = StrategyMng.init(strategy: WaterArmy.init())
        mng.excute()
        let mng2 = StrategyMng.init(strategy: OriginalArticle.init())
        mng2.excute()
        let mng3 = StrategyMng.init(strategy: ByAdvertising.init())
        mng3.excute()
    }
}
class Strategy {
    init() { }
    func increaseFans() {}
}
class WaterArmy: Strategy {
    override func increaseFans() {
        print("increase fans by hiring water army")
    }
}
class OriginalArticle: Strategy {
    override func increaseFans() {
        print("increase fans by writing original article")
    }
}
class ByAdvertising: Strategy {
    override func increaseFans() {
        print("increase fans by advertising")
    }
}
class StrategyMng {
    var strategy = Strategy()
    init(strategy: Strategy) {
        self.strategy = strategy
    }
    func excute() {
        self.strategy.increaseFans()
    }
}
