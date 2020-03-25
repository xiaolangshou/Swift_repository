//
//  AliView.swift
//  MVVMDemo
//
//  Created by mac on 2018/12/1.
//  Copyright © 2018 Liu Tao. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AliView: UIView {
    
    var displayData = BehaviorRelay<ShowData>(value: AliView.ShowData())
    var resultLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    private func setupView() {
        
        backgroundColor = UIColor.green
        
        resultLabel = UILabel()
        resultLabel?.textColor = UIColor.black
        resultLabel?.numberOfLines = 0
        resultLabel?.lineBreakMode = .byWordWrapping
        resultLabel?.becomeSubviewIn(self)
        resultLabel?.snp.makeConstraints({ (make) in
            make.top.equalTo(100)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.bottom.lessThanOrEqualToSuperview()
        })
        
        bindUI()
    }
    
    func bindUI() {
        
        _ = displayData.asObservable().subscribe{ [weak self] value in
            if let value = value.element {
                print("values = \(value.address),\(value.alevel),\(value.cityName),\(value.level),\(value.lat),\(value.lon)")
                self?.reloadData(value)
            }
        }
    }
    
    func reloadData(_ value: ShowData) {
        resultLabel?.text = "地址:\(value.address) 等级a:\(value.alevel)\n 城市:\(value.cityName) 等级b:\(value.level)\n 纬度:\(value.lat) 经度:\(value.lon)"
    }
}

extension AliView {
    
    class ShowData {
        
        var lon = Float(0)
        var lat = Float(0)
        var level = 0
        var address = ""
        var cityName = ""
        var alevel = 0
    }
}
