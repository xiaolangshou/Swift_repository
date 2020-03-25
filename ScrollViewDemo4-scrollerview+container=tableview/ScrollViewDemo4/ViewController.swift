//
//  ViewController.swift
//  ScrollViewDemo4
//
//  Created by Thomas Lau on 2018/9/1.
//  Copyright © 2018年 Thomas Lau. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var dataArr = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
    
    let scrollView = UIScrollView()
    let containerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        scrollView.addSubview(containerView)
        containerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        setupView()
    }
    
    func setupView() {
        
        var prevCell: Cell?
        for (index, _) in dataArr.enumerated() {
            let cell = Cell()
            containerView.addSubview(cell)
            
            if let prevCell = prevCell {
                cell.snp.makeConstraints { (make) in
                    make.left.right.equalToSuperview()
                    make.height.equalTo(40)
                    make.top.equalTo(prevCell.snp.bottom).offset(5)
                    if index == dataArr.count - 1 {
                        make.bottom.equalToSuperview()
                    }
                }
            } else {
                cell.snp.makeConstraints { (make) in
                    make.left.right.equalToSuperview()
                    make.top.equalToSuperview()
                    make.height.equalTo(40)
                }
            }
            
            prevCell = cell
        }
    }

}

class Cell: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    func setupView() {
        backgroundColor = UIColor.cyan
    }
}
