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

        let firstNavCon = NavVC(rootViewController: setupTabbarCons(controller: MainPageVC.shared,
                                                                    title: "品牌标题",
                                                                    barTitle: "首页",
                                                                    image: "底部导航_首页0",
                                                                    selectImage: "底部导航_首页1"))
        
        let secNavCon = NavVC(rootViewController: setupTabbarCons(controller: CategoryVC.shared,
                                                                  title: "品牌标题",
                                                                  barTitle: "分类",
                                                                  image: "底部导航_分类0",
                                                                  selectImage: "底部导航_分类1"))
        
        let thridNavCon = NavVC(rootViewController: setupTabbarCons(controller: CargoVC.shared,
                                                                    title: "品牌标题",
                                                                    barTitle: "购物车",
                                                                    image: "底部导航_购物车0",
                                                                    selectImage: "底部导航_购物车1"))
        
        let fourthNavCon = NavVC(rootViewController: setupTabbarCons(controller: OrderFormVC.shared,
                                                                     title: "品牌标题",
                                                                     barTitle: "我的订单",
                                                                     image: "底部导航_我的订单0",
                                                                     selectImage: "底部导航_我的订单1"))

        tabArray.append(firstNavCon)
        tabArray.append(secNavCon)
        tabArray.append(thridNavCon)
        tabArray.append(fourthNavCon)
        
        self.setViewControllers(tabArray, animated: true)
    }
    
    func setupTabbarCons(controller: UIViewController, title: String, barTitle: String, image: String, selectImage: String) -> UIViewController {
        controller.title = title
        controller.tabBarItem.title = barTitle
        controller.tabBarItem.image = UIImage.init(named: image)?.withRenderingMode(.alwaysOriginal)
        controller.tabBarItem.selectedImage = UIImage.init(named: selectImage)?.withRenderingMode(.alwaysOriginal)
        controller.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.hex(0x8DC64F)], for: .selected)
        
        return controller
    }

}

