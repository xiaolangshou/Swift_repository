//
//  DellKeybo.swift
//  AbstractFac
//
//  Created by Thomas Lau on 2020/3/7.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class DellKeybo: Keybo {
    
    static let shared = DellKeybo()

    func logo() {
        print("dell keybo logo")
    }
}
