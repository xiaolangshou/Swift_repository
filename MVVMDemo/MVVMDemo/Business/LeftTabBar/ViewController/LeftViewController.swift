//
//  LeftViewController.swift
//  MVVMDemo
//
//  Created by Liu Tao on 2018/11/29.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import SnapKit

class LeftViewController: UIViewController {

    static let shared = LeftViewController()
    
    private var leftViewModel: LeftViewModel?
    
    private let aliView = AliView()
    private let bag = DisposeBag()
    private let btn = UIButton()
    private let cityTF = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
  
        view.backgroundColor = UIColor.orange
        
        cityTF.backgroundColor = UIColor.lightGray
        cityTF.keyboardType = .phonePad
        cityTF.borderStyle = .none
        cityTF.cornerRadius = 5.0
        cityTF.becomeSubviewIn(view)
        cityTF.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(40)
        }
        
        btn.setTitle("确定", for: .normal)
        btn.addTarget(self, action: #selector(btnTapped), for: .touchUpInside)
        btn.becomeSubviewIn(view)
        btn.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(40)
            make.top.equalTo(cityTF.snp.bottom).offset(10)
        }
        
        aliView.becomeSubviewIn(view)
        aliView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalTo(-100)
            make.height.equalTo(200)
        }
        
        bindUI()
    }
    
    func bindUI() {
        
        leftViewModel = LeftViewModel(cityName: "")
        leftViewModel?.aliData.asDriver().drive(aliView.displayData).disposed(by: bag)
    }
    
    @objc func btnTapped() {
        leftViewModel?.requestData(city: "苏州市")
    }
    
}
