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
    
    let cellReuseIdentifier1 = "CollectionViewCell1"
    let cellReuseIdentifier2 = "CollectionViewCell2"
    let scrollView = UIScrollView()
    let containerView = UIView()
    let searchBar = SearchBar()
    let banner = Banner()
    var collectionView1: UICollectionView?
    var collectionView2: UICollectionView?
    var collectionView3: UICollectionView?
    
    var miniCellArr: [[String]] = [["热销","首页图标_热门"], ["新品","首页图标_新品"], ["苹果","首页图标_苹果"],
                                   ["香蕉","首页图标_香蕉"], ["樱桃","首页图标_樱桃"], ["柠檬","首页图标_柠檬"],
                                   ["西瓜","首页图标_西瓜"], ["猕猴桃","首页图标_猕猴桃"], ["草莓","首页图标_草莓"],
                                   ["葡萄","首页图标_葡萄"]]
    var cellArr: [[String]] = [["苹果","水果_苹果"],["蓝莓","水果_蓝莓"],["杨梅","水果_杨梅"],
                               ["香蕉","水果_香蕉"],["百香果","水果_百香果"],["橙子","水果_橙子"]]
    
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
    }
    
    func setupBanner() {
        
        banner.type = .pageCon
        containerView.addSubview(banner)
        banner.snp.makeConstraints { (make) in
            make.top.equalTo(searchBar.snp.bottom)
            make.height.equalTo(UIScreen.width * 203 / 375)
            make.left.right.equalToSuperview()
        }
        banner.imageArray.append(UIImage.init(named: "百香果_详情1")!)
        banner.imageArray.append(UIImage.init(named: "百香果_详情2")!)
        banner.imageArray.append(UIImage.init(named: "百香果_详情3")!)
        banner.count = 3
        
        banner.onClickBanner = { [unowned self] idx in
            print(idx)
            print(self.banner)
        }
    }
    
    func setupMiniCategory() {
        
        let header = CollectionViewHeader()
        containerView.addSubview(header)
        header.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
            make.top.equalTo(banner.snp.bottom)
        }
        header.rightBtnTap = {
            print(#function)
        }
        
        let layout = UICollectionViewFlowLayout()
        if UIDevice.isPhoneX {
            layout.itemSize = CGSize(width: (UIScreen.width - 40) / 6,
                                 height: 80)
        } else {
            layout.itemSize = CGSize(width: (UIScreen.width - 40) / 6,
                                     height: 75)
        }
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 16, left: 14, bottom: 0, right: 18)
        layout.headerReferenceSize = CGSize(width: UIScreen.width, height: 40)
        
        collectionView1 = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        collectionView1?.isScrollEnabled = false
        collectionView1?.delegate = self
        collectionView1?.dataSource = self
        collectionView1?.register(MiniCollectionViewCell.self,
                                 forCellWithReuseIdentifier: cellReuseIdentifier1)
        collectionView1?.backgroundColor = UIColor.white
        containerView.addSubview(collectionView1 ?? UICollectionView())
        collectionView1?.snp.makeConstraints({ make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(235)
            make.top.equalTo(header.snp.bottom)
        })
        collectionView1?.tag = 1
    }
    
    func setupCategory2() {
        
        let header = CollectionViewHeader()
        containerView.addSubview(header)
        header.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
            make.top.equalTo(collectionView1?.snp.bottom ?? UICollectionView().snp.bottom).offset(20)
        }
        header.rightBtnTap = {
            print(#function)
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 160,
                                 height: 220)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 16, left: 14, bottom: 0, right: 18)
        layout.scrollDirection = .horizontal
        
        collectionView2 = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        collectionView2?.delegate = self
        collectionView2?.dataSource = self
        collectionView2?.register(CollectionViewCell.self,
                                 forCellWithReuseIdentifier: cellReuseIdentifier2)
        collectionView2?.backgroundColor = UIColor.white
        containerView.addSubview(collectionView2 ?? UICollectionView())
        collectionView2?.snp.makeConstraints({ make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(285)
            make.top.equalTo(header.snp.bottom)
        })
        collectionView2?.tag = 2
    }
    
    func setupCategory3() {
        
        let header = CollectionViewHeader()
        containerView.addSubview(header)
        header.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(40)
            make.top.equalTo(collectionView2?.snp.bottom ?? UICollectionView().snp.bottom).offset(20)
        }
        header.rightBtnTap = {
            print(#function)
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 160,
                                 height: 220)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 16, left: 14, bottom: 0, right: 18)
        layout.scrollDirection = .horizontal
        
        collectionView3 = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        collectionView3?.delegate = self
        collectionView3?.dataSource = self
        collectionView3?.register(CollectionViewCell.self,
                                 forCellWithReuseIdentifier: cellReuseIdentifier2)
        collectionView3?.backgroundColor = UIColor.white
        containerView.addSubview(collectionView3 ?? UICollectionView())
        collectionView3?.snp.makeConstraints({ make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(285)
            make.bottom.equalToSuperview()
            make.top.equalTo(header.snp.bottom)
        })
        collectionView3?.tag = 3
    }
}

extension MainPageVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in _collectionView: UICollectionView)
        -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int)
        -> Int
    {
        switch collectionView.tag {
        case 1:
            return miniCellArr.count
        case 2:
            return cellArr.count
        case 3:
            return cellArr.count
        default:
            return miniCellArr.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell
    {
        
        switch collectionView.tag {
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier1,
                                                          for: indexPath) as! MiniCollectionViewCell
            cell.imgView.image = UIImage.init(named: miniCellArr[indexPath.row][1])
            cell.subscriptLbl.text = miniCellArr[indexPath.row][0]
            
            return cell
            
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier2,
                                                          for: indexPath) as! CollectionViewCell
            cell.imgView.image = UIImage.init(named: cellArr[indexPath.row][1])
            cell.nameLbl.text = cellArr[indexPath.row][0]
            
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier2,
                                                          for: indexPath) as! CollectionViewCell
            cell.imgView.image = UIImage.init(named: cellArr[indexPath.row][1])
            cell.nameLbl.text = cellArr[indexPath.row][0]
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier2,
                                                          for: indexPath) as! CollectionViewCell
            return cell
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView.tag {
        case 1:
            let vc = MainPageDetailVC()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = ProductDetailVC()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = ProductDetailVC()
            vc.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(vc, animated: true)
        default: break
        }
    }
}

extension MainPageVC: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print(#function)
        
        searchBar.resignFirstResponder()
        
        let vc = HistoryVC.shared
        
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print(#function)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(#function)
        searchBar.resignFirstResponder()
    }
}
