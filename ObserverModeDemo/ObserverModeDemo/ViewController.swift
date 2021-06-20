//
//  ViewController.swift
//  ObserverModeDemo
//
//  Created by lian shan on 2021/6/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let subject = Subject.init()
        subject.registerObserver(observer: Observer.init(name: "thomas", id: "123"))
        subject.registerObserver(observer: Observer.init(name: "lily", id: "456"))

        subject.notifyObservers(msg: "eat supper")
    }

}

// Subject: register、remove、notify
// Observer：update

protocol SubjectProtocol {
    func registerObserver(observer: Observer)
    func removeObserver(observer: Observer)
    func notifyObservers(msg: String)
}

protocol ObserverProtocol {
    func updateMsg(msg: String)
}

class Subject: SubjectProtocol {

    var observers: [Observer] = []

    init() {}

    func registerObserver(observer: Observer) {
        observers.append(observer)
    }

    func removeObserver(observer: Observer) {
        for (i,v) in observers.enumerated() {
            if v == observer {
                observers.remove(at: i)
            }
        }
    }

    func notifyObservers(msg: String) {
        for v in observers {
            v.updateMsg(msg: msg)
        }
    }
}

class Observer: ObserverProtocol {

    let name: String
    let id: String

    init(name: String, id: String) {
        self.name = name
        self.id = id
    }

    func updateMsg(msg: String) {
        print("updating msg:\(msg) from subject")
    }
}

extension Observer: Equatable {

    static func == (l: Observer, r: Observer) -> Bool {
        return l.name == r.name && l.id == r.id
    }
}
