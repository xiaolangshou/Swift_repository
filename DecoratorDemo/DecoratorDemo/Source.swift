//
//  Source.swift
//  DecoratorDemo
//
//  Created by mac on 2019/1/29.
//  Copyright © 2019 TLLTD. All rights reserved.
//

import Foundation

protocol Sourceable {
    
    func method()
}

class Source: Sourceable {
    
    func method() {
        print("the original method")
    }

}

