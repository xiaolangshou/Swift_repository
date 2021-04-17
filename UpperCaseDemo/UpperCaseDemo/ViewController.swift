//
//  ViewController.swift
//  UpperCaseDemo
//
//  Created by lian shan on 2021/4/6.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let str = "tttClll"

        print(str.capitalizeFirstLetter())
    }
}


extension String {
    func capitalizeFirstLetter() -> String {
        return prefix(1).uppercased() + self.dropFirst()
    }

    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}

