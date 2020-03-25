//
//  DellMouseFac.swift
//  FactoryDemo
//
//  Created by Thomas Lau on 2020/3/7.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class DellMouseFac: MouseFac {

    override class func createMouse() -> Mouse {
        return DellMouse.shared
    }
}
