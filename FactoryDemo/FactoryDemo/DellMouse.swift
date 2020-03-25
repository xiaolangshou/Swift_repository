//
//  DellMouse.swift
//  FactoryDemo
//
//  Created by Thomas Lau on 2020/3/7.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import Foundation

class DellMouse: Mouse {
    
    static let shared = DellMouse()
    
    func logo() {
        print("dell logo")
    }
}
