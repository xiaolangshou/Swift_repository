//
//  MiniCollectionViewCell.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/5/16.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class MiniCollectionViewCell: UICollectionViewCell {
    
    fileprivate let imgView = UIImageView()
    fileprivate let subscriptLbl = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    func setupView() {
        
        imgView.backgroundColor = UIColor.cyan
        imgView.layer.cornerRadius = 5
        self.addSubview(imgView)
        imgView.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.equalTo(8)
            make.right.equalTo(-8)
            make.bottom.equalTo(-34)
        }
        
        subscriptLbl.text = "功能类别"
        subscriptLbl.textAlignment = .center
        subscriptLbl.font = UIFont.PFRegular(13.0)
        self.addSubview(subscriptLbl)
        subscriptLbl.snp.makeConstraints { make in
            make.width.equalTo(imgView.snp.width)
            make.bottom.equalToSuperview()
            make.top.equalTo(imgView.snp.bottom)
        }
    }
}
