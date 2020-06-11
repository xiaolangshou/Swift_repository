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
    var miniImgV = UIImageView()
    var titleLbl = UILabel()
    var numLbl = UILabel()
    var priceLbl = UILabel()
    var addBtn = UIButton()
    
    let leftLine = UIView()
    let rightLine = UIView()
    
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
        imageV.backgroundColor = UIColor.hex(0xE7E8EA)
        imageV.snp.makeConstraints { (make) in
            make.left.top.bottom.equalToSuperview()
            make.width.equalTo(100)
        }
        
        imageV.addSubview(miniImgV)
        miniImgV.snp.makeConstraints { (make) in
            make.top.right.equalToSuperview()
            make.width.height.equalTo(22)
        }
        
        self.addSubview(leftLine)
        leftLine.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.width.equalTo(100)
            make.height.equalTo(SINGLE_LINE_WIDTH)
            make.bottom.equalTo(-SINGLE_LINE_ADJUST_OFFSET)
        }
        leftLine.backgroundColor = UIColor.white
        
        self.addSubview(rightLine)
        rightLine.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.left.equalTo(imageV.snp.right)
            make.height.equalTo(SINGLE_LINE_WIDTH)
            make.bottom.equalTo(-SINGLE_LINE_ADJUST_OFFSET)
        }
        rightLine.backgroundColor = UIColor.systemBackColor
        
        self.addSubview(titleLbl)
        titleLbl.text = "名称"
        titleLbl.font = UIFont.PFRegular(12)
        titleLbl.snp.makeConstraints { (make) in
            make.left.equalTo(imageV.snp.right).offset(10)
            make.right.equalToSuperview()
            make.top.equalToSuperview().offset(5)
            make.height.equalTo(30)
        }
        
        self.addSubview(numLbl)
        numLbl.text = "商品个数"
        numLbl.font = UIFont.PFRegular(10)
        numLbl.textColor = UIColor.hex(0x787878)
        numLbl.snp.makeConstraints { (make) in
            make.left.equalTo(imageV.snp.right).offset(10)
            make.right.equalToSuperview()
            make.top.equalTo(titleLbl.snp.bottom)
        }
        
        self.addSubview(addBtn)
        addBtn.snp.makeConstraints { (make) in
            make.width.height.equalTo(20)
            make.right.bottom.equalToSuperview().offset(-16)
        }
        addBtn.layer.cornerRadius = 3.0
        addBtn.setBackgroundImage(UIImage.init(named: "商品_加"), for: UIControl.State.normal)
        
        self.addSubview(priceLbl)
        priceLbl.text = "￥22"
        priceLbl.textColor = UIColor.hex(0x787878)
        priceLbl.font = UIFont.PFRegular(13.0)
        priceLbl.snp.makeConstraints { (make) in
            make.left.equalTo(imageV.snp.right).offset(10)
            make.bottom.equalToSuperview()
            make.top.equalTo(numLbl.snp.bottom)
            make.right.equalTo(addBtn.snp.left)
        }
    }

}
