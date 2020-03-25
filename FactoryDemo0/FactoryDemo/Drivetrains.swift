//
//  Drivetrains.swift
//  FactoryDemo
//
//  Created by mac on 2018/12/16.
//  Copyright © 2018 TLLTD. All rights reserved.
//

import Foundation

protocol Drivetrain {
    
    var driveType: DriveOption { get }
}

enum DriveOption {
    case FRONT
    case REAR
    case ALL
}

class FrontWheelDrive: Drivetrain {
    
    var driveType = DriveOption.FRONT
}

class RearWheelDrive: Drivetrain {
    
    var driveType = DriveOption.REAR
}

class AllWheelDrive: Drivetrain {
    
    var driveType = DriveOption.ALL
}
