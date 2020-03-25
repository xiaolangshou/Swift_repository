//
//  ViewController.swift
//  ProgressViewDemo
//
//  Created by DDTogezer on 2018/4/4.
//  Copyright © 2018年 ThomasLau. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    fileprivate let _progressView = UIProgressView()
    fileprivate let _dateView = DateCalendarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setupProgressView()
        setupDateView()
    }
    
    func setupDateView() {
        
        view.addSubview(_dateView)
        _dateView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func setupProgressView() {
        
        view.addSubview(_progressView)
        _progressView.snp.makeConstraints { make in
            make.height.equalTo(2)
            make.width.equalTo(UIScreen.main.bounds.width * 0.6)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-20)
        }
        
        _progressView.setProgress(0.8, animated: true)
        _progressView.progressTintColor = UIColor.green
        _progressView.trackTintColor = UIColor.gray
    }

}

