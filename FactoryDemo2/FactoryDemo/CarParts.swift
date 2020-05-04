//
//  CarParts.swift
//  FactoryDemo
//
//  Created by mac on 2018/12/16.
//  Copyright © 2018 TLLTD. All rights reserved.
//

import Foundation

enum Cars {
    
    case COMPACT
    case SPORTS
    case SUV
}

struct Car {
    
    var carType: Cars
    var suspension: Suspension
    var drive: Drivetrain
    
    init(carType: Cars) {
        
        let concreteFactory = CarFactory.getFactory(car: carType)
        self.suspension = concreteFactory.createSuspension()
        self.drive = concreteFactory.createDrivetrain()
        self.carType = carType
    }
    
    func printDetials() {
        
        print("successfully created in command")
    }
}
