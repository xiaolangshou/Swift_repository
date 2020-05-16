//
//  SearchBar.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/5/16.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit
import SnapKit

class SearchBar: UISearchBar {
    
    var cancelBtnTap: (() -> (Void))?
    
    let cancelBtn = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    func setupView() {
        
        cancelBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        cancelBtn.setTitle("x", for: UIControl.State.normal)
        self.addSubview(cancelBtn)
        cancelBtn.snp.makeConstraints { (make) in
            make.width.height.equalTo(20)
            make.centerY.equalToSuperview()
            make.right.equalTo(-15)
        }
        cancelBtn.addTarget(self, action: #selector(cancelBtnTapped), for: .touchUpInside)
    }
    
    @objc func cancelBtnTapped() {
        cancelBtnTap!()
    }
}
