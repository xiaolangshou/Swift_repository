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
        leftLbl.textAlignment = .left
        
        self.addSubview(rightBtn)
        rightBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.centerY.equalToSuperview()
        }
        rightBtn.setTitle("更多", for: UIControl.State.normal)
        rightBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        rightBtn.addTarget(self, action: #selector(rightBtnTapped), for: .touchUpInside)
    }
    
    @objc func rightBtnTapped() {
        rightBtnTap?()
    }
        
}
