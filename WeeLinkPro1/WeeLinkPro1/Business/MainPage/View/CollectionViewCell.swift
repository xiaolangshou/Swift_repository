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
        
        imgView.backgroundColor = UIColor.cyan
        imgView.layer.cornerRadius = 5
        self.addSubview(imgView)
        imgView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(-60)
        }
        
        nameLbl.text = "类别四字"
        nameLbl.textAlignment = .left
        self.addSubview(nameLbl)
        nameLbl.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(imgView.snp.bottom)
        }
        
        numLbl.text = "16(只)"
        numLbl.textAlignment = .left
        self.addSubview(numLbl)
        numLbl.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalTo(nameLbl.snp.bottom)
        }
        
        addBtn.layer.cornerRadius = 4.0
        addBtn.setTitle("+", for: UIControl.State.normal)
        addBtn.backgroundColor = UIColor.lightGray
        self.addSubview(addBtn)
        addBtn.snp.makeConstraints { (make) in
            make.width.height.equalTo(15)
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.top.equalTo(numLbl.snp.bottom)
        }
        
        priceLbl.text = "$15"
        priceLbl.textAlignment = .left
        self.addSubview(priceLbl)
        priceLbl.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalTo(numLbl.snp.bottom)
            make.bottom.equalToSuperview()
            make.right.equalTo(addBtn.snp.left)
        }
    }
}
