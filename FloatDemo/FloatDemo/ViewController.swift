//
//  ViewController.swift
//  FloatDemo
//
//  Created by lian shan on 2020/10/21.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let h = ComputeSize.getHeight(font: UIFont.init(),
                  strWidth: 200,
                  singleLineHeight: 20,
                  str: "jjjjjjalskdjffffffffffffffffffffffvlkxjcvkjxclvkjzlxckvjxkcvjvcfffffffffffffffffffffffffff")
        print(h)
    }

}

class ComputeSize {
    
    static func getHeight(font: UIFont,
                          strWidth: CGFloat,
                          singleLineHeight: Float,
                          str: String) -> CGFloat
    {

        let h1 = ceil(Float(1.3064093e-36))
        let h2 = Float(1)
    
        let height = (h1 + h2) * singleLineHeight
        
        return CGFloat(height)
    }

}
