//
//  MouseFac.swift
//  FactoryDemo
//
//  Created by Thomas Lau on 2020/3/7.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import Foundation

protocol Mouse {

    func logo()
}

class MouseFac {
    
    class func createMouse() -> Mouse {
        fatalError("Not implemented")
    }
}
