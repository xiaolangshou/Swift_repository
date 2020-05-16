//
//  CollectionViewCell.swift
//  CollectionViewDemo
//
//  Created by Thomas Lau on 2020/5/16.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    fileprivate let matchLabel = UILabel()
    fileprivate let addOrDeleteLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    func setupView() {
        
        self.layer.cornerRadius = 4
        self.backgroundColor = UIColor.cyan
        
        addOrDeleteLabel.text = "+"
        self.addSubview(addOrDeleteLabel)
        addOrDeleteLabel.snp.makeConstraints { make in
            make.width.equalTo(11)
            make.height.equalTo(25)
            make.right.equalToSuperview().offset(-12)
            make.centerY.equalToSuperview()
        }
        
        matchLabel.text = "-"
        self.addSubview(matchLabel)
        matchLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalTo(addOrDeleteLabel.snp.left).offset(2)
            make.height.equalTo(16)
            make.centerY.equalToSuperview()
        }
    }
}
