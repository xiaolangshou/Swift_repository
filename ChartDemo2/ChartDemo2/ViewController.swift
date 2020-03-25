//
//  ViewController.swift
//  ChartDemo2
//
//  Created by Liu Tao on 2018/12/6.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {

    let barChartView = BarChartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(barChartView)
        barChartView.frame = CGRect(x: 0,
                                    y: 0,
                                    width: UIScreen.main.bounds.size.width,
                                    height: UIScreen.main.bounds.size.height)
    }

    
    func setupView() {
        
    }

}

