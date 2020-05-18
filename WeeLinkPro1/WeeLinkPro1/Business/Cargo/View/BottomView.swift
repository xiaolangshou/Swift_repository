//
//  BottomView.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/5/18.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class BottomView: UIView {
    
    let checkBtn = UIButton()
    let checkLbl = UILabel()
    let editBtn = UIButton()
    let sumLbl = UILabel()
    let sumBtn = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    func setupView() {
        
        self.addSubview(checkBtn)
        checkBtn.snp.makeConstraints { (make) in
            make.width.height.equalTo(20)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
        }
        checkBtn.backgroundColor = UIColor.yellow
        
        self.addSubview(checkLbl)
        checkLbl.text = "全选"
        checkLbl.snp.makeConstraints { (make) in
            make.left.equalTo(checkBtn.snp.right).offset(5)
            make.centerY.equalToSuperview()
            make.width.lessThanOrEqualTo(50)
        }
        checkLbl.textAlignment = .left
        
        self.addSubview(editBtn)
        editBtn.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(checkLbl.snp.right)
            make.width.equalTo(60)
        }
        editBtn.layer.cornerRadius = 4.0
        editBtn.setTitle("编辑", for: .normal)
        editBtn.backgroundColor = UIColor.lightGray
        editBtn.setTitleColor(UIColor.white, for: .normal)
        
        self.addSubview(sumBtn)
        sumBtn.setTitle("结算", for: UIControl.State.normal)
        sumBtn.layer.cornerRadius = 4.0
        sumBtn.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.centerY.equalToSuperview()
            make.right.equalTo(-10)
        }
        sumBtn.backgroundColor = UIColor.lightGray
        
        self.addSubview(sumLbl)
        sumLbl.snp.makeConstraints { (make) in
            make.left.equalTo(editBtn.snp.right)
            make.right.equalTo(sumBtn.snp.left)
            make.centerY.equalToSuperview()
        }
        sumLbl.text = "合计: $193.00"
        
    }

}
