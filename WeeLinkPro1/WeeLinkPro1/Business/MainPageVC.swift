//
//  MainPageVC.swift
//  WeeLinkPro1
//
//  Created by Liu Tao on 2020/5/14.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit
import SnapKit

class MainPageVC: UIViewController {
    
    static let shared = MainPageVC()
    
    var searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    func setupView() {
        
        setupSearchBar()
        setupBanner()
    }

    func setupSearchBar() {
        
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.top.equalTo(90)
            make.centerX.equalToSuperview()
        }
        searchBar.placeholder = "搜索内容"
    }
    
    func setupBanner() {
        
    }
}
