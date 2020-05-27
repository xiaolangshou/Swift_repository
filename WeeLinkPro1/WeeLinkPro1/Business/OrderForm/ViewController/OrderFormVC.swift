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
    var containerView: UIView?
    
    let cellReuseIdentifier1 = "CollectionViewCell1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    func setupView() {
        
        scrollV = UIScrollView()
        view.addSubview(scrollV ?? UIScrollView())
        scrollV?.backgroundColor = UIColor.systemBackColor
        scrollV?.alwaysBounceVertical = true
        
        view.addSubview(scrollV!)
        scrollV!.snp.makeConstraints { (make) in
            make.top.equalTo(UIScreen.navBarHeight)
            make.left.right.bottom.equalToSuperview()
        }
        
        containerView = UIView.init()
        scrollV!.addSubview(containerView!)
        containerView!.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        scrollV?.alwaysBounceVertical = true
        
        avatarView = UIImageView().then({ (v) in
            containerView!.addSubview(v)
            v.snp.makeConstraints { (make) in
                make.width.equalToSuperview()
                make.height.equalTo(120)
                make.centerX.equalToSuperview()
                make.top.equalToSuperview()
            }
            v.image = UIImage.init(named: "11")

            let avatar = UIImageView()
            v.addSubview(avatar)
            avatar.snp.makeConstraints { (make) in
                make.width.height.equalTo(50)
                make.centerY.equalToSuperview()
                make.left.equalTo(15)
            }
            avatar.layer.cornerRadius = 25
            avatar.image = UIImage.init(named: "22")

            let name = UILabel()
            name.text = "thomas"
            v.addSubview(name)
            name.snp.makeConstraints { (make) in
                make.width.equalTo(80)
                make.height.equalTo(30)
                make.centerY.equalToSuperview()
                make.left.equalTo(avatar.snp.right).offset(10)
            }
            name.textColor = UIColor.white
            name.font = UIFont.PFHeavy(15)

            let settings = UIButton()
            v.addSubview(settings)
            settings.snp.makeConstraints { (make) in
                make.width.height.equalTo(40)
                make.centerY.equalToSuperview()
                make.right.equalTo(-10)
            }
            settings.backgroundColor = UIColor.cyan
            settings.addTarget(self, action: #selector(settingBtnTapped(btn:)), for: .touchUpInside)
        })
        
        orderView = UIStackView().then({ (o) in
            containerView!.addSubview(o)
            o.snp.makeConstraints { (make) in
                make.width.equalToSuperview()
                make.centerX.equalToSuperview()
                make.top.equalTo((avatarView?.snp.bottom)!).offset(10)
                make.height.equalTo(120)
            }
            o.backgroundColor = UIColor.purple
            
            o.alignment = .fill
            o.axis = .horizontal
            o.distribution = .equalSpacing
            
            let payView = SubOrderView.init().then { (b) in
                b.title = "待支付"
            }
            let cargoView = SubOrderView.init().then { (c) in
                c.title = "待收货"
            }
            let completeView = SubOrderView.init().then { (c) in
                c.title = "已完成"
            }
            let orderView = SubOrderView.init().then { (c) in
                c.title = "全部订单"
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
            containerView!.addSubview(c)
            c.snp.makeConstraints { (make) in
                make.width.equalToSuperview()
                make.centerX.equalToSuperview()
                make.top.equalTo((orderView?.snp.bottom)!).offset(10)
                make.height.equalTo(100)
            }
            c.backgroundColor = UIColor.white
            
            c.alignment = .fill
            c.axis = .horizontal
            c.distribution = .equalSpacing
            
            let payView = UIView.init().then { (b) in
                b.backgroundColor = UIColor.white
                let num = UILabel()
                b.addSubview(num)
                num.snp.makeConstraints { (make) in
                    make.width.equalTo(20)
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview().offset(-15)
                    make.height.equalTo(15)
                }
                num.text = "5"
                
                let descripe = UILabel()
                b.addSubview(descripe)
                descripe.snp.makeConstraints { (make) in
                    make.left.equalTo(10)
                    make.right.equalTo(-10)
                    make.centerY.equalToSuperview().offset(15)
                    make.height.equalTo(15)
                }
                descripe.textAlignment = .center
                descripe.text = "浏览足迹"
            }
            let cargoView = UIView.init().then { (c) in
                c.backgroundColor = UIColor.white
                let num = UILabel()
                c.addSubview(num)
                num.snp.makeConstraints { (make) in
                    make.width.equalTo(20)
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview().offset(-15)
                    make.height.equalTo(15)
                }
                num.text = "2"
                
                let descripe = UILabel()
                c.addSubview(descripe)
                descripe.snp.makeConstraints { (make) in
                    make.left.equalTo(10)
                    make.right.equalTo(-10)
                    make.centerY.equalToSuperview().offset(15)
                    make.height.equalTo(15)
                }
                descripe.textAlignment = .center
                descripe.text = "商品收藏"
            }
            let completeView = UIView.init().then { (c) in
                c.backgroundColor = UIColor.white
                let num = UILabel()
                c.addSubview(num)
                num.snp.makeConstraints { (make) in
                    make.width.equalTo(20)
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview().offset(-15)
                    make.height.equalTo(15)
                }
                num.text = "4"
                
                let descripe = UILabel()
                c.addSubview(descripe)
                descripe.snp.makeConstraints { (make) in
                    make.left.equalTo(10)
                    make.right.equalTo(-10)
                    make.centerY.equalToSuperview().offset(15)
                    make.height.equalTo(15)
                }
                descripe.textAlignment = .center
                descripe.text = "优惠券"
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
        containerView!.addSubview(funcView!)
        funcView!.snp.makeConstraints({ make in
            make.width.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(250)
            make.top.equalTo(cupponView!.snp.bottom).offset(10)
        })
        funcView!.tag = 1
        
        logoView = UIView().then({ (l) in
            containerView?.addSubview(l)
            l.snp.makeConstraints { (make) in
                make.width.equalToSuperview()
                make.centerX.equalToSuperview()
                make.height.equalTo(90)
                make.top.equalTo(funcView!.snp.bottom).offset(15)
                make.bottom.equalToSuperview()
            }
            l.backgroundColor = UIColor.white
            
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
    
    @objc func settingBtnTapped(btn: UIButton) {
        print(#function)
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
