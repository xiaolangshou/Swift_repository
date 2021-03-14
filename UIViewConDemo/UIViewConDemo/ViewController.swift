//
//  ViewController.swift
//  UIViewConDemo
//
//  Created by lian shan on 2021/3/3.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.cyan
        self.modalPresentationStyle = .overCurrentContext
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let vc = UIViewController.init()
        vc.view.frame = UIScreen.main.bounds
        vc.view.backgroundColor = UIColor.yellow
        vc.preferredContentSize = .init(width: UIScreen.main.bounds.width, height: 300)

        self.present(vc, animated: true, completion: nil)
        vc.view.superview?.frame = CGRect.init(x: 0,
                                               y: UIScreen.main.bounds.height - 300,
                                               width: UIScreen.main.bounds.width,
                                               height: 300)

    }
}

