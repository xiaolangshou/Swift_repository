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

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    func setupView() {
        
        self.setImage(UIImage.init(named: "搜索栏_搜索"),
                      for: UISearchBar.Icon.search,
                      state: UIControl.State.normal)
    }
}
