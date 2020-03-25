//
//  SubView.swift
//  ClosureDemo3
//
//  Created by Liu Tao on 2018/11/21.
//  Copyright © 2018 Liu Tao. All rights reserved.
//

import UIKit

class SubView: UIView {
    
    var btnTapped: ((Int) -> Void)?
    var btn2Tapped: ((String) -> Void)?
    
    let btn = UIButton.init(frame: CGRect.init(x: 50, y: 100, width: 50, height: 25))
    let btn2 = UIButton.init(frame: CGRect.init(x: 100, y: 400, width: 50, height: 25))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    func setupView() {
        
        self.backgroundColor = UIColor.green
        
        btn.backgroundColor = UIColor.cyan
        btn.addTarget(self, action: #selector(theBtnTapped), for: .touchUpInside)
        self.addSubview(btn)
        
        btn2.backgroundColor = UIColor.red
        btn2.addTarget(self, action: #selector(theBtn2Tapped), for: .touchUpInside)
        self.addSubview(btn2)
    }
    
    @objc func theBtnTapped() {
        
        btnTapped?(1000)
    }
    
    @objc func theBtn2Tapped() {
        
        btn2Tapped?("button 2 tapped...")
    }

}
