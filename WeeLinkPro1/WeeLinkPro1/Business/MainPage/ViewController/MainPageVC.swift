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
            make.height.equalTo(203)
            make.left.right.equalToSuperview()
        }
        banner.imageArray.append(UIImage.init(named: "11")!)
        banner.imageArray.append(UIImage.init(named: "22")!)
        banner.imageArray.append(UIImage.init(named: "11")!)
        banner.imageArray.append(UIImage.init(named: "22")!)
        banner.imageArray.append(UIImage.init(named: "11")!)
        banner.count = 5
        
        banner.onClickBanner = { [unowned self] idx in
            print(idx)
        }
    }
    
    func setupMiniCategory() {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.width - 40) / 6,
                                 height: 80)
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
            make.height.equalTo(250)
            make.top.equalTo(banner.snp.bottom)
        })
        collectionView1?.tag = 1
        collectionView1?.register(CollectionReusableView.self,
                                  forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                  withReuseIdentifier: "SimpleCollectionHeaderView")
    }
    
    func setupCategory2() {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 160,
                                 height: 220)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 16, left: 14, bottom: 0, right: 18)
        layout.headerReferenceSize = CGSize(width: UIScreen.width, height: 40)
        
        collectionView2 = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        collectionView2?.isScrollEnabled = false
        collectionView2?.delegate = self
        collectionView2?.dataSource = self
        collectionView2?.register(CollectionViewCell.self,
                                 forCellWithReuseIdentifier: cellReuseIdentifier2)
        collectionView2?.backgroundColor = UIColor.white
        containerView.addSubview(collectionView2 ?? UICollectionView())
        collectionView2?.snp.makeConstraints({ make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(300)
            make.top.equalTo(collectionView1?.snp.bottom ?? UICollectionView().snp.bottom).offset(20)
        })
        collectionView2?.tag = 2
        collectionView2?.register(CollectionReusableView.self,
                                  forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                  withReuseIdentifier: "SimpleCollectionHeaderView")
    }
    
    func setupCategory3() {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 160,
                                 height: 220)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 16, left: 14, bottom: 0, right: 18)
        layout.headerReferenceSize = CGSize(width: UIScreen.width, height: 40)
        
        collectionView3 = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        collectionView3?.isScrollEnabled = false
        collectionView3?.delegate = self
        collectionView3?.dataSource = self
        collectionView3?.register(CollectionViewCell.self,
                                 forCellWithReuseIdentifier: cellReuseIdentifier2)
        collectionView3?.backgroundColor = UIColor.white
        containerView.addSubview(collectionView3 ?? UICollectionView())
        collectionView3?.snp.makeConstraints({ make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(300)
            make.bottom.equalToSuperview()
            make.top.equalTo(collectionView2?.snp.bottom ?? UICollectionView().snp.bottom).offset(20)
        })
        collectionView3?.tag = 3
        collectionView3?.register(CollectionReusableView.self,
                                  forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                  withReuseIdentifier: "SimpleCollectionHeaderView")
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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell
    {
        
        var cell: UICollectionViewCell?
        
        switch collectionView.tag {
        case 1:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier1,
                                                          for: indexPath) as! MiniCollectionViewCell
        case 2:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier2,
                                                          for: indexPath) as! CollectionViewCell
        case 3:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier2,
                                                          for: indexPath) as! CollectionViewCell
        default:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier2,
                                                          for: indexPath) as! CollectionViewCell
        }
        
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView.tag {
        case 1:
            let vc = MainPageDetailVC()
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = ProductDetailVC()
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = ProductDetailVC()
            navigationController?.pushViewController(vc, animated: true)
        default: break
        }
//        cell = collectionView.cellForItem(at: indexPath) as! MiniCollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var supplementaryView: UICollectionReusableView? = nil
        let header: CollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SimpleCollectionHeaderView", for: indexPath) as! CollectionReusableView
        supplementaryView = header
        header.rightBtnTap = { [weak self] in
            print("rightBtnTap")
        }
        
        return supplementaryView!
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
