//
//  AppDelegate.swift
//  WeeLinkPro1
//
//  Created by Liu Tao on 2020/5/14.
//  Copyright © 2020 Liu Tao. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        if #available(iOS 13.0, *) {
            print(#function)
        } else {
            //系统版本低于13.0
            self.window = UIWindow.init(frame: UIScreen.main.bounds)
            self.window?.backgroundColor = UIColor.white
            self.window?.makeKeyAndVisible()
            self.window?.rootViewController = UINavigationController(rootViewController: HomeVC.shared)
        }

        return true
    }
}

