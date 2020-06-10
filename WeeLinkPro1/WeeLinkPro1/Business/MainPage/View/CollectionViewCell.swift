//
//  CollectionViewCell.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/5/16.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let imgView = UIImageView()
    let nameLbl = UILabel()
    let numLbl = UILabel()
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
        
        imgView.layer.borderColor = UIColor.systemGroupedBackground.cgColor
        imgView.layer.borderWidth = 1
        imgView.layer.cornerRadius = 5
        self.addSubview(imgView)
        imgView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(-60)
        }
        
        nameLbl.text = "商品名称"
        nameLbl.textAlignment = .left
        self.addSubview(nameLbl)
        nameLbl.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(imgView.snp.bottom)
        }
        nameLbl.textColor = UIColor.hex(0x787878)
        nameLbl.font = UIFont.PFMedium(13.0)
        
        numLbl.text = "16(只)"
        numLbl.textAlignment = .left
        self.addSubview(numLbl)
        numLbl.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalTo(nameLbl.snp.bottom)
        }
        numLbl.textColor = UIColor.hex(0x787878)
        numLbl.font = UIFont.PFMedium(10.0)
        
        addBtn.layer.cornerRadius = 3.0
        addBtn.setTitle("+", for: UIControl.State.normal)
        addBtn.setTitleColor(UIColor.hex(0x939393), for: UIControl.State.normal)
        addBtn.titleLabel?.font = UIFont.PFRegular(20.0)
        addBtn.backgroundColor = UIColor.hex(0xE7E8EA)
        self.addSubview(addBtn)
        addBtn.snp.makeConstraints { (make) in
            make.width.height.equalTo(20)
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(numLbl.snp.bottom)
        }
        
        priceLbl.text = "￥15"
        priceLbl.textAlignment = .left
        self.addSubview(priceLbl)
        priceLbl.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalTo(numLbl.snp.bottom)
            make.bottom.equalToSuperview()
            make.right.equalTo(addBtn.snp.left)
        }
        priceLbl.textColor = UIColor.hex(0x787878)
        priceLbl.font = UIFont.PFMedium(15.0)
    }
}
