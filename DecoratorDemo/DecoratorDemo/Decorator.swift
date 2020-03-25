//
//  Decorator.swift
//  DecoratorDemo
//
//  Created by mac on 2019/1/29.
//  Copyright © 2019 TLLTD. All rights reserved.
//

import Foundation

class Decorator: Sourceable {
    
    var source: Sourceable
    
    func method() {
        print("before decorator!")
        source.method()
        print("after decorator!")
    }
    
    init(source: Sourceable) {
    
        self.source = source
    }
    
}
