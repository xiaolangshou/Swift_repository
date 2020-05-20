//
//  ProductDetailVC.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/5/20.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class ProductDetailVC: UIViewController {
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    
    var banner: Banner?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
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
        
        setupBanner()
        setupDetailView()
    }
    
    func setupBanner() {
        
        banner = Banner()
        banner!.type = .rightCorn
        containerView.addSubview(banner!)
        banner!.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(300)
        }
        banner!.imageArray.append(UIImage.init(named: "11")!)
        banner!.imageArray.append(UIImage.init(named: "22")!)
        banner!.imageArray.append(UIImage.init(named: "11")!)
        banner!.imageArray.append(UIImage.init(named: "22")!)
        banner!.imageArray.append(UIImage.init(named: "11")!)
        banner!.imageArray.append(UIImage.init(named: "22")!)
        banner!.imageArray.append(UIImage.init(named: "11")!)
        banner!.count = 7
        
        banner!.onClickBanner = { [unowned self] idx in
            print(idx)
        }
    }
    
    func setupDetailView() {
        
        let nameLbl = UILabel.init()
        let numLbl = UILabel.init()
        let detailLbl = UILabel.init()
        let priceLbl = UILabel.init()
        let saleLbl = UILabel.init()
        
        let subView = UIView.init().then({ (s) in
            containerView.addSubview(s)
            s.snp.makeConstraints { (make) in
                make.left.right.equalToSuperview()
                make.top.equalTo((banner?.snp.bottom)!)
                make.height.equalTo(110)
                make.bottom.equalToSuperview()
            }
            s.backgroundColor = UIColor.cyan
            
            s.addSubview(nameLbl)
            nameLbl.text = "商品名称"
            nameLbl.snp.makeConstraints { (make) in
                make.left.top.equalTo(10)
                make.width.equalTo(90)
                make.height.equalTo(30)
            }
            
            s.addSubview(numLbl)
            numLbl.text = "16（只）"
            numLbl.snp.makeConstraints { (make) in
                make.left.equalTo(10)
                make.top.equalTo(nameLbl.snp.bottom).offset(5)
                make.width.equalTo(90)
                make.height.equalTo(20)
            }
            
            s.addSubview(detailLbl)
            detailLbl.text = "副内容"
            detailLbl.snp.makeConstraints { (make) in
                make.left.equalTo(numLbl.snp.right).offset(5)
                make.right.equalTo(-10)
                make.centerY.equalTo(numLbl.snp.centerY)
                make.height.equalTo(20)
            }
            
            s.addSubview(priceLbl)
            priceLbl.text = "￥32.5 ￥38.5"
            priceLbl.snp.makeConstraints { (make) in
                make.width.equalTo(110)
                make.height.equalTo(20)
                make.left.equalTo(10)
                make.bottom.equalToSuperview().offset(-5)
            }
            
            s.addSubview(saleLbl)
            saleLbl.text = "月销量5251件"
            saleLbl.snp.makeConstraints { (make) in
                make.right.equalTo(-10)
                make.left.equalTo(priceLbl.snp.right)
                make.centerY.equalTo(priceLbl.snp.centerY)
            }
            saleLbl.textAlignment = .right
        })
        
        let specsView = UIView().then { (v) in
            containerView.addSubview(v)
            v.snp.makeConstraints { (make) in
                make.width.equalToSuperview()
                make.top.equalTo(subView.snp.bottom).offset(6)
                make.centerX.equalToSuperview()
                make.height.equalTo(40)
            }
            v.backgroundColor = UIColor.cyan
            
            let specsLbl = UILabel().then { (s) in
                v.addSubview(s)
                s.snp.makeConstraints { (make) in
                    make.width.equalTo(80)
                    make.left.equalTo(10)
                    make.centerY.equalToSuperview()
                }
                s.text = "规格"
            }
            
            let specsficationLbl = UILabel().then { (s) in
                v.addSubview(s)
                s.snp.makeConstraints { (make) in
                    make.width.equalTo(120)
                    make.left.equalTo(specsLbl.snp.right).offset(12)
                    make.centerY.equalToSuperview()
                }
                s.text = "六斤装-约16个"
            }
        }
        
    }
}

class DetailCell: UIView {
    
    let avatar = UIImageView()
    let name = UILabel()
    let comment = UILabel()
    let imgStack = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    func setupView() {
        
        self.addSubview(avatar)
        avatar.snp.makeConstraints { (make) in
            make.width.height.equalTo(50)
            make.left.equalTo(12)
            make.top.equalTo(18)
        }
        avatar.backgroundColor = UIColor.cyan
        
        self.addSubview(name)
        name.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.centerY.equalTo(avatar.snp.centerY)
            make.left.equalTo(avatar.snp.right)
        }
        name.text = "thomas"
        
//        self.addSubview(comment)
//        comment.snp.makeConstraints { (make) in
//            make.width.equalTo(<#T##other: ConstraintRelatableTarget##ConstraintRelatableTarget#>)
//        }
    }
}
