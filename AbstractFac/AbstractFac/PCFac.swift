//
//  PCFac.swift
//  AbstractFac
//
//  Created by Thomas Lau on 2020/3/7.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import Foundation

protocol Mouse {
    
    func logo()
}

protocol Keybo {
    
    func logo()
}

class PCFac {
    
    class func createMouse() -> Mouse { fatalError("nothing") }
    
    class func createKeyBo() -> Keybo { fatalError("nothing") }

}
