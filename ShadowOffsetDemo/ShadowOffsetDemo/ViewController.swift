//
//  ViewController.swift
//  ShadowOffsetDemo
//
//  Created by lian shan on 2021/2/4.
//

import UIKit

class ViewController: UIViewController {

    let cardView = UIView.init(frame: CGRect.init(x: 60, y: 100, width: 100, height: 60))

    override func viewDidLoad() {
        super.viewDidLoad()

        cardView.backgroundColor = UIColor.white
        self.view.addSubview(cardView)
        cardView.layer.cornerRadius = 6.0
//        cardView.clipsToBounds = true
        cardView.layer.shadowColor = UIColor.red.cgColor
        cardView.layer.shadowOpacity = 0.5
        cardView.layer.shadowRadius = 2
        cardView.layer.shadowOffset = CGSize(width: 2, height: 2)
    }
    
}

