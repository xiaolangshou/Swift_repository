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
    var funcView: UIView?
    var logoView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    func setupView() {
        
        let scrollV = UIScrollView().then { (s) in
            view.addSubview(s)
            s.snp.makeConstraints { (make) in
                make.top.equalTo(UIScreen.navBarHeight)
                make.left.right.bottom.equalToSuperview()
            }
            s.alwaysBounceVertical = true
            s.alwaysBounceHorizontal = false
            s.backgroundColor = UIColor.lightGray
        }
        
        avatarView = UIImageView().then({ (v) in
            scrollV.addSubview(v)
            v.snp.makeConstraints { (make) in
                make.top.equalTo(0)
                make.left.right.equalTo(0)
                make.height.equalTo(120)
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
    }
}
