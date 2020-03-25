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
    
<<<<<<< HEAD
    class func createMouse() -> Mouse { fatalError("nothing") }
    
    class func createKeyBo() -> Keybo { fatalError("nothing") }
=======
    func createMouse() -> Mouse { fatalError() }
    
    func createKeyBo() -> Keybo { fatalError() }
>>>>>>> ba9f9109965b4760819b84ac3ff1ddf87dd3818a

}
