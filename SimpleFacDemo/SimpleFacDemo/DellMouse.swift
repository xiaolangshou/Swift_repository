//
//  DellMouseFac.swift
//  SimpleFacDemo
//
//  Created by Thomas Lau on 2020/3/7.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class DellMouse: Mouse {
    
    static let shared = DellMouse()
    
    public func logo() {
        print("Dell logo")
    }

}
