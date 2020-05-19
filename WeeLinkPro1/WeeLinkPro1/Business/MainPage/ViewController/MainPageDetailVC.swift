//
//  MainPageDetailVC.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/5/19.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class MainPageDetailVC: UIViewController {

    let scrollView = UIScrollView()
    let containerView = UIView()
    let searchBar = SearchBar()
    
    var sortBtn1: UIButton?
    var sortBtn2: UIButton?
    var sortBtn3: UIButton?
    var sortBtn4: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupSearchBar()
        setupSortView()
    }
    
    func setupView() {
        
        view.backgroundColor = UIColor.hex(0xF2F2F2)
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
    }
    
    func setupSearchBar() {
        
        containerView.addSubview(searchBar)
        searchBar.snp.makeConstraints { (make) in
            make.width.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        searchBar.placeholder = "搜索内容"
        searchBar.delegate = self
        searchBar.cancelBtnTap = { [weak self] in
            self?.searchBar.delegate?.searchBarCancelButtonClicked?(self!.searchBar)
        }
    }
    
    func setupSortView() {
        
        let backView = UIView().then { (b) in
            containerView.addSubview(b)
            b.snp.makeConstraints { (make) in
                make.width.equalToSuperview()
                make.centerX.equalToSuperview()
                make.top.equalTo(searchBar.snp.bottom)
                make.height.equalTo(40)
            }
            b.backgroundColor = UIColor.cyan
        }
        
        sortBtn1 = UIButton.init()
        backView.addSubview(sortBtn1 ?? UIView())
        sortBtn1?.snp.makeConstraints({ (make) in
            make.width.equalTo(UIScreen.width * 0.25)
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.height.equalToSuperview()
        })
        sortBtn1?.setTitle("排序标签", for: .normal)
        sortBtn1?.setTitleColor(UIColor.gray, for: .normal)
        
        sortBtn2 = UIButton.init()
        backView.addSubview(sortBtn2 ?? UIView())
        sortBtn2?.snp.makeConstraints({ (make) in
            make.width.equalTo(UIScreen.width * 0.25)
            make.left.equalTo(sortBtn1?.snp.right ?? UIView())
            make.top.equalTo(0)
            make.height.equalToSuperview()
        })
        sortBtn2?.setTitle("排序标签", for: .normal)
        sortBtn2?.setTitleColor(UIColor.gray, for: .normal)
        
        sortBtn3 = UIButton.init()
        backView.addSubview(sortBtn3 ?? UIView())
        sortBtn3?.snp.makeConstraints({ (make) in
            make.width.equalTo(UIScreen.width * 0.25)
            make.left.equalTo(sortBtn2?.snp.right ?? UIView())
            make.top.equalTo(0)
            make.height.equalToSuperview()
        })
        sortBtn3?.setTitle("排序标签", for: .normal)
        sortBtn3?.setTitleColor(UIColor.gray, for: .normal)
        
        sortBtn4 = UIButton.init()
        backView.addSubview(sortBtn4 ?? UIView())
        sortBtn4?.snp.makeConstraints({ (make) in
            make.width.equalTo(UIScreen.width * 0.25)
            make.left.equalTo(sortBtn3?.snp.right ?? UIView())
            make.top.equalToSuperview()
            make.height.equalToSuperview()
            make.right.equalToSuperview()
        })
        sortBtn4?.setTitle("排序标签", for: .normal)
        sortBtn4?.setTitleColor(UIColor.gray, for: .normal)
    }
}

extension MainPageDetailVC: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.cancelBtn.isHidden = false
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.searchBar.cancelBtn.isHidden = true
    }
}
