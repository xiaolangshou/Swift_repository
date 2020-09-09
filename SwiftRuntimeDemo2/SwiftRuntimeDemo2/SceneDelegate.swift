//
//  SceneDelegate.swift
//  SwiftRuntimeDemo2
//
//  Created by Thomas Lau on 2020/9/8.
//  Copyright © 2020 TLLTD. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions)
    {
        
        guard let s = (scene as? UIWindowScene) else { return }

        /// Swfit中只能替换系统方法，而自定义的方法之间无法进行替换
        window = UIWindow.init(windowScene: s)
        window?.rootViewController = MuixSwiftClass()
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        PureSwiftClass().testPureAction()
    }


}

