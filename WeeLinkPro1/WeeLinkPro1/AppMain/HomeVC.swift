//
//  ViewController.swift
//  WeeLinkPro1
//
//  Created by Liu Tao on 2020/5/14.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

class HomeVC: UITabBarController {

    // 首页、分类、购物车、我的订单
    static let shared = HomeVC()
    
    var tabArray = [UIViewController]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVCs()
    }
    
    func setupVCs() {
        
        let mainPageBar = UITabBarItem(title: "首页", image: nil
            , selectedImage: nil)
        let categoryBar = UITabBarItem(title: "分类", image: nil
            , selectedImage: nil)
        let cargoBar = UITabBarItem(title: "购物车", image: nil
            , selectedImage: nil)
        let orderFormBar = UITabBarItem(title: "我的订单", image: nil
            , selectedImage: nil)

        MainPageVC.shared.title = "品牌标题"
        let firstNavCon = UINavigationController(rootViewController: MainPageVC.shared)
        firstNavCon.tabBarItem = mainPageBar
        
        CategoryVC.shared.title = "品牌标题"
        let secNavCon = UINavigationController(rootViewController: CategoryVC.shared)
        secNavCon.tabBarItem = categoryBar
        
        CargoVC.shared.title = "品牌标题"
        let thridNavCon = UINavigationController(rootViewController: CargoVC.shared)
        thridNavCon.tabBarItem = cargoBar
        
        OrderFormVC.shared.title = "品牌标题"
        let fourthNavCon = UINavigationController(rootViewController: OrderFormVC.shared)
        fourthNavCon.tabBarItem = orderFormBar

        tabArray.append(firstNavCon)
        tabArray.append(secNavCon)
        tabArray.append(thridNavCon)
        tabArray.append(fourthNavCon)
        
        self.setViewControllers(tabArray, animated: true)
    }

}

