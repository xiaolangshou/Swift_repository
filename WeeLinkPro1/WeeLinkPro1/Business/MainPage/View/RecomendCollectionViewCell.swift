//
//  RecomendCollectionViewCell.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/6/15.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class RecomendCollectionViewCell: UICollectionViewCell {
    
    let imgView = UIImageView()
    let nameLbl = UILabel()
    let priceLbl = UILabel()
    let addBtn = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    func setupView() {

        imgView.backgroundColor = UIColor.hex(0xE7E8EA)
        imgView.layer.cornerRadius = 5.0
        self.contentView.addSubview(imgView)
        imgView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(-60)
        }
        
        nameLbl.text = "商品名称"
        nameLbl.textAlignment = .left
        self.contentView.addSubview(nameLbl)
        nameLbl.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(imgView.snp.bottom)
        }
        nameLbl.textColor = UIColor.hex(0x787878)
        nameLbl.font = UIFont.PFMedium(15.0)
        
        priceLbl.text = "￥15"
        priceLbl.textAlignment = .left
        self.contentView.addSubview(priceLbl)
        priceLbl.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(nameLbl.snp.bottom)
            make.bottom.equalToSuperview()
        }
        priceLbl.textColor = UIColor.hex(0x787878)
        priceLbl.font = UIFont.PFMedium(16.0)
    }
}
