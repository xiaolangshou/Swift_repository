//
//  ViewController.swift
//  GradientLayerDemo
//
//  Created by lian shan on 2021/1/6.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let numTF = LAPBottomLineTF()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let v = UIButton()
//        view.addSubview(v)
//        v.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.width.height.equalTo(200)
//        }
//        v.layoutIfNeeded()
//        UIView.createGradientLayer(view: v, color1: UIColor.orange, color2: UIColor.systemPink, radius: 6)
//        v.setTitle("asdfdf", for: UIControl.State.normal)

        self.numTF.prefixNo = "80"
        self.numTF.serverTips = "servertips"
        self.numTF.needCheckCard = true
        self.numTF.needTFDidEditing = true
        self.numTF.placeHolder = "place holder..."
        self.numTF.backgroundColor = UIColor.red

        let inputInfoStackV = UIStackView()

        inputInfoStackV.axis = .vertical
        inputInfoStackV.distribution = .fillEqually
        inputInfoStackV.spacing = 15
        view.addSubview(inputInfoStackV)
        inputInfoStackV.snp.makeConstraints { make in
            make.left.equalTo(15)
            make.top.equalTo(100)
            make.right.equalTo(-15)
            make.height.equalTo(75)
        }

        inputInfoStackV.addArrangedSubview(numTF)
        inputInfoStackV.backgroundColor = UIColor.cyan

    }
}

extension UIView {

    static func createGradientLayer(view: UIView,
                                    color1: UIColor,
                                    color2: UIColor,
                                    radius: CGFloat)
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [color1.cgColor, color2.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        view.layer.insertSublayer(gradientLayer, at: 0)

        view.layer.cornerRadius = radius
        view.clipsToBounds = true
   }
}
