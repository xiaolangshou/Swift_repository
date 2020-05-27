//
//  HistoryVC.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/5/27.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class HistoryVC: UIViewController {
    
    static let shared = HistoryVC()
    
    let history = HistoryView()
    let scrollView = UIScrollView()
    let containerView = UIView()
    let searchBar = SearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupSearchBar()
        setupHistoryView()
    }
    
    func setupView() {
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(UIScreen.navBarHeight)
            make.left.right.bottom.equalToSuperview()
        }
        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        scrollView.alwaysBounceVertical = true
    }

    func setupSearchBar() {
        
        containerView.addSubview(searchBar)
        searchBar.snp.makeConstraints { (make) in
            make.width.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        searchBar.placeholder = "搜索内容"
        searchBar.delegate = self
    }
    
    func setupHistoryView() {
        
        containerView.addSubview(history)
        history.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}

extension HistoryVC: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print(#function)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print(#function)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        searchBar.resignFirstResponder()
    }
}
