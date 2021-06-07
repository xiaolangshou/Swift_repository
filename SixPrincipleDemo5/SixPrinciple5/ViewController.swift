//
//  ViewController.swift
//  SixPrinciple5
//
//  Created by lian shan on 2021/6/6.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        print("不使用接口隔离原则")
        let searcher = Searcher(girl: PrettyGril(name: "Lily"))
        searcher.show()

        print("\n使用接口隔离原则")
        let searcher2 = Searcher2(goodLookingGirl: GoodLookingGirl(name: "Dacy"),
                                  niceFigureGirl: NiceFigureGirl(name: "Monica"))
        searcher2.show()
    }
}
class AbstractSearcher {

    internal var girl = IPrettyGril()

    init(girl: IPrettyGril) {
        self.girl = girl
    }
    func show() {}
}

class Searcher: AbstractSearcher {

    override init(girl: IPrettyGril) {
        super.init(girl: girl)
    }

    override func show() {
        print(super.girl.goodLooking())
        print(super.girl.niceFigure())
    }
}

// IPettyGirl的要求是颜值、身材兼具才是美女，这样不能满足每个人的审美观(有人认为颜值高是美女，有人认为身材好是美女)
class IPrettyGril {
    func goodLooking() {}
    func niceFigure() {}
}

class PrettyGril: IPrettyGril {
    private var name = ""
    init(name: String) {
        self.name = name
    }
    override func goodLooking() {
        print("\(name) good looking")
    }

    override func niceFigure() {
        print("\(name) nice figure")
    }
}

// 将IPrettyGril拆分为2个接口
class IGoodLookingGirl {
    func goodLooking() {}
}

class INiceFigureGirl {
    func niceFigure() {}
}

class GoodLookingGirl: IGoodLookingGirl {

    private var name = ""

    init(name: String) {
        self.name = name
    }

    override func goodLooking() {
        print("\(name) good looking")
    }
}

class NiceFigureGirl: INiceFigureGirl {

    private var name = ""

    init(name: String) {
        self.name = name
    }

    override func niceFigure() {
        print("\(name) nice figure")
    }
}

class AbstractSearcher2 {

    internal var goodLookingGirl = IGoodLookingGirl()
    internal var niceFigureGirl = INiceFigureGirl()

    init(goodLookingGirl: IGoodLookingGirl, niceFigureGirl: INiceFigureGirl) {
        self.goodLookingGirl = goodLookingGirl
        self.niceFigureGirl = niceFigureGirl
    }

    func show() {}
}

class Searcher2: AbstractSearcher2 {

    override init(goodLookingGirl: IGoodLookingGirl, niceFigureGirl: INiceFigureGirl) {
        super.init(goodLookingGirl: goodLookingGirl, niceFigureGirl: niceFigureGirl)
    }

    override func show() {

        print(super.goodLookingGirl.goodLooking())
        print(super.niceFigureGirl.niceFigure())
    }
}
