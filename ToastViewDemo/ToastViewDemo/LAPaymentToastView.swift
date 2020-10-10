//
//  LAPaymentToastView.swift
//  ToastViewDemo
//
//  Created by Thomas Lau on 2020/10/7.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit
import SnapKit

class LAPaymentToastView: UIView {
    
    let centerView = UIView()
    let titleLbl = UILabel()
    let subTitleLbl = UILabel()
    let okBtn = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        backgroundColor = UIColor.init(white: 0, alpha: 0.85)
        
        centerView.backgroundColor = UIColor.white
        centerView.layer.cornerRadius = 8.0
        self.addSubview(centerView)
        centerView.snp.makeConstraints { make in
            make.left.equalTo(32)
            make.right.equalTo(-32)
            make.height.equalTo(250)
            make.centerY.equalToSuperview()
        }
        
        titleLbl.text = "Handling fee"
        titleLbl.textAlignment = .center
        centerView.addSubview(titleLbl)
        titleLbl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(12)
            make.height.equalTo(24)
        }
        
        subTitleLbl.text = "1% installment handling fee will be when you pay by installment or COD."
        subTitleLbl.lineBreakMode = .byWordWrapping
        subTitleLbl.numberOfLines = 0
        subTitleLbl.textAlignment = .center
        centerView.addSubview(subTitleLbl)
        subTitleLbl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLbl.snp.bottom).offset(15)
            make.left.equalTo(10)
            make.right.equalTo(-10)
        }
        
        okBtn.setTitle("OK", for: .normal)
        okBtn.setBackgroundImage(UIImage.init(named: "Rectangle 6"), for: .normal)
        okBtn.layer.cornerRadius = 6
        centerView.addSubview(okBtn)
        okBtn.snp.makeConstraints { make in
            make.bottom.equalTo(-10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(38)
        }
        okBtn.addTarget(self, action: #selector(hide), for: .touchUpInside)
        
    }
    
    @objc func hide() {
        self.removeFromSuperview()
    }
}

extension UIWindow {
    
    var topVC: UIViewController? {
        if let tabVC = self.rootViewController as? UITabBarController,
            let navVC = tabVC.selectedViewController as? UINavigationController,
            let topVC = navVC.topViewController {
            return topVC
        }
        return nil
    }
}
