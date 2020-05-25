//
//  BalanceVC.swift
//  WeeLinkPro1
//
//  Created by Thomas Lau on 2020/5/25.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class BalanceVC: UIViewController {
    
    let locationView = LocationView()
    let detailView = DetailView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    func setupView() {
        
        view.backgroundColor = UIColor.systemBackColor
        
        view.addSubview(locationView)
        locationView.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(UIScreen.navBarHeight + 10)
            make.height.equalTo(90)
        }
    }

}
