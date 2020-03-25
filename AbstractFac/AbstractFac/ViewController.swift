//
//  ViewController.swift
//  AbstractFac
//
//  Created by Thomas Lau on 2020/3/7.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
<<<<<<< HEAD
        let hp = HPFac.createMouse()
        hp.logo()
        let dell = DellFac.createKeyBo()
        dell.logo()
=======
        let dell = DellFac.init().createMouse()
        dell.logo()
        let keybo = HPFac.init().createKeyBo()
        keybo.logo()
>>>>>>> ba9f9109965b4760819b84ac3ff1ddf87dd3818a
    }
}

