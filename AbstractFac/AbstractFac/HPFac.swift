//
//  HPFac.swift
//  AbstractFac
//
//  Created by Thomas Lau on 2020/3/7.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class HPFac: PCFac {
    
    override class func createMouse() -> Mouse {
        return HPMouse.shared
    }
    
    override class func createKeyBo() -> Keybo {
        return HPKeybo.shared
    }
}
