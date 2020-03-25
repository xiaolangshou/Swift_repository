//
//  ProgressView.swift
//  CALayer Demo
//
//  Created by Thomas Lau on 2018/4/9.
//  Copyright © 2018年 Thomas Lau. All rights reserved.
//

import UIKit

class ProgressView: UIView {

    var value = Float(0) {
        didSet {
            _progressLayer.strokeEnd = CGFloat(value)
        }
    }
    
    var progressStrokeColor = UIColor.green {
        didSet {
            _progressLayer.strokeColor = progressStrokeColor.cgColor
        }
    }
    
    var progressBackStrokeColor = UIColor.lightGray {
        didSet {
            _progressBackLayer.strokeColor = progressBackStrokeColor.cgColor
        }
    }
    
    var homeBriefGoalTime = [Int]() {
        didSet {
            for homeGoal in homeBriefGoalTime {
                _homeGoalValue = Int(UIScreen.main.bounds.width) * homeGoal / 90
                self.layoutSubviews()
            }
        }
    }
    
    var homeBriefRedCard = [Int]() {
        didSet {
            for homeRed in homeBriefRedCard {
                _homeRedCardValue = Int(UIScreen.main.bounds.width) * homeRed / 90
                self.layoutSubviews()
            }
        }
    }
    
    var homeBriefYellowRedCard = [Int]() {
        didSet {
            for homeYellowRed in homeBriefYellowRedCard {
                _homeYellowRedCardValue = Int(UIScreen.main.bounds.width) * homeYellowRed / 90
                self.layoutSubviews()
            }
        }
    }
    
    var homeBriefYellowCard = [Int]() {
        didSet {
            for homeYellow in homeBriefYellowCard {
                _homeYellowCardValue = Int(UIScreen.main.bounds.width) * homeYellow / 90
                self.layoutSubviews()
            }
        }
    }

    var homeCornerTime = [Int]() {
        didSet {
            for homeCorner in homeCornerTime {
                _homeCornerValue = Int(UIScreen.main.bounds.width) * homeCorner / 90
                self.layoutSubviews()
            }
        }
    }
    
    var awayBriefGoalTime = [Int]() {
        didSet {
            for awayGoal in awayBriefGoalTime {
                _awayGoalValue = Int(UIScreen.main.bounds.width) * awayGoal / 90
                self.layoutSubviews()
            }
        }
    }

    var awayBriefRedCard = [Int]() {
        didSet {
            for awayRed in awayBriefRedCard {
                _awayRedCardValue = Int(UIScreen.main.bounds.width) * awayRed / 90
                self.layoutSubviews()
            }
        }
    }
    
    var awayBriefYellowRedCard = [Int]() {
        didSet {
            for awayYellowRed in awayBriefYellowRedCard {
                _awayYellowRedCardValue = Int(UIScreen.main.bounds.width) * awayYellowRed / 90
                self.layoutSubviews()
            }
        }
    }
    
    var awayBriefYellowCard = [Int]() {
        didSet {
            for awayYellow in awayBriefYellowCard {
                _awayYellowCardValue = Int(UIScreen.main.bounds.width) * awayYellow / 90
                self.layoutSubviews()
            }
        }
    }
    
    var awayCornerTime = [Int]() {
        didSet {
            for awayCorner in awayCornerTime {
                _awayCornerValue = Int(UIScreen.main.bounds.width) * awayCorner / 90
                self.layoutSubviews()
            }
        }
    }
    
    private let _progressLayer = CAShapeLayer()
    private let _progressBackLayer = CAShapeLayer()
    
    private var _homeGoalValue: Int?
    private var _homeRedCardValue: Int?
    private var _homeYellowRedCardValue: Int?
    private var _homeYellowCardValue: Int?
    private var _homeCornerValue: Int?
    
    private var _awayGoalValue: Int?
    private var _awayRedCardValue: Int?
    private var _awayYellowRedCardValue: Int?
    private var _awayYellowCardValue: Int?
    private var _awayCornerValue: Int?
    
