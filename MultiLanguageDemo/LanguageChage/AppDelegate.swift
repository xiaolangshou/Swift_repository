//
//  AppDelegate.swift
//  LanguageChage
//
//  Created by 杜博 on 2017/1/5.
//  Copyright © 2017年 杜博. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        LanguageHelper.shareInstance.initUserLanguage()

        return true
    }

}

