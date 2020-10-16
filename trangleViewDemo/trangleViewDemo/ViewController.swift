//
//  ViewController.swift
//  trangleViewDemo
//
//  Created by lian shan on 2020/10/15.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let t = TriangleView.init(frame: CGRect.init(x: 50, y: 100, width: 50, height: 50))
        
        view.addSubview(t)
    }


}

class TriangleView : UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
         setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }

    override func draw(_ rect: CGRect) {

        guard let context = UIGraphicsGetCurrentContext() else { return }

        context.beginPath()
        context.move(to: CGPoint(x: rect.minX, y: rect.minY))
        context.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        context.addLine(to: CGPoint(x: (rect.maxX / 2.0), y: rect.maxY))
        context.closePath()

        context.setFillColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1)
        context.fillPath()
    }
    
    func setupView() {
//        //渐变设置
//        let colorOne = UIColor.green
//        let colorTwo = UIColor.red
//
//        let colors = [colorOne.cgColor,colorTwo.cgColor]
//
//        let gradient = CAGradientLayer()
//        //设置开始和结束位置(通过开始和结束位置来控制渐变的方向)
//        gradient.startPoint = CGPoint.init(x: 0, y: 0.5)
//        gradient.endPoint = CGPoint.init(x: 1, y: 0.5)
//        gradient.colors = colors;
//        gradient.frame = self.bounds
//
//        self.layer.insertSublayer(gradient, at: 0)
        
        self.backgroundColor = UIColor.white
    }
}
