//
//  OrderFormVC.swift
//  WeeLinkPro1
//
//  Created by Liu Tao on 2020/5/14.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class OrderFormVC: UIViewController {

    static let shared = OrderFormVC()
    
    var avatarView: UIImageView?
    var orderView: UIView?
    var cupponView: UIView?
    var funcView: UICollectionView?
    var logoView: UIView?
    
    var scrollV: UIScrollView?
    
    let cellReuseIdentifier1 = "CollectionViewCell1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    func setupView() {
        
        scrollV = UIScrollView(frame: CGRect(x: 0,
                                             y: UIScreen.navBarHeight,
                                             width: UIScreen.width,
                                             height: UIScreen.height - UIScreen.navBarHeight))
        view.addSubview(scrollV ?? UIScrollView())
        scrollV?.backgroundColor = UIColor.lightGray
        scrollV?.alwaysBounceVertical = true
        
        avatarView = UIImageView().then({ (v) in
            scrollV!.addSubview(v)
            v.snp.makeConstraints { (make) in
                make.width.equalToSuperview()
                make.height.equalTo(120)
                make.centerX.equalToSuperview()
                make.top.equalToSuperview()
            }
            v.backgroundColor = UIColor.cyan

            let avatar = UIImageView()
            v.addSubview(avatar)
            avatar.snp.makeConstraints { (make) in
                make.width.height.equalTo(50)
                make.centerY.equalToSuperview()
                make.left.equalTo(15)
            }
            avatar.layer.cornerRadius = 25
            avatar.backgroundColor = UIColor.green

            let name = UILabel()
            name.text = "thomas"
            v.addSubview(name)
            name.snp.makeConstraints { (make) in
                make.width.equalTo(80)
                make.height.equalTo(30)
                make.centerY.equalToSuperview()
                make.left.equalTo(avatar.snp.right).offset(5)
            }

            let settings = UIButton()
            v.addSubview(settings)
            settings.snp.makeConstraints { (make) in
                make.width.height.equalTo(40)
                make.centerY.equalToSuperview()
                make.right.equalTo(-10)
            }
            settings.backgroundColor = UIColor.green
        })
        
        orderView = UIStackView().then({ (o) in
            scrollV!.addSubview(o)
            o.snp.makeConstraints { (make) in
                make.width.equalToSuperview()
                make.centerX.equalToSuperview()
                make.top.equalTo((avatarView?.snp.bottom)!).offset(5)
                make.height.equalTo(100)
            }
            o.backgroundColor = UIColor.purple
            
            o.alignment = .fill
            o.axis = .horizontal
            o.distribution = .equalSpacing
            
            let payView = UIView.init().then { (b) in
                b.backgroundColor = UIColor.green
            }
            let cargoView = UIView.init().then { (c) in
                c.backgroundColor = UIColor.red
            }
            let completeView = UIView.init().then { (c) in
                c.backgroundColor = UIColor.green
            }
            let orderView = UIView.init().then { (c) in
                c.backgroundColor = UIColor.red
            }
            o.addArrangedSubview(payView)
            payView.snp.makeConstraints { (make) in
                make.width.equalTo(UIScreen.width * 0.25)
            }
            o.addArrangedSubview(cargoView)
            cargoView.snp.makeConstraints { (make) in
                make.width.equalTo(UIScreen.width * 0.25)
            }
            o.addArrangedSubview(completeView)
            completeView.snp.makeConstraints { (make) in
                make.width.equalTo(UIScreen.width * 0.25)
            }
            o.addArrangedSubview(orderView)
            orderView.snp.makeConstraints { (make) in
                make.width.equalTo(UIScreen.width * 0.25)
            }
        })
        
        cupponView = UIStackView().then({ (c) in
            scrollV!.addSubview(c)
            c.snp.makeConstraints { (make) in
                make.width.equalToSuperview()
                make.centerX.equalToSuperview()
                make.top.equalTo((orderView?.snp.bottom)!).offset(5)
                make.height.equalTo(100)
            }
            c.backgroundColor = UIColor.purple
            
            c.alignment = .fill
            c.axis = .horizontal
            c.distribution = .equalSpacing
            
            let payView = UIView.init().then { (b) in
                b.backgroundColor = UIColor.green
            }
            let cargoView = UIView.init().then { (c) in
                c.backgroundColor = UIColor.red
            }
            let completeView = UIView.init().then { (c) in
                c.backgroundColor = UIColor.green
            }

            c.addArrangedSubview(payView)
            payView.snp.makeConstraints { (make) in
                make.width.equalTo(UIScreen.width * 0.33)
            }
            c.addArrangedSubview(cargoView)
            cargoView.snp.makeConstraints { (make) in
                make.width.equalTo(UIScreen.width * 0.33)
            }
            c.addArrangedSubview(completeView)
            completeView.snp.makeConstraints { (make) in
                make.width.equalTo(UIScreen.width * 0.33)
            }
        })
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (UIScreen.width - 40) / 6,
                                 height: 80)
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 16, left: 14, bottom: 0, right: 18)
        layout.headerReferenceSize = CGSize(width: UIScreen.width, height: 40)
        
        funcView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        funcView!.isScrollEnabled = false
        funcView!.delegate = self
        funcView!.dataSource = self
        funcView!.register(MiniCollectionViewCell.self,
                                 forCellWithReuseIdentifier: cellReuseIdentifier1)
        funcView!.backgroundColor = UIColor.white
        scrollV!.addSubview(funcView!)
        funcView!.snp.makeConstraints({ make in
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(250)
            make.top.equalTo(cupponView!.snp.bottom)
        })
        funcView!.tag = 1
        
        logoView = UIView().then({ (l) in
            scrollV?.addSubview(l)
            l.snp.makeConstraints { (make) in
                make.width.equalToSuperview()
                make.centerX.equalToSuperview()
                make.height.equalTo(90)
                make.top.equalTo(funcView!.snp.bottom)
            }
            l.backgroundColor = UIColor.blue
            
            _ = UIImageView().then { (i) in
                l.addSubview(i)
                i.snp.makeConstraints { (make) in
                    make.width.height.equalTo(60)
                    make.center.equalToSuperview()
                }
                i.backgroundColor = UIColor.green
            }
        })
    }
}

extension OrderFormVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
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
        
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier1,
                                                          for: indexPath) as! MiniCollectionViewCell
        
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let cell = collectionView.cellForItem(at: indexPath) as! MiniCollectionViewCell
        
    }
    
}
