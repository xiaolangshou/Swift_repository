//
//  RightTableViewCell.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/5/16.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class RightTableViewCell: UITableViewCell {

    var imageV = UIImageView()
    var titleLbl = UILabel()
    var numLbl = UILabel()
    var priceLbl = UILabel()
    var addBtn = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    func setupView() {
        
        self.addSubview(imageV)
        imageV.backgroundColor = UIColor.red
        imageV.snp.makeConstraints { (make) in
            make.left.top.bottom.equalToSuperview()
            make.width.equalTo(80)
        }
        
        self.addSubview(titleLbl)
        titleLbl.text = "名称"
        titleLbl.snp.makeConstraints { (make) in
            make.left.equalTo(imageV.snp.right)
            make.right.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        self.addSubview(numLbl)
        numLbl.text = "商品个数"
        numLbl.snp.makeConstraints { (make) in
            make.left.equalTo(imageV.snp.right)
            make.right.equalToSuperview()
            make.top.equalTo(titleLbl.snp.bottom)
        }
        
        self.addSubview(addBtn)
        addBtn.setTitle("+", for: UIControl.State.normal)
        addBtn.setTitleColor(UIColor.red, for: UIControl.State.normal)
        addBtn.snp.makeConstraints { (make) in
            make.width.height.equalTo(12)
            make.right.bottom.equalToSuperview().offset(-10)
        }
        
        self.addSubview(priceLbl)
        priceLbl.text = "￥22"
        priceLbl.snp.makeConstraints { (make) in
            make.left.equalTo(imageV.snp.right)
            make.bottom.equalToSuperview()
            make.top.equalTo(numLbl.snp.bottom)
            make.right.equalTo(addBtn.snp.left)
        }
    }

}
