//
//  TopTitleView.swift
//  MVVMDemo
//
//  Created by mac on 2018/12/17.
//  Copyright © 2018 Liu Tao. All rights reserved.
//

import UIKit

class TopTitleView: UIView {

    static let size = CGSize(UIScreen.width - 10, 60)
    
    var title: String? {
        didSet {
            topLabel.text = title
        }
    }
    
    private let topLineView = UIView()
    private let topLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    func setupView() {
        
        topLineView.cornerRadius = 4
        topLineView.backgroundColor = UIColor.hex(0xFF4500)
        topLineView.becomeSubviewIn(self)
        topLineView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.height.equalTo(10)
        }
        
        topLabel.backgroundColor = UIColor.hex(0xFF4500)
        topLabel.textAlignment = .center
        topLabel.textColor = UIColor.white
        topLabel.font = UIFont.MILanTing(20)
        topLabel.becomeSubviewIn(self)
        topLabel.snp.makeConstraints { (make) in
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.top.equalTo(topLineView.snp.bottom).offset(-5)
            make.height.equalTo(50)
        }
        self.setShadow(color: UIColor.hex(0x000000), alpha: 0.17, x: 2, y: 0, blur: 3)
    }
    
    override var intrinsicContentSize: CGSize {
        return size
    }
}
