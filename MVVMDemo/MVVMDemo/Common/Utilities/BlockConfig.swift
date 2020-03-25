//
//  BlockConfig.swift
//  MVVMDemo
//
//  Created by mac on 2018/12/3.
//  Copyright © 2018 Liu Tao. All rights reserved.
//

import UIKit

protocol BlockConfig {}

extension NSObject: BlockConfig {}

extension BlockConfig {
    
    @discardableResult
    func setup(_ closure: (Self) -> Void) -> Self {
        closure(self)
        
        return self
    }
}

