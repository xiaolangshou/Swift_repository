//
//  LeftTableViewCell.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/5/16.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class LeftTableViewCell: UITableViewCell {
    
    var titleLbl = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    func setupView() {
        
        titleLbl.text = "类别"
        self.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
