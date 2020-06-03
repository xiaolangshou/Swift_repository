//
//  HistoryView.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/5/27.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class HistoryView: UIView {
    
    var dataArr = ["铅笔", "小龙虾", "榴莲", "香蕉", "苹果", "梨", "圣女果", "铅笔", "小龙虾", "榴莲", "香蕉", "苹果", "梨", "圣女果", "铅笔", "lskd", "dsfsdf", "asdfsd", "asdfdf", "aaa"]
    
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
            
            var preStack: UIStackView?
            for j in 0..<(dataArr.count/6 + (dataArr.count%6 == 0 ? 0 : 1)) {
                let stack = UIStackView.init()
                h.addSubview(stack)
                
                if let preStack = preStack {
                    stack.snp.makeConstraints { (make) in
                        make.left.equalTo(15)
                        make.height.equalTo(40)
                        make.top.equalTo(preStack.snp.bottom)
                        if j == dataArr.count/5-1 {
                            make.bottom.equalToSuperview()
                            make.width.equalTo(dataArr.count%6 * 50)
                        } else {
                            make.right.equalTo(-15)
                        }
                    }
                } else {
                    stack.snp.makeConstraints { (make) in
                        make.left.equalTo(15)
                        make.right.equalTo(-38)
                        make.top.equalToSuperview()
                        make.height.equalTo(40)
                    }
                }
                
                stack.axis = .horizontal
                stack.alignment = .center
                stack.distribution = .equalCentering
                stack.spacing = 10
                
                for i in 0..<6 {
                    guard (i + j*6) < dataArr.count else { return }
                    print(dataArr[i+j*6])
                    let v = UILabel()
                    v.text = dataArr[i + j*6]
                    v.font = UIFont.PFMedium(11.0)
                    v.backgroundColor = UIColor.hex(0xF4F4F4)
                    v.layer.cornerRadius = 4.0
                    v.clipsToBounds = true
                    stack.addArrangedSubview(v)
                    v.snp.makeConstraints {
                        $0.width.equalTo(42)
                        $0.height.equalTo(25)
                    }
                    v.textAlignment = .center
                    v.layoutIfNeeded()
                }
                
                preStack = stack
            }
        }
    }

}
