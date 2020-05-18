//
//  CargoCell.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/5/18.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit
import Then

class CargoCell: UIView {
    
    var btnTap: (() -> Void)?
    
    let checkBtn = UIButton()
    let imgV = UIImageView()
    let proudctName = UILabel()
    let selectBtn = UIButton()
    let priceLbl = UILabel()
    let minusBtn = UIButton()
    let plusBtn = UIButton()
    let numLbl = UILabel()

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
        self.layer.cornerRadius = 5.0
        
        self.addSubview(checkBtn)
        checkBtn.snp.makeConstraints { (make) in
            make.left.equalTo(8)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
        }
        checkBtn.backgroundColor = UIColor.cyan
        
        self.addSubview(imgV)
        imgV.snp.makeConstraints { (make) in
            make.left.equalTo(checkBtn.snp.right).offset(9)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(100)
        }
        imgV.backgroundColor = UIColor.red
        
        self.addSubview(proudctName)
        proudctName.snp.makeConstraints { (make) in
            make.left.equalTo(imgV.snp.right).offset(9)
            make.top.equalTo(imgV.snp.top)
            make.right.equalTo(-9)
        }
        proudctName.text = "商品名称"
        
        self.addSubview(selectBtn)
        selectBtn.snp.makeConstraints { (make) in
            make.left.equalTo(imgV.snp.right).offset(9)
            make.top.equalTo(proudctName.snp.bottom).offset(4)
            make.width.equalTo(150)
            make.height.equalTo(20)
        }
        selectBtn.backgroundColor = UIColor.cyan
        selectBtn.setTitle("选择类型", for: .normal)
        selectBtn.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        
        self.addSubview(plusBtn)
        plusBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-9)
            make.width.height.equalTo(12)
            make.bottom.equalTo(imgV.snp.bottom)
        }
        plusBtn.setTitle("+", for: .normal)
        plusBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        
        self.addSubview(numLbl)
        numLbl.snp.makeConstraints { (make) in
            make.right.equalTo(plusBtn.snp.left)
            make.height.equalTo(plusBtn.snp.height)
            make.centerY.equalTo(plusBtn.snp.centerY)
            make.width.equalTo(18)
        }
        numLbl.text = "1"
        
        self.addSubview(minusBtn)
        minusBtn.snp.makeConstraints { (make) in
            make.right.equalTo(numLbl.snp.left)
            make.centerY.equalTo(plusBtn.snp.centerY)
            make.width.height.equalTo(12)
        }
        minusBtn.setTitle("-", for: .normal)
        minusBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        
        self.addSubview(priceLbl)
        priceLbl.snp.makeConstraints { (make) in
            make.left.equalTo(imgV.snp.right).offset(9)
            make.bottom.equalTo(imgV.snp.bottom)
            make.right.equalTo(minusBtn.snp.left).offset(4)
        }
        priceLbl.text = "$12.00"
    }
    
    @objc func btnTapped() {
        
        btnTap?()
    }

}
