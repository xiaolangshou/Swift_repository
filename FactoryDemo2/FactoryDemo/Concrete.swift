//
//  Concrete.swift
//  FactoryDemo
//
//  Created by mac on 2018/12/16.
//  Copyright © 2018 TLLTD. All rights reserved.
//

import Foundation

class CompactCarFactory: CarFactory {
    
    override func createSuspension() -> Suspension {
        
        return RoadSuspension()
    }
    
    override func createDrivetrain() -> Drivetrain {
        
        return FrontWheelDrive()
    }
}

class SportsCarFactory: CarFactory {
    
    override func createSuspension() -> Suspension {
        
        return RaceSuspension()
    }
    
    override func createDrivetrain() -> Drivetrain {
        
        return RearWheelDrive()
    }
}

class SUVCarFactory: CarFactory {
    
    override func createSuspension() -> Suspension {
        
        return OffRoadSuspension()
    }
    
    override func createDrivetrain() -> Drivetrain {
        
        return AllWheelDrive()
    }
}
