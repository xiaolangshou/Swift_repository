//
//  ViewController.swift
//  CalculateUILabelHeightDemo
//
//  Created by lian shan on 2021/7/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let h = calculateHeight(msg: "alskdjflasjdflksjdf",
                                width: UIScreen.main.bounds.size.width)
        print(h)
    }


}

class ComputeSize {

    func calculateHeight(msg: String, width: CGFloat) -> CGFloat {
        let lbl = UILabel.init()
        lbl.text = msg
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.numberOfLines = 0
        lbl.lineBreakMode = .byWordWrapping
        let size = lbl.sizeThatFits(CGSize.init(width: width, height: CGFloat.greatestFiniteMagnitude))

        return size.height
    }
}
