//
//  ViewController.swift
//  UIStackViewDemo
//
//  Created by Liu Tao on 2020/5/24.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewA = UIImageView()
        let viewB = UIImageView()
        let viewC = UIImageView()
        //设置其颜色
        viewA.backgroundColor = .blue
        viewB.backgroundColor = .black
        viewC.backgroundColor = .orange
        //初始化stackView
        let stackView = UIStackView(arrangedSubviews: [viewA,viewB,viewC])
        stackView.frame = CGRect(x: 10, y: 250, width: 300, height: 300)
        //设置UIStackView内View的排列：横向或纵向
        stackView.axis = .horizontal
        //设置UIStackView内View对齐方式
        stackView.alignment = .fill
        //设置UIStackView内View沿axis排列的布局规则
        stackView.distribution = .fillEqually
        //设置UIStackView内View之间的间距
        stackView.spacing = 10
        //设置UIStackView背景颜色
        stackView.backgroundColor = UIColor.blue
        //添加到视图中
        self.view.addSubview(stackView)
        
        
        
        //单个调整View的间距
//        let view = stackView.arrangedSubviews[0]
//        stackView.setCustomSpacing(30, after: view)
//        //添加View
//        let viewD = UIView()
//        viewD.backgroundColor = .green
//        stackView.insertArrangedSubview(viewD, at: 3)
//        //删除View
//        let RemoveView = stackView.arrangedSubviews[2]
//        stackView.removeArrangedSubview(RemoveView)
    }


}

