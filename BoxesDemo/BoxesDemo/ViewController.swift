//
//  ViewController.swift
//  BoxesDemo
//
//  Created by Thomas Lau on 2020/11/7.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let dataArr = [[1,1,1,1],[1,1,1,1,1,1,1,1,1,1,1,1,1]]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vStack = UIStackView.init(frame: CGRect.init(x: 50,
                                                         y: 100,
                                                         width: UIScreen.main.bounds.width - 100,
                                                         height: 200))
        vStack.axis = .vertical
        vStack.alignment = .leading
        vStack.distribution = .fillEqually
        view.addSubview(vStack)
        
        for i in dataArr {
            let cell = Cell()
            vStack.addArrangedSubview(cell)
            cell.snp.makeConstraints { (make) in
                make.left.right.equalToSuperview()
            }
            
            for j in i {
                
            }
        }
        
    }

    

}

class Cell: UIView {
    
    var arr = [1,1,1,1,1]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupView()
    }
    
    func setupView() {
        
        self.backgroundColor = UIColor.cyan
        layer.borderWidth = 1
        layer.borderColor = UIColor.red.cgColor
        
        var preS = UIImageView()
        for (i,v) in arr.enumerated() {
            let s = UIImageView.init()
            s.backgroundColor = UIColor.green
            self.addSubview(s)
            if i == 0 {
                s.snp.makeConstraints { make in
                    make.left.top.bottom.equalToSuperview()
                    make.width.equalTo(40)
                }
            } else if i == arr.count - 1 {
                s.snp.makeConstraints { make in
                    make.left.equalTo(preS.snp.right).offset(5)
                    make.top.bottom.equalToSuperview()
                    make.width.equalTo(40)
                    make.right.equalToSuperview()
                }
            } else {
                s.snp.makeConstraints { make in
                    make.left.equalTo(preS.snp.right).offset(5)
                    make.top.bottom.equalToSuperview()
                    make.width.equalTo(40)
                }
            }
            
            preS = s
        }
    }
}
