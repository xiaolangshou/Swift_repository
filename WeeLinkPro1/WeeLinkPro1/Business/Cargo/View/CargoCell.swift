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
        checkBtn.setBackgroundImage(UIImage(named: "勾选_未选中"), for: .normal)
        checkBtn.addTarget(self, action: #selector(checkBtnTapped(btn:)), for: .touchUpInside)
        
        self.addSubview(imgV)
        imgV.snp.makeConstraints { (make) in
            make.left.equalTo(checkBtn.snp.right).offset(9)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(100)
        }
        imgV.backgroundColor = UIColor.hex(0xE7E8EA)
        imgV.layer.cornerRadius = 6.0
        
        self.addSubview(proudctName)
        proudctName.snp.makeConstraints { (make) in
            make.left.equalTo(imgV.snp.right).offset(9)
            make.top.equalTo(imgV.snp.top)
            make.right.equalTo(-9)
        }
        proudctName.text = "商品名称"
        proudctName.textColor = UIColor.hex(0x787878)
        proudctName.font = UIFont.PFBold(15.0)
        
        self.addSubview(selectBtn)
        selectBtn.snp.makeConstraints { (make) in
            make.left.equalTo(imgV.snp.right).offset(9)
            make.top.equalTo(proudctName.snp.bottom).offset(7)
            make.width.equalTo(150)
            make.height.equalTo(25)
        }
        selectBtn.backgroundColor = UIColor.hex(0xF5F5F5)
        selectBtn.setTitle("选择类型", for: .normal)
        selectBtn.setTitleColor(UIColor.hex(0x929599), for: UIControl.State.normal)
        selectBtn.titleLabel?.font = UIFont.PFMedium(13.0)
        selectBtn.addTarget(self, action: #selector(selectBtnTapped), for: .touchUpInside)
        selectBtn.layer.cornerRadius = 4.0
        
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
        priceLbl.text = "￥193.00"
        priceLbl.textColor = UIColor.hex(0x939393)
        priceLbl.font = UIFont.PFBold(15.0)
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
    
    @objc func checkBtnTapped(btn: UIButton) {
        print(#function)
        btn.isSelected = !btn.isSelected
        print("btn.isSelected = \(btn.isSelected)")
        if btn.isSelected {
            btn.setBackgroundImage(UIImage.init(named: "勾选_选中"), for: .normal)
        } else {
            btn.setBackgroundImage(UIImage.init(named: "勾选_未选中"), for: .normal)
        }
        checkBtnTap?()
    }
    
    @objc func selectBtnTapped() {
        print(#function)
        selectBtnTap?()
    }

}
