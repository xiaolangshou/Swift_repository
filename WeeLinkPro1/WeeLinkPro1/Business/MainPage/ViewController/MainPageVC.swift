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
    
    var dataArr = [1,1,1,1,1]
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    let searchBar = UISearchBar()
    let banner = Banner()
    let collectionView1 = UIView()
    let collectionView2 = UIView()
    let collectionView3 = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupSearchBar()
        setupBanner()
        setupMiniCategory()
        setupCategory2()
        setupCategory3()
    }

    func setupView() {
        
        view.backgroundColor = UIColor.hex(0xF2F2F2)
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(90)
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
    }
    
    func setupBanner() {
        
        containerView.addSubview(banner)
        banner.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottom)
            make.height.equalTo(200)
            make.left.right.equalToSuperview()
        }
        banner.imageArray.append(UIImage.init(named: "11")!)
        banner.imageArray.append(UIImage.init(named: "22")!)
        banner.imageArray.append(UIImage.init(named: "11")!)
        banner.imageArray.append(UIImage.init(named: "22")!)
        banner.imageArray.append(UIImage.init(named: "11")!)
        banner.count = 5
        
        banner.onClickBanner = { [unowned self] idx in
            
        }
    }
    
    func setupMiniCategory() {
        
        containerView.addSubview(collectionView1)
        collectionView1.snp.makeConstraints { (make) in
            make.top.equalTo(banner.snp.bottom).offset(10)
            make.height.equalTo(200)
            make.left.right.equalToSuperview()
        }
        collectionView1.backgroundColor = UIColor.green
//        collectionView.supplementaryView(forElementKind: <#T##String#>, at: <#T##IndexPath#>)
        
    }
    
    func setupCategory2() {
        
        containerView.addSubview(collectionView2)
        collectionView2.snp.makeConstraints { (make) in
            make.top.equalTo(collectionView1.snp.bottom)
            make.height.equalTo(200)
            make.left.right.equalToSuperview()
        }
        collectionView2.backgroundColor = UIColor.cyan
    }
    
    func setupCategory3() {
        
        containerView.addSubview(collectionView3)
        collectionView3.snp.makeConstraints { (make) in
            make.top.equalTo(collectionView2.snp.bottom)
            make.height.equalTo(200)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        collectionView3.backgroundColor = UIColor.blue
    }
}
