//
//  CollectionReusableView.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/5/16.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class CollectionReusableView: UICollectionReusableView {
    
    let leftLbl = UILabel()
    let rightBtn = UIButton()
    let lineView = UIView()
    
    var rightBtnTap: (() -> (Void))?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    func setupView() {
        
        self.addSubview(leftLbl)
        leftLbl.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.centerY.equalToSuperview()
        }
        leftLbl.text = "标题"
        leftLbl.textColor = UIColor.hex(0x787878)
        leftLbl.textAlignment = .left
        leftLbl.font = UIFont.PFMedium(14.0)
        
        self.addSubview(rightBtn)
        rightBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.centerY.equalToSuperview()
        }
        rightBtn.setTitle("更多", for: UIControl.State.normal)
        rightBtn.setTitleColor(UIColor.hex(0x787878), for: UIControl.State.normal)
        rightBtn.titleLabel?.font = UIFont.PFMedium(14.0)
        rightBtn.addTarget(self, action: #selector(rightBtnTapped), for: .touchUpInside)
        
        self.addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(SINGLE_LINE_WIDTH)
            make.bottom.equalTo(-1)
        }
        lineView.layoutMargins.bottom = SINGLE_LINE_WIDTH
        lineView.backgroundColor = UIColor(red: 80/255.0, green: 80/255.0, blue: 80/255.0, alpha: 0.3)
    }
    
    @objc func rightBtnTapped() {
        rightBtnTap?()
    }
        
}
