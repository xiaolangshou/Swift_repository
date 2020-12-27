//
//  ViewController.swift
//  Aaa
//
//  Created by Thomas Lau on 2020/10/11.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let lbl = UILabel.init(frame: CGRect.init(x: 100,
                                              y: 200,
                                              width: 150,
                                              height: 50))

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.cyan
        
        title = "aaa"
        
        
        view.addSubview(lbl)
        lbl.text = "ni hao ma"
    }


}

