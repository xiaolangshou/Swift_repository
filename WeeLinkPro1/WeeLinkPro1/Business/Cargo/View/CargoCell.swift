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
    
    var selectBtnTap: (() -> Void)?
    var checkBtnTap: (() -> Void)?
    var minusBtnTap: ((Int) -> Void)?
    var plusBtnTap: ((Int) -> Void)?
    
    var num = 1
    
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
        self.layer.cornerRadius = 6.0
        
        self.addSubview(checkBtn)
        checkBtn.snp.makeConstraints { (make) in
            make.left.equalTo(8)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(20)
        }
        checkBtn.backgroundColor = UIColor.cyan
        checkBtn.addTarget(self, action: #selector(checkBtnTapped), for: .touchUpInside)
        
        self.addSubview(imgV)
        imgV.snp.makeConstraints { (make) in
            make.left.equalTo(checkBtn.snp.right).offset(9)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(100)
        }
        imgV.backgroundColor = UIColor.cyan
        imgV.layer.cornerRadius = 6.0
        
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
        selectBtn.addTarget(self, action: #selector(selectBtnTapped), for: .touchUpInside)
        selectBtn.layer.cornerRadius = 3.0
        
        
        _ = UIView().then { (back) in
            self.addSubview(back)
            back.snp.makeConstraints { (make) in
                make.width.equalTo(86)
                make.right.equalTo(-10)
                make.height.equalTo(23)
                make.bottom.equalTo(imgV.snp.bottom)
            }
            back.layer.borderColor = UIColor.lightGray.cgColor
            back.layer.borderWidth = 0.5
            back.layer.cornerRadius = 4.0
            
            back.addSubview(plusBtn)
            plusBtn.snp.makeConstraints { (make) in
                make.right.equalTo(0)
                make.width.height.equalTo(23)
                make.bottom.equalTo(0)
            }
            plusBtn.setTitle("+", for: .normal)
            plusBtn.setTitleColor(UIColor.gray, for: .normal)
            plusBtn.titleLabel?.font = UIFont.PFExtraLight(18)
            plusBtn.addTarget(self, action: #selector(plusBtnTapped), for: .touchUpInside)
            
            back.addSubview(numLbl)
            numLbl.snp.makeConstraints { (make) in
                make.right.equalTo(plusBtn.snp.left).offset(0.5)
                make.height.equalTo(plusBtn.snp.height)
                make.centerY.equalTo(plusBtn.snp.centerY)
                make.width.equalTo(40)
            }
            numLbl.text = "\(num)"
            numLbl.textAlignment = .center
            numLbl.textColor = UIColor.gray
            numLbl.font = UIFont.PFExtraLight(14)
            numLbl.layer.borderColor = UIColor.lightGray.cgColor
            numLbl.layer.borderWidth = 0.5
            
            back.addSubview(minusBtn)
            minusBtn.snp.makeConstraints { (make) in
                make.right.equalTo(numLbl.snp.left).offset(0.5)
                make.centerY.equalTo(plusBtn.snp.centerY)
                make.width.height.equalTo(23)
            }
            minusBtn.setTitle("-", for: .normal)
            minusBtn.setTitleColor(UIColor.gray, for: .normal)
            minusBtn.titleLabel?.font = UIFont.PFExtraLight(18)
            minusBtn.addTarget(self, action: #selector(minusBtnTapped), for: .touchUpInside)
        }
        
        self.addSubview(priceLbl)
        priceLbl.snp.makeConstraints { (make) in
            make.left.equalTo(imgV.snp.right).offset(9)
            make.bottom.equalTo(imgV.snp.bottom)
            make.right.equalTo(minusBtn.snp.left).offset(4)
        }
        priceLbl.text = "$12.00"
    }
    
    @objc func plusBtnTapped() {
        print(#function)
        
        num += 1
        numLbl.text = "\(num)"
        plusBtnTap?(num)
    }
    
    @objc func minusBtnTapped() {
        print(#function)
        
        guard num >= 1 else { return }
        num -= 1
        numLbl.text = "\(num)"
        minusBtnTap?(num)
    }
    
    @objc func checkBtnTapped() {
        print(#function)
        checkBtnTap?()
    }
    
    @objc func selectBtnTapped() {
        print(#function)
        selectBtnTap?()
    }

}
