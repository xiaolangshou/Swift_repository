//
//  DetailView.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/5/25.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    let imgV = UIImageView()
    let productLbl = UILabel()
    let priceLbl = UILabel()
    let typeLbl = UILabel()
    let theNumLbl = UILabel()
    
    let purchaseNumLbl = UILabel()
    let plusBtn = UIButton()
    let numLbl = UILabel()
    let minusBtn = UIButton()
    
    let cupponLbl = UILabel()
    let cupponPriceLbl = UILabel()
    
    let feeLbl = UILabel()
    let feePriceLbl = UILabel()
    
    let descriprionTitleLbl = UILabel()
    let descriptionLbl = UILabel()
    
    let sumLbl = UILabel()
    
    var num = 0
    
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
        
        self.addSubview(imgV)
        imgV.snp.makeConstraints { (make) in
            make.width.height.equalTo(90)
            make.left.top.equalTo(10)
        }
        imgV.image = UIImage.init(color: UIColor.cyan)
        
        self.addSubview(productLbl)
        productLbl.text = ""
        
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
    }
    
    @objc func plusBtnTapped() {
        print(#function)
        num += 1
        numLbl.text = "\(num)"
        theNumLbl.text = "\(num)"
    }
    
    @objc func minusBtnTapped() {
        print(#function)
        num -= 1
        numLbl.text = "\(num)"
        theNumLbl.text = "\(num)"
    }

}
