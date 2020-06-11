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
        
        self.layer.cornerRadius = 6.0
        self.backgroundColor = UIColor.white
        
        self.addSubview(imgV)
        imgV.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)
            make.left.top.equalTo(12)
        }
        imgV.image = UIImage.init(named: "水果_苹果")
        imgV.layer.cornerRadius = 6.0
        imgV.backgroundColor = UIColor.hex(0xE7E8EA)
        
        self.addSubview(productLbl)
        productLbl.snp.makeConstraints { (make) in
            make.left.equalTo(imgV.snp.right).offset(6)
            make.centerY.equalTo(imgV.snp.centerY).offset(-15)
            make.width.equalTo(50)
            make.height.equalTo(20)
        }
        productLbl.text = "Fii-02"
        productLbl.font = UIFont.PFBold(15.0)
        
        self.addSubview(priceLbl)
        priceLbl.snp.makeConstraints { (make) in
            make.left.equalTo(productLbl.snp.right).offset(5)
            make.right.equalTo(-10)
            make.centerY.equalTo(productLbl.snp.centerY)
        }
        priceLbl.text = "￥193.00"
        priceLbl.font = UIFont.PFBold(15.0)
        priceLbl.textAlignment = .right
        
        self.addSubview(typeLbl)
        typeLbl.snp.makeConstraints { (make) in
            make.left.equalTo(productLbl.snp.left)
            make.right.equalTo(-10)
            make.centerY.equalTo(imgV.snp.centerY).offset(15)
        }
        typeLbl.font = UIFont.PFMedium(13.0)
        typeLbl.text = "138412834723alsdjfls"
        typeLbl.textColor = UIColor.hex(0x929599)
        
        self.addSubview(theNumLbl)
        theNumLbl.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.centerY.equalTo(typeLbl.snp.centerY)
        }
        theNumLbl.text = "\(num)"
        theNumLbl.font = UIFont.PFRegular(14.0)
        theNumLbl.textAlignment = .right
        
        purchaseNumLbl.text = "购买数量"
        self.addSubview(purchaseNumLbl)
        purchaseNumLbl.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.top.equalTo(imgV.snp.bottom).offset(15)
            make.width.equalTo(100)
            make.height.equalTo(23)
        }
        purchaseNumLbl.font = UIFont.PFMedium(13.0)
        purchaseNumLbl.textAlignment = .right
        
        _ = UIView().then({ (line) in
            self.addSubview(line)
            line.snp.makeConstraints { (make) in
                make.left.equalTo(10)
                make.right.equalTo(0)
                make.height.equalTo(SINGLE_LINE_WIDTH)
                make.top.equalTo(purchaseNumLbl.snp.bottom).offset(10+SINGLE_LINE_ADJUST_OFFSET)
            }
            line.backgroundColor = UIColor.lightGray
        })
        
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
        
        self.addSubview(cupponLbl)
        cupponLbl.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.top.equalTo(purchaseNumLbl.snp.bottom).offset(15)
            make.width.equalTo(100)
            make.height.equalTo(23)
        }
        cupponLbl.text = "优惠券"
        cupponLbl.textAlignment = .right
        cupponLbl.font = UIFont.PFMedium(13.0)
        cupponLbl.textAlignment = .right
        
        self.addSubview(cupponPriceLbl)
        cupponPriceLbl.snp.makeConstraints { (make) in
            make.width.equalTo(90)
            make.right.equalTo(-10)
            make.height.equalTo(23)
            make.centerY.equalTo(cupponLbl.snp.centerY)
        }
        cupponPriceLbl.text = "-￥12:00 >"
        cupponPriceLbl.font = UIFont.PFBold(13.0)
        cupponPriceLbl.textColor = UIColor.gray
        
        _ = UIView().then({ (line) in
            self.addSubview(line)
            line.snp.makeConstraints { (make) in
                make.left.equalTo(10)
                make.right.equalTo(0)
                make.height.equalTo(SINGLE_LINE_WIDTH)
                make.top.equalTo(cupponLbl.snp.bottom).offset(10+SINGLE_LINE_ADJUST_OFFSET)
            }
            line.backgroundColor = UIColor.lightGray
        })
        
        self.addSubview(feeLbl)
        feeLbl.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.left.equalTo(10)
            make.top.equalTo(cupponLbl.snp.bottom).offset(15)
            make.height.equalTo(23)
        }
        feeLbl.text = "运费"
        feeLbl.textAlignment = .right
        feeLbl.font = UIFont.PFMedium(13.0)
        
        self.addSubview(feePriceLbl)
        feePriceLbl.snp.makeConstraints { (make) in
            make.width.equalTo(90)
            make.right.equalTo(-10)
            make.height.equalTo(23)
            make.centerY.equalTo(feeLbl.snp.centerY)
        }
        feePriceLbl.text = "+￥12:00"
        feePriceLbl.font = UIFont.PFBold(13.0)
        feePriceLbl.textColor = UIColor.gray
        
        _ = UIView().then({ (line) in
            self.addSubview(line)
            line.snp.makeConstraints { (make) in
                make.left.equalTo(10)
                make.right.equalTo(0)
                make.height.equalTo(SINGLE_LINE_WIDTH)
                make.top.equalTo(feeLbl.snp.bottom).offset(10 + SINGLE_LINE_ADJUST_OFFSET)
            }
            line.backgroundColor = UIColor.lightGray
        })
        
        self.addSubview(descriprionTitleLbl)
        descriprionTitleLbl.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.left.equalTo(10)
            make.top.equalTo(feePriceLbl.snp.bottom).offset(15)
            make.height.equalTo(23)
        }
        descriprionTitleLbl.text = "备注"
        descriprionTitleLbl.textAlignment = .right
        descriprionTitleLbl.font = UIFont.PFMedium(13.0)
        
        self.addSubview(descriptionLbl)
        descriptionLbl.snp.makeConstraints { (make) in
            make.left.equalTo(descriprionTitleLbl.snp.right)
            make.right.equalTo(-10)
            make.height.equalTo(50)
            make.top.equalTo(descriprionTitleLbl.snp.top)
        }
        descriptionLbl.text = "0.01mm 没有就换0.3的也可以0.1mm没有就换0.3的也可以0"
        descriptionLbl.font = UIFont.PFMedium(13.0)
        descriptionLbl.textColor = UIColor.hex(0x929599)
        descriptionLbl.textAlignment = .right
        descriptionLbl.numberOfLines = 0
        descriptionLbl.lineBreakMode = .byWordWrapping
        
        _ = UIView().then({ (line) in
            self.addSubview(line)
            line.snp.makeConstraints { (make) in
                make.left.equalTo(10)
                make.right.equalTo(0)
                make.height.equalTo(SINGLE_LINE_WIDTH)
                make.top.equalTo(descriptionLbl.snp.bottom).offset(10+SINGLE_LINE_ADJUST_OFFSET)
            }
            line.backgroundColor = UIColor.lightGray
        })
        
        self.addSubview(sumLbl)
        sumLbl.snp.makeConstraints { (make) in
            make.right.equalTo(-10)
            make.left.equalTo(10)
            make.height.equalTo(30)
            make.top.equalTo(descriptionLbl.snp.bottom).offset(15)
        }
        sumLbl.text = "小计：￥193.00"
        sumLbl.font = UIFont.PFMedium(13.0)
        sumLbl.textAlignment = .right
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
