//
//  MainTabBarViewController.swift
//  XMLParseDemo
//
//  Created by Liu Tao on 2018/3/14.
//  Copyright © 2018年 Liu Tao. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    static let sharedInstance = MainTabBarViewController()
    
    fileprivate var _jsonBar = UITabBarItem()
    fileprivate var _xmlBar = UITabBarItem()
    fileprivate var _firstNavCon = UINavigationController()
    fileprivate var _secondNavCon = UINavigationController()
    fileprivate var _tabArray = [UIViewController]()
    fileprivate let _jsonVC = JsonViewController.sharedInstance
    fileprivate let _xmlVC = XmlViewController.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabBar()
    }

    fileprivate func setupTabBar() {

        _jsonBar = UITabBarItem(title: "Json", image: UIImage(named: "json")
            , selectedImage: UIImage(named: "json_tap"))
        _xmlBar = UITabBarItem(title: "Xml", image: UIImage(named: "xml")
            , selectedImage: UIImage(named: "xml_tap"))

        _jsonVC.title = "JsonDemo"
        _xmlVC.title = "XmlDemo"
        _firstNavCon = UINavigationController(rootViewController: _jsonVC)
        _secondNavCon = UINavigationController(rootViewController: _xmlVC)
        _firstNavCon.tabBarItem = _jsonBar
        _secondNavCon.tabBarItem = _xmlBar

        _tabArray.append(_firstNavCon)
        _tabArray.append(_secondNavCon)
        self.setViewControllers(_tabArray, animated: true)
    }
}
