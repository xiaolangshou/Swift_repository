//
//  YLXHomeView.swift
//  SDKFramework
//
//  Created by Thomas Lau on 2020/3/5.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

public class YLXHomeView: UIView {
    
    let btn = UIButton()
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        backgroundColor = UIColor.cyan
        
        btn.frame = CGRect.init(x: 0, y: 0, width: 50, height: 20)
        btn.backgroundColor = UIColor.red
        addSubview(btn)
    }
}
