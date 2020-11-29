//
//  ViewController.swift
//  DebugPrintDemo
//
//  Created by lian shan on 2020/11/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DLog(message: [1,2,3,[1:"11",2:"22"]])
    }


}

