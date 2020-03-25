//
//  MainViewController.swift
//  MVVMDemo
//
//  Created by Liu Tao on 2018/11/29.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    typealias Item = (vc: UIViewController, title: String?, img: UIImage?, selectImg: UIImage?)
    
    static let shared = MainViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let a: Item = (LeftViewController.shared, "aa", nil, nil)
        let b: Item = (RightViewController.shared, "bb", nil, nil)
        let vcArr = [a, b]
        setupItems(vcArr: vcArr)
    }
    
    func setupItems(vcArr: [Item]) {
        
        var navVcArr: [UINavigationController] = []
        
        for (_, item) in vcArr.enumerated() {
            
            let barItem = UITabBarItem(title: item.title,
                                       image: item.img,
                                       selectedImage: item.selectImg)
            let navVC = UINavigationController(rootViewController: item.vc)
            navVC.tabBarItem = barItem
            navVcArr.append(navVC)
        }
        setViewControllers(navVcArr, animated: true)
    }

}
