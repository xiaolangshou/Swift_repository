//
//  ViewController.swift
//  PartCornerRadiusDemo
//
//  Created by Thomas Lau on 2020/12/30.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UIView()
        label.backgroundColor = UIColor.orange
               
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalTo(200)
            make.left.right.equalToSuperview()
        }
        label.layer.mask = UIView.configRectCorner(view: label, corner: [.topRight, .topLeft], radii: CGSize(width: 8, height: 8))
    }
}


