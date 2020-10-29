//
//  ViewController.swift
//  UITextFieldDemo
//
//  Created by lian shan on 2020/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let tf = UITextField.init(frame: CGRect.init(x: 10, y: 90, width: 150, height: 50))
        
        view.addSubview(tf)
        tf.backgroundColor = UIColor.cyan
        tf.clearButtonMode = .whileEditing
        
    }


}

