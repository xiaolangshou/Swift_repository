//
//  BalanceVC.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/5/25.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class BalanceVC: UIViewController {
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    let bottomView = UIView()
    
    let locationView = LocationView()
    let detailView = DetailView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        
        view.backgroundColor = UIColor.systemBackColor
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        scrollView.alwaysBounceVertical = true

        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        containerView.addSubview(locationView)
        locationView.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(10)
            make.height.equalTo(90)
        }

        containerView.addSubview(detailView)
        detailView.snp.makeConstraints { (make) in
            make.left.equalTo(locationView.snp.left)
            make.right.equalTo(locationView.snp.right)
            make.top.equalTo(locationView.snp.bottom).offset(10)
            make.height.equalTo(UIScreen.width - 50)
            
        }
        
        view.addSubview(bottomView)
        bottomView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(55)
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        bottomView.backgroundColor = UIColor.white
        
        let submitBtn = UIButton()
        bottomView.addSubview(submitBtn)
        submitBtn.snp.makeConstraints { (make) in
            make.width.equalTo(90)
            make.height.equalTo(40)
            make.right.equalTo(-10)
            make.centerY.equalToSuperview()
        }
        submitBtn.layer.cornerRadius = 4.0
        submitBtn.backgroundColor = UIColor.hex(0x939393)
        submitBtn.setTitle("提交订单", for: .normal)
        submitBtn.setTitleColor(UIColor.white, for: .normal)
        submitBtn.titleLabel?.font = UIFont.PFBold(14.0)
        submitBtn.addTarget(self, action: #selector(submitBtnTapped), for: .touchUpInside)
        
        let sumLbl = UILabel()
        bottomView.addSubview(sumLbl)
        sumLbl.snp.makeConstraints { (make) in
            make.right.equalTo(submitBtn.snp.left).offset(-16)
            make.top.equalTo(5)
            make.left.equalToSuperview()
            make.height.equalTo(25)
        }
        sumLbl.textAlignment = .right
        sumLbl.text = "合计：￥ 193.00"
        sumLbl.font = UIFont.PFMedium(15.0)
        
        let shipFeeLbl = UILabel()
        bottomView.addSubview(shipFeeLbl)
        shipFeeLbl.snp.makeConstraints { (make) in
            make.right.equalTo(submitBtn.snp.left).offset(-16)
            make.top.equalTo(sumLbl.snp.bottom)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
        }
        shipFeeLbl.textAlignment = .right
        shipFeeLbl.text = "运费：￥ 12.00"
        shipFeeLbl.font = UIFont.PFMedium(13.0)
    }
    
    @objc func submitBtnTapped() {
        print(#function)
    }

}
