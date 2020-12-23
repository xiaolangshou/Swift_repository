//
//  ViewController.swift
//  ResizeableImg
//
//  Created by lian shan on 2020/12/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let imageView = UIImageView(frame: CGRect(x:10, y:100, width:100, height:100))


        if let img = UIImage(named: "111") {
            let resizable = img.resizableImage(withCapInsets: UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40), resizingMode: .stretch)

            imageView.image = resizable
            view.addSubview(imageView)
        }

    }


}

