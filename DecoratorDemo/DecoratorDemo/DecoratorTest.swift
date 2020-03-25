//
//  DecoratorTest.swift
//  DecoratorDemo
//
//  Created by mac on 2019/1/29.
//  Copyright © 2019 TLLTD. All rights reserved.
//

import UIKit

class DecoratorTest: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let source = Source()
        let obj = Decorator.init(source: source)
        obj.method()
    }

}
