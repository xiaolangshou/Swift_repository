//
//  ViewController.swift
//  FactoryDemo
//
//  Created by mac on 2018/12/16.
//  Copyright © 2018 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let car = Car.init(carType: Cars.SPORTS)
        car.printDetials()
    }


}

