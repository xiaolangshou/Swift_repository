//
//  HistoryView.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/5/27.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class HistoryView: UIView {
    
    var dataArr = ["铅笔", "小龙虾", "榴莲", "香蕉", "苹果", "梨", "圣女果", "铅笔", "小龙虾", "榴莲", "香蕉", "苹果", "梨", "圣女果"]
    
    let titleLbl = UILabel()
    
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
        
        self.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { (make) in
            make.left.top.equalTo(10)
        }
        titleLbl.text = "历史搜索"
        titleLbl.font = UIFont.PFRegular(15.0)
        
        _ = UIStackView().then { (h) in
            self.addSubview(h)
            h.snp.makeConstraints { (make) in
                make.top.equalTo(titleLbl.snp.bottom).offset(5)
                make.left.right.bottom.equalToSuperview()
            }
            h.axis = .vertical
            h.alignment = .center
            h.distribution = .equalCentering
            
            for j in 0..<(dataArr.count/5) {
                let stack = UIStackView.init()
                h.addSubview(stack)
                stack.snp.makeConstraints { (make) in
                    make.left.right.equalToSuperview()
                    make.height.equalTo(60)
                }
                stack.axis = .horizontal
                stack.alignment = .center
                stack.distribution = .equalCentering
                
                for i in 0..<5 {
                    let v = UILabel()
                    v.text = dataArr[i + j]
                    v.textColor = UIColor.black
                    v.backgroundColor = UIColor.systemBackColor
                    v.layer.cornerRadius = 6.0
                    stack.addArrangedSubview(v)
                    v.snp.makeConstraints {
                        $0.width.greaterThanOrEqualTo(60)
                        $0.height.equalTo(25)
                    }
                    v.textAlignment = .center
                }
            }
        }
    }

}
