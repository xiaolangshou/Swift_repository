//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Liu Tao on 2020/5/15.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var collectionView: UICollectionView?
    
    let cellReuseIdentifier = "CollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
    }

    func setupCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.size.width - 40) / 2,
                                 height: 40)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 16, left: 14, bottom: 0, right: 18)
        
        collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        collectionView?.alwaysBounceVertical = true
        collectionView?.isScrollEnabled = true
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView!.register(CollectionViewCell.self,
                                 forCellWithReuseIdentifier: cellReuseIdentifier)
        collectionView?.backgroundColor = UIColor.white
        view.addSubview(collectionView!)
        collectionView?.snp.makeConstraints({ make in
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-48)
            make.top.equalTo(20)
        })
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier,
                                                      for: indexPath) as! CollectionViewCell
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        
    }
}
