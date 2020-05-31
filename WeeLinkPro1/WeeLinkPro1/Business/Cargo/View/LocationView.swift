//
//  LocationView.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/5/25.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class LocationView: UIView {

    let locationLogo = UIImageView()
    let addressLbl = UILabel().then { (a) in
        a.text = "广东省深圳市南山区凤岗镇永盛大道东莞银行后面"
    }
    let nameLbl = UILabel().then { (n) in
        n.text = "黄菲琪 137-1413-3411"
    }
    let arrow = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    func setupView() {
        
        self.layer.cornerRadius = 5.0
        self.backgroundColor = UIColor.white
        
        self.addSubview(locationLogo)
        locationLogo.snp.makeConstraints { (make) in
            make.width.height.equalTo(36)
            make.left.equalTo(12)
            make.centerY.equalToSuperview()
        }
        locationLogo.image = UIImage.init(color: UIColor.cyan)
        
        self.addSubview(nameLbl)
        nameLbl.snp.makeConstraints { (make) in
            make.left.equalTo(locationLogo.snp.right).offset(5)
            make.top.equalTo(locationLogo.snp.bottom).offset(4)
            make.right.equalTo(-23)
            make.height.equalTo(18)
        }
        nameLbl.font = UIFont.PFMedium(15.0)
        nameLbl.textColor = UIColor.lightGray
        
        self.addSubview(addressLbl)
        addressLbl.snp.makeConstraints { (make) in
            make.left.equalTo(locationLogo.snp.right).offset(5)
            make.top.equalTo(4)
            make.right.equalTo(-23)
            make.bottom.equalTo(nameLbl.snp.top).offset(4)
        }
        addressLbl.font = UIFont.PFMedium(15.0)
        addressLbl.numberOfLines = 0
        addressLbl.lineBreakMode = .byWordWrapping
        
        self.addSubview(arrow)
        arrow.snp.makeConstraints { (make) in
            make.width.equalTo(12)
            make.height.equalTo(15)
            make.right.equalTo(-14)
            make.centerY.equalToSuperview()
        }
        arrow.image = UIImage.init(color: UIColor.cyan)
    }

}
