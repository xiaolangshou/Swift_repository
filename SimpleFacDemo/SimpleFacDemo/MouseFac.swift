//
//  MouseFac.swift
//  SimpleFacDemo
//
//  Created by Thomas Lau on 2020/3/7.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

protocol Mouse {
    func logo()
}

class MouseFac {
    
    enum FacType: Int {
        case Dell = 0
        case HP = 1
    }
    
    class func createMouse(type: FacType) -> Mouse {
        switch type {
        case .Dell:
            return DellMouse.shared
        case .HP:
            return HPMouse.shared
        }
    }

}
