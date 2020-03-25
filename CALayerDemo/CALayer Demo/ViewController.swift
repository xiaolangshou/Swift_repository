//
//  ViewController.swift
//  CALayer Demo
//
//  Created by Thomas Lau on 2018/4/9.
//  Copyright © 2018年 Thomas Lau. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    // private let progressView = ProgressView()
    let progressView = CProgressView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // setupProgressView()
        progressView.backgroundColor = UIColor.cyan
        view.addSubview(progressView)
        progressView.progress = Float(40)/100
        progressView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(100)
        }
        
    }
    
//    fileprivate func setupDashLineView() {
//
//        let lineView = UIView(frame: CGRect(x: 0, y: 300, width: self.view.frame.width, height: 2))
//        self.view.addSubview(lineView)
//
//        let shapeLayer = CAShapeLayer()
//        shapeLayer.bounds = lineView.bounds
//        shapeLayer.position = CGPoint(x: lineView.frame.width / 2, y: lineView.frame.height / 2)
//
//        shapeLayer.fillColor = UIColor.clear.cgColor
//        shapeLayer.strokeColor = UIColor.red.cgColor
//
//        shapeLayer.lineWidth = 2
//        shapeLayer.lineJoin = kCALineJoinRound
//        shapeLayer.lineDashPhase = 0
//        shapeLayer.lineDashPattern = [NSNumber(value: 6), NSNumber(value: 6)]
//
//        let path = CGMutablePath()
//        path.move(to: CGPoint(x: 0, y: 10))
//        path.addLine(to: CGPoint(x: lineView.frame.width, y: 10))
//        shapeLayer.path = path
//
//        lineView.layer.addSublayer(shapeLayer)
//    }
//
//    fileprivate func setupProgressView() {
//
//        progressView.value = 0.6
//
//        progressView.homeBriefGoalTime = [9, 12, 80]
//        progressView.homeBriefRedCard = [23, 45]
//        progressView.homeBriefYellowRedCard = [15]
//        progressView.homeBriefYellowCard = [27, 88]
//        progressView.homeCornerTime = [56, 77]
//
//        progressView.awayBriefGoalTime = [45, 55, 60]
//        progressView.awayBriefRedCard = [6, 80]
//        progressView.awayBriefYellowRedCard = [10]
//        progressView.awayBriefYellowCard = [44, 66]
//        progressView.awayCornerTime = [87]
//
//        progressView.backgroundColor = UIColor.cyan
//        progressView.progressStrokeColor = UIColor.red
//        progressView.progressBackStrokeColor = UIColor.white
//        progressView.frame = CGRect(x: 0, y: 200, width: view.frame.width, height: 50)
//        view.addSubview(progressView)
//    }


}

