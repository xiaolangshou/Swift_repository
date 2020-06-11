//
//  BottomView.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/5/18.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class BottomView: UIView {
    
    var selectAllBtnTap: (() -> Void)?
    var editBtnTap: (() -> Void)?
    var sumBtnTap: (() -> Void)?
    
    let checkBtn = UIButton()
    let checkLbl = UILabel()
    let editBtn = UIButton()
    let sumLbl = UILabel()
    let sumBtn = UIButton()
    
    let cancelBtn = UIButton()
    let deleteBtn = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    func setupView() {
        
        self.addSubview(checkBtn)
        checkBtn.snp.makeConstraints { (make) in
            make.width.height.equalTo(20)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(12)
        }
        checkBtn.setBackgroundImage(UIImage(named: "勾选_未选中"), for: .normal)
        checkBtn.addTarget(self, action: #selector(selectAllBtnTapped(btn:)), for: .touchUpInside)
        
        self.addSubview(checkLbl)
        checkLbl.text = "全选"
        checkLbl.snp.makeConstraints { (make) in
            make.left.equalTo(checkBtn.snp.right).offset(5)
            make.centerY.equalToSuperview()
            make.width.lessThanOrEqualTo(40)
        }
        checkLbl.textAlignment = .left
        checkLbl.font = UIFont.PFMedium(13.0)
        checkLbl.textColor = UIColor.hex(0x939393)
        
        self.addSubview(editBtn)
        editBtn.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(checkLbl.snp.right)
            make.width.equalTo(33)
            make.height.equalTo(20)
        }
        editBtn.layer.cornerRadius = 4.0
        editBtn.setTitle("编辑", for: .normal)
        editBtn.backgroundColor = UIColor.hex(0x8DC64F)
        editBtn.setTitleColor(UIColor.white, for: .normal)
        editBtn.titleLabel?.font = UIFont.PFMedium(13)
        editBtn.addTarget(self, action: #selector(editBtnTapped), for: .touchUpInside)
        
        self.addSubview(sumBtn)
        sumBtn.setTitle("结算", for: .normal)
        sumBtn.titleLabel?.font = UIFont.PFBold(14.0)
        sumBtn.layer.cornerRadius = 6.0
        sumBtn.snp.makeConstraints { (make) in
            make.width.equalTo(85)
            make.height.equalTo(40)
            make.centerY.equalToSuperview()
            make.right.equalTo(-10)
        }
        sumBtn.backgroundColor = UIColor.hex(0x8DC64F)
        sumBtn.addTarget(self, action: #selector(sumBtnTapped), for: .touchUpInside)
        
        self.addSubview(sumLbl)
        sumLbl.snp.makeConstraints { (make) in
            make.left.equalTo(editBtn.snp.right).offset(12)
            make.right.equalTo(sumBtn.snp.left).offset(-16)
            make.centerY.equalToSuperview()
        }
        sumLbl.text = "合计: $193.00"
        sumLbl.textColor = UIColor.hex(0x787878)
        sumLbl.font = UIFont.PFBold(18.0)
        sumLbl.textAlignment = .right
        
        self.addSubview(deleteBtn)
        deleteBtn.setTitle("删除", for: .normal)
        deleteBtn.titleLabel?.font = UIFont.PFRegular(14.0)
        deleteBtn.layer.cornerRadius = 4.0
        deleteBtn.snp.makeConstraints { (make) in
            make.width.equalTo(80)
            make.height.equalTo(40)
            make.centerY.equalToSuperview()
            make.right.equalTo(-10)
        }
        deleteBtn.backgroundColor = UIColor.hex(0xF0555B)
        deleteBtn.addTarget(self, action: #selector(deleteBtnTapped), for: .touchUpInside)
        deleteBtn.isHidden = true
        
        self.addSubview(cancelBtn)
        cancelBtn.setTitle("取消", for: .normal)
        cancelBtn.titleLabel?.font = UIFont.PFRegular(14.0)
        cancelBtn.layer.cornerRadius = 4.0
        cancelBtn.snp.makeConstraints { (make) in
            make.width.equalTo(80)
            make.height.equalTo(40)
            make.centerY.equalToSuperview()
            make.right.equalTo(deleteBtn.snp.left).offset(-5)
        }
        cancelBtn.backgroundColor = UIColor.hex(0xC8CCD1)
        cancelBtn.addTarget(self, action: #selector(cancelBtnTapped), for: .touchUpInside)
        cancelBtn.isHidden = true
    }
    
    @objc func selectAllBtnTapped(btn: UIButton) {
        print(#function)
        btn.isSelected = !btn.isSelected
        if btn.isSelected {
            btn.setBackgroundImage(UIImage.init(named: "勾选_选中"), for: .normal)
        } else {
            btn.setBackgroundImage(UIImage.init(named: "勾选_未选中"), for: .normal)
        }
        selectAllBtnTap!()
    }
    
    @objc func sumBtnTapped() {
        print(#function)
        sumBtnTap!()
    }
    
    @objc func editBtnTapped() {
        print(#function)
        
        cancelBtn.isHidden = !cancelBtn.isHidden
        deleteBtn.isHidden = !deleteBtn.isHidden
        
        sumBtn.isHidden = !sumBtn.isHidden
        sumLbl.isHidden = !sumLbl.isHidden
        
        editBtnTap!()
    }

    @objc func deleteBtnTapped() {
        print(#function)
    
    }
    
    @objc func cancelBtnTapped() {
        print(#function)
    }
}
