//
//  ViewController.swift
//  OnePixelLineDemo
//
//  Created by Thomas Lau on 2020/5/29.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

let SINGLE_LINE_WIDTH = 1 / UIScreen.main.scale
let SINGLE_LINE_ADJUST_OFFSET = (1 / UIScreen.main.scale) / 2

class ViewController: UIViewController {
    
    let line = UIView.init(frame: CGRect.init(x: 0, y: 101 - SINGLE_LINE_ADJUST_OFFSET, width: 100, height: SINGLE_LINE_WIDTH))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let s = UIScrollView.init(frame: CGRect.init(x: 0,
                                                     y: 0,
                                                     width: UIScreen.main.bounds.size.width,
                                                     height: UIScreen.main.bounds.size.height))
        
        view.addSubview(s)
        s.alwaysBounceVertical = true
        
        
        
        s.addSubview(line)
        line.backgroundColor = UIColor.black
    }
}
