//
//  ViewController.swift
//  SecretReader
//
//  Created by Thomas Lau on 2021/2/17.
//  Copyright © 2021 TLLTD. All rights reserved.
//

import UIKit
import Secrets

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let mng = SecretsManager.init(key: "1234")
        let mng2 = SecretsManager.init()
        mng.func1()
        mng2.func2()
    }

}

