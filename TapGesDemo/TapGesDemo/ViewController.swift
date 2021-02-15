//
//  ViewController.swift
//  TapGesDemo
//
//  Created by lian shan on 2021/1/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        let view1 = UIView.init(frame: CGRect.init(x: 100, y: 90, width: 200, height: 200))
//        self.view.addSubview(view1)
//        view1.backgroundColor = UIColor.cyan
//
//
//        let view0 = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
//        view1.addSubview(view0)
//        view0.backgroundColor = UIColor.orange
//        view0.tag = 0
//        let tap0 = UITapGestureRecognizer(target: self, action: #selector(ViewController.tap0click(tap:)))
//        view0.addGestureRecognizer(tap0)
//        tap0.delegate = self
//
//
//        let tap2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.tap2click(tap:)))
//        self.view.addGestureRecognizer(tap2)
//        self.view.tag = 2

        let lbl = UILabel.init(frame: CGRect.init(x: 10, y: 20, width: 100, height: 100))
        let atr1 = NSMutableAttributedString.init(string: "thomas",
                                           attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
        let atr2 = NSAttributedString.init(string: "aaa",
                                           attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
        atr1.append(atr2)
        lbl.attributedText = atr1
        view.addSubview(lbl)
    }

    @objc func tap0click(tap: UITapGestureRecognizer) {
        print("tap 0 click")
    }

    @objc func tap2click(tap: UITapGestureRecognizer) {
        print("tap 2 click")
    }

}

extension ViewController: UIGestureRecognizerDelegate {

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return true
    }

    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }

}
