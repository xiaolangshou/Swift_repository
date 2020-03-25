
//
//  Abstract.swift
//  FactoryDemo
//
//  Created by mac on 2018/12/16.
//  Copyright © 2018 TLLTD. All rights reserved.
//

import Foundation

class CarFactory {
    
    func createSuspension() -> Suspension {
        fatalError("Not implemented")
    }
    
    func createDrivetrain() -> Drivetrain {
        fatalError("Not implemented")
    }
    
    static func getFactory(car: Cars) -> CarFactory {
        
        var factory: CarFactory
        switch car {
        case .COMPACT:
            factory = CompactCarFactory()
        case .SPORTS:
            factory = SportsCarFactory()
        case .SUV: 
            factory = SUVCarFactory()
        }
        
        return factory
    }
}
