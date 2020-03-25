//
//  DellMouse.swift
//  AbstractFac
//
//  Created by Thomas Lau on 2020/3/7.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class DellMouse: Mouse {

    static let shared = DellMouse()
    
    func logo() {
        print("dell mouse logo")
    }
}
