//
//  SubOrderView.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/5/27.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class SubOrderView: UIView {
    
    var img: UIImage? {
        didSet {
            imgV.image = img
        }
    }
    
    var title: String? {
        didSet {
            titleLbl.text = title
        }
    }
    
    private let imgV = UIImageView()
    private let titleLbl = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    func setupView() {
        
        self.backgroundColor = UIColor.white
        
        self.addSubview(imgV)
        imgV.snp.makeConstraints { (make) in
            make.width.height.equalTo(60)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-15)
            make.bottom.equalTo(-45)
        }
        
        self.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { (make) in
            make.left.equalTo(imgV.snp.left)
            make.right.equalTo(imgV.snp.right)
            make.top.equalTo(imgV.snp.bottom)
            make.bottom.equalTo(-10)
        }
        titleLbl.textAlignment = .center
        titleLbl.font = UIFont.PFRegular(14.0)
    }

}
