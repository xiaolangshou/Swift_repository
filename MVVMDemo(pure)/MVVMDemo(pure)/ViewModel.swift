//
//  ViewModel.swift
//  MVVMDemo(pure)
//
//  Created by Thomas Lau on 2020/9/29.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

protocol ViewModelProtocol {
    
    var greeting: String? { get }
    var greetingDidchange: ((ViewModelProtocol) -> ())? { get set }
    
    init(person: Person)
    
    func showGreeting()
}

class ViewModel: ViewModelProtocol {
    
    let person: Person
    
    var greeting: String? {
        didSet {
            self.greetingDidchange?(self)
        }
    }
    
    var greetingDidchange: ((ViewModelProtocol) -> ())?
    
    // 绑定模型
    required init(person: Person) {
        self.person = person
    }
    
    // 数据解析
    func showGreeting() {
        self.greeting = "Hello" + self.person.firstName! + " " + self.person.lastName!
    }
}
