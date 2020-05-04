
//
//  Suspension.swift
//  FactoryDemo
//
//  Created by mac on 2018/12/16.
//  Copyright © 2018 TLLTD. All rights reserved.
//

import Foundation

protocol Suspension {
    
    var suspensionType: SuspensionOption { get }
}

enum SuspensionOption {
    case STANDARD
    case SOFT
    case SPORTS
}

class RoadSuspension: Suspension {
    
    var suspensionType = SuspensionOption.STANDARD
}

class OffRoadSuspension: Suspension {
    
    var suspensionType = SuspensionOption.SOFT
}

class RaceSuspension: Suspension {
    
    var suspensionType = SuspensionOption.SPORTS
}
