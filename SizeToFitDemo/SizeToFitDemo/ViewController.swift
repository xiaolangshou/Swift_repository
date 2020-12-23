//
//  ViewController.swift
//  SizeToFitDemo
//
//  Created by lian shan on 2020/12/23.
//

import UIKit

class ViewController: UIViewController {

    let lbl = UILabel.init(frame: CGRect.init(x: 10,
                                              y: 100,
                                              width: 100,
                                              height: 500))

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(lbl)
        lbl.text = "sdfgsdjgklsjdfgkjsdfkgjsdlkfgjsoidjglsdfgsdjfgkljsdklfglksdjfgdjfglkjsdflkgjsdlfkgjlksdjfglkdjfglkdjfglksjdfkgjdflkgjslkdfjglksdfjgklsdfjgskdfjglksdfjglksdfjglksdjfglkdjlgfdgldkfgjlsdkfjgkldjfgkl"
        lbl.backgroundColor = UIColor.cyan
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        lbl.sizeToFit()
    }


}