    private let _centerScaleLabel = UILabel()
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupViews()
    }
    
    private func setupViews() {
        
        _progressBackLayer.fillColor = UIColor.clear.cgColor
        _progressBackLayer.strokeColor = progressBackStrokeColor.cgColor
        _progressBackLayer.strokeStart = 0.0
        _progressBackLayer.lineWidth = 2.0
        layer.addSublayer(_progressBackLayer)
        
        _progressLayer.fillColor = UIColor.clear.cgColor
        _progressLayer.strokeColor = progressStrokeColor.cgColor
        _progressLayer.lineWidth = 2.0
        layer.addSublayer(_progressLayer)
        
        _centerScaleLabel.text = "H"
        _centerScaleLabel.textColor = UIColor.red
        _centerScaleLabel.backgroundColor = progressStrokeColor
        _centerScaleLabel.layer.cornerRadius = 5
        _centerScaleLabel.clipsToBounds = true
        layer.addSublayer(_centerScaleLabel.layer)
        _centerScaleLabel.layer.frame = CGRect(x: UIScreen.main.bounds.width * 0.5, y: -5.5, width: 11, height: 11)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: 2))
        bezierPath.addLine(to: CGPoint(x: frame.width, y: 2))
        
        _progressLayer.path = bezierPath.cgPath
        _progressLayer.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: 2)
        _progressBackLayer.path = bezierPath.cgPath
        _progressBackLayer.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: 2)
        
        if let homeGoal = _homeGoalValue {
            let homeGoalLayer = CAShapeLayer()
            homeGoalLayer.fillColor = UIColor.clear.cgColor
            homeGoalLayer.contents = UIImage(named: "score_now_icon_goal")?.cgImage
            homeGoalLayer.frame = CGRect(x: homeGoal, y: -5 - 14, width: 12, height: 14)
            layer.addSublayer(homeGoalLayer)
        }
        
        if let homeRedCard = _homeRedCardValue {
            let homeRedCardLayer = CAShapeLayer()
            homeRedCardLayer.contents = UIImage(named: "score_icon_red_card")?.cgImage
            homeRedCardLayer.frame = CGRect(x: homeRedCard, y: -5 - 14, width: 9, height: 14)
            layer.addSublayer(homeRedCardLayer)
        }
        
        if let homeYellowRedCard = _homeYellowRedCardValue {
            let homeYellowRedCardLayer = CAShapeLayer()
            homeYellowRedCardLayer.contents = UIImage(named: "score_now_icon_yellow_red_card")?.cgImage
            homeYellowRedCardLayer.frame = CGRect(x: homeYellowRedCard, y: -5 - 14, width: 13, height: 14)
            layer.addSublayer(homeYellowRedCardLayer)
        }
        
        if let homeYellowCard = _homeYellowCardValue {
            let homeYellowCardLayer = CAShapeLayer()
            homeYellowCardLayer.contents = UIImage(named: "score_now_icon_yellow_card")?.cgImage
            homeYellowCardLayer.frame = CGRect(x: homeYellowCard, y: -5 - 14, width: 9, height: 14)
            layer.addSublayer(homeYellowCardLayer)
        }
        
        if let homeCorner = _homeCornerValue {
            let homeCornerLayer = CAShapeLayer()
            homeCornerLayer.contents = UIImage(named: "score_now_icon_corner_ball")?.cgImage
            homeCornerLayer.frame = CGRect(x: homeCorner, y: -5 - 14, width: 9, height: 14)
            layer.addSublayer(homeCornerLayer)
        }
        
        if let awayGoal = _awayGoalValue {
            let awayGoalLayer = CAShapeLayer()
            awayGoalLayer.contents = UIImage(named: "score_now_icon_goal")?.cgImage
            awayGoalLayer.frame = CGRect(x: awayGoal, y: 5, width: 12, height: 14)
            layer.addSublayer(awayGoalLayer)
        }
        
        if let awayRedCard = _awayRedCardValue {
            let awayRedCardLayer = CAShapeLayer()
            awayRedCardLayer.contents = UIImage(named: "score_icon_red_card")?.cgImage
            awayRedCardLayer.frame = CGRect(x: awayRedCard, y: 5, width: 9, height: 14)
            layer.addSublayer(awayRedCardLayer)
        }
        
        if let awayYellowRedCard = _awayYellowRedCardValue {
            let awayYellowRedCardLayer = CAShapeLayer()
            awayYellowRedCardLayer.contents = UIImage(named: "score_now_icon_yellow_red_card")?.cgImage
            awayYellowRedCardLayer.frame = CGRect(x: awayYellowRedCard, y: 5, width: 13, height: 14)
            layer.addSublayer(awayYellowRedCardLayer)
        }
        
        if let awayYellowCard = _awayYellowCardValue {
            let awayYellowCardLayer = CAShapeLayer()
            awayYellowCardLayer.contents = UIImage(named: "score_now_icon_yellow_card")?.cgImage
            awayYellowCardLayer.frame = CGRect(x: awayYellowCard, y: 5, width: 9, height: 14)
            layer.addSublayer(awayYellowCardLayer)
        }
        
        if let awayCorner = _awayCornerValue {
            let awayCornerLayer = CAShapeLayer()
            awayCornerLayer.contents = UIImage(named: "score_now_icon_corner_ball")?.cgImage
            awayCornerLayer.frame = CGRect(x: awayCorner, y: 5, width: 9, height: 14)
            layer.addSublayer(awayCornerLayer)
        }

    }
    
}
