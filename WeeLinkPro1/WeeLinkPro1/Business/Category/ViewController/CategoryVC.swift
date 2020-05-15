//
//  CatgoryVC.swift
//  WeeLinkPro1
//
//  Created by Liu Tao on 2020/5/14.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class CategoryVC: UIViewController {

    static let shared = CategoryVC()
    
    let searchBar = UISearchBar()
    let leftView = UITableView()
    let rightView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSearchBar()
        setupSideView()
    }
    
    func setupSearchBar() {
        
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints { (make) in
            make.top.equalTo(90)
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        searchBar.placeholder = "搜索内容"
    }
    
    func setupSideView() {
        
        leftView.backgroundColor = UIColor.cyan
        view.addSubview(leftView)
        leftView.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom)
            make.bottom.equalToSuperview()
            make.width.equalTo(120)
        }
        
        rightView.backgroundColor = UIColor.green
        view.addSubview(rightView)
        rightView.snp.makeConstraints { (make) in
            make.left.equalTo(leftView.snp.right)
            make.right.equalToSuperview()
            make.top.equalTo(searchBar.snp.bottom)
            make.bottom.equalToSuperview()
        }
    }
}
