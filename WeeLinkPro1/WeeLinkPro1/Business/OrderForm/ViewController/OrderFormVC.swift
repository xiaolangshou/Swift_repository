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
                make.height.equalTo(125)
                make.centerX.equalToSuperview()
                make.top.equalToSuperview()
            }
            v.image = UIImage.init(named: "我的_个人设置_背景")
            v.contentMode = .scaleAspectFill

            let avatar = UIImageView()
            v.addSubview(avatar)
            avatar.snp.makeConstraints { (make) in
                make.width.height.equalTo(60)
                make.centerY.equalToSuperview()
                make.left.equalTo(15)
            }
            avatar.layer.borderColor = UIColor.white.cgColor
            avatar.layer.borderWidth = 2.0
            avatar.layer.cornerRadius = 30
            avatar.image = UIImage.init(named: "22")
            avatar.clipsToBounds = true

            let name = UILabel()
            name.text = "thomas"
            v.addSubview(name)
            name.snp.makeConstraints { (make) in
                make.width.equalTo(80)
                make.height.equalTo(30)
                make.centerY.equalToSuperview()
                make.left.equalTo(avatar.snp.right).offset(20)
            }
            name.textColor = UIColor.white
            name.font = UIFont.PFHeavy(16)

            let settings = UIButton()
            v.addSubview(settings)
            settings.snp.makeConstraints { (make) in
                make.width.height.equalTo(30)
                make.centerY.equalToSuperview()
                make.right.equalTo(-10)
            }
            settings.setBackgroundImage(UIImage.init(named: "设置"), for: .normal)
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
                b.img = UIImage.init(named: "我的_待支付")
            }
            let cargoView = SubOrderView.init().then { (c) in
                c.title = "待收货"
                c.img = UIImage.init(named: "我的_待收货")
            }
            let completeView = SubOrderView.init().then { (c) in
                c.title = "已完成"
                c.img = UIImage.init(named: "我的_已完成")
            }
            let orderView = SubOrderView.init().then { (c) in
                c.title = "全部订单"
                c.img = UIImage.init(named: "我的_全部订单")
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
                descripe.font = UIFont.PFRegular(15)
                descripe.textColor = UIColor.hex(0x363636)
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
                descripe.font = UIFont.PFRegular(15)
                descripe.textColor = UIColor.hex(0x363636)
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
                descripe.font = UIFont.PFRegular(15)
                descripe.textColor = UIColor.hex(0x363636)
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
        
        logoView = UIStackView().then({ (c) in
            containerView!.addSubview(c)
            c.snp.makeConstraints { (make) in
                make.width.equalToSuperview()
                make.centerX.equalToSuperview()
                make.top.equalTo((cupponView?.snp.bottom)!).offset(10)
                make.height.equalTo(100)
            }
            c.backgroundColor = UIColor.white
            
            c.alignment = .fill
            c.axis = .horizontal
            c.distribution = .equalSpacing
            
            let payView = UIView.init().then { (b) in
                b.backgroundColor = UIColor.white
                let num = UIImageView()
                b.addSubview(num)
                num.snp.makeConstraints { (make) in
                    make.width.height.equalTo(60)
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview().offset(-15)
                }
                num.image = UIImage.init(named: "我的_收货地址")
                
                let descripe = UILabel()
                b.addSubview(descripe)
                descripe.snp.makeConstraints { (make) in
                    make.left.equalTo(10)
                    make.right.equalTo(-10)
                    make.centerY.equalToSuperview().offset(15)
                    make.height.equalTo(15)
                }
                descripe.textAlignment = .center
                descripe.text = "收货地址"
                descripe.font = UIFont.PFRegular(15)
                descripe.textColor = UIColor.hex(0x363636)
            }
            let cargoView = UIView.init().then { (c) in
                c.backgroundColor = UIColor.white
                let num = UIImageView()
                c.addSubview(num)
                num.snp.makeConstraints { (make) in
                    make.width.height.equalTo(60)
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview().offset(-15)
                }
                num.image = UIImage.init(named: "我的_在线客服")
                
                let descripe = UILabel()
                c.addSubview(descripe)
                descripe.snp.makeConstraints { (make) in
                    make.left.equalTo(10)
                    make.right.equalTo(-10)
                    make.centerY.equalToSuperview().offset(15)
                    make.height.equalTo(15)
                }
                descripe.textAlignment = .center
                descripe.text = "在线客服"
                descripe.font = UIFont.PFRegular(15)
                descripe.textColor = UIColor.hex(0x363636)
            }
            let completeView = UIView.init().then { (c) in
                c.backgroundColor = UIColor.white
                let num = UIImageView()
                c.addSubview(num)
                num.snp.makeConstraints { (make) in
                    make.width.height.equalTo(60)
                    make.centerX.equalToSuperview()
                    make.centerY.equalToSuperview().offset(-15)
                }
                num.image = UIImage.init(named: "我的_我的_公司简介")
                
                let descripe = UILabel()
                c.addSubview(descripe)
                descripe.snp.makeConstraints { (make) in
                    make.left.equalTo(10)
                    make.right.equalTo(-10)
                    make.centerY.equalToSuperview().offset(15)
                    make.height.equalTo(15)
                }
                descripe.textAlignment = .center
                descripe.text = "商铺简介"
                descripe.font = UIFont.PFRegular(15)
                descripe.textColor = UIColor.hex(0x363636)
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
    }
    
    @objc func settingBtnTapped(btn: UIButton) {
        print(#function)
    }
}
