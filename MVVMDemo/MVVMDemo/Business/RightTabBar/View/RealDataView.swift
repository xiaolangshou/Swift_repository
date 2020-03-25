//
//  RealDataView.swift
//  MVVMDemo
//
//  Created by Liu Tao on 2018/12/17.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit
import SnapKit

class RealDataView: UIView {
    
    typealias DataDic = (key: String, value: String)
    
    var dicArr = [DataDic]() {
        didSet {
            updateView(dicArr)
        }
    }
    
    private let backView = UIView()
    private let noDataLabel = UILabel()
    private let topTitleView = TopTitleView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    func setupView() {

        topTitleView.title = "Control Data"
        topTitleView.becomeSubviewIn(self)
        topTitleView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(TopTitleView.size.h)
        }
        
        backView.cornerRadius = 4.0
        backView.borderColor = UIColor.red
        backView.borderWidth = 1.0
        backView.becomeSubviewIn(self)
        backView.snp.makeConstraints { (make) in
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.bottom.equalTo(0)
            make.top.equalTo(topTitleView.snp.bottom).offset(-8)
        }
        self.sendSubviewToBack(backView)
        
        noDataLabel.text = "Temporarily no control data"
        noDataLabel.font = UIFont.Kmedium(12)
        noDataLabel.becomeSubviewIn(self)
        noDataLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
    
    func updateView(_ dicArr: [DataDic]) {
        
        if !backView.subviews.isEmpty {
            backView.removeAllSubviews()
            noDataLabel.text = ""
        }
        
        var prevCell: RealDataCell?
        for (index, item) in dicArr.enumerated() {
            let cell = RealDataCell()
            cell.becomeSubviewIn(backView)
            cell.title = item.key + ":"
            cell.data = item.value
            
            if let prevCell = prevCell {
                cell.snp.makeConstraints { (make) in
                    make.left.equalTo(5)
                    make.right.equalTo(-5)
                    make.top.equalTo(prevCell.snp.bottom)
                    make.height.equalTo(30)
                    if index == dicArr.count - 1 {
                        make.bottom.equalToSuperview()
                    }
                }
            } else {
                cell.snp.makeConstraints { (make) in
                    make.left.equalTo(5)
                    make.right.equalTo(-5)
                    make.top.equalTo(topTitleView.snp.bottom)
                    make.height.equalTo(30)
                }
            }
            
            prevCell = cell
        }
    }
}

class RealDataCell: UIView {
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var data: String? {
        didSet {
            dataLabel.text = data
        }
    }
    
    private let titleLabel = UILabel()
    private let dataLabel = UILabel()
    private let lineView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    func setupView() {
    
        lineView.backgroundColor = UIColor.lightGray
        lineView.becomeSubviewIn(self)
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.right.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        titleLabel.textAlignment = .left
        titleLabel.textColor = UIColor.gray
        titleLabel.becomeSubviewIn(self)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom)
            make.bottom.equalTo(0)
            make.left.equalTo(15)
            make.right.equalTo(self.snp.centerX)
        }
        
        dataLabel.textAlignment = .right
        dataLabel.textColor = UIColor.hex(0x333333)
        dataLabel.becomeSubviewIn(self)
        dataLabel.snp.makeConstraints { (make) in
            make.top.equalTo(lineView.snp.bottom)
            make.bottom.equalTo(0)
            make.right.equalTo(-25)
            make.left.equalTo(titleLabel.snp.right)
        }
    }
    
}
