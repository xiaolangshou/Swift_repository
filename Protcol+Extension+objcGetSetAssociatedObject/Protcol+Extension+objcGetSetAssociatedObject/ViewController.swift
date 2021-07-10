//
//  ViewController.swift
//  Protcol+Extension+objcGetSetAssociatedObject
//
//  Created by lian shan on 2021/7/4.
//

import UIKit

class ViewController: UIViewController, ConfigProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.setConfig(config: Config.init(name: "Thomas Lau"))

        print(self.getConfig()!.name)
    }

}
