//
//  AppDelegate.swift
//  B
//
//  Created by lian shan on 2021/6/2.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = ViewController.shared

        return true
    }

    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool
    {
        if url.absoluteString.contains("page1") {
            self.window?.rootViewController = ViewController.shared
        } else if url.absoluteString.contains("page2") {
            self.window?.rootViewController = ViewController2.shared
        } else {
            self.window?.rootViewController = ViewController.shared
        }
        return true
    }


}

